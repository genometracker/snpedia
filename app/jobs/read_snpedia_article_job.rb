require 'open-uri'
require 'crack'
require 'nokogiri'
require 'resque'
require 'resque_scheduler'

class ReadSnpediaArticleJob
  @queue = 'read_snpedia_articles'

  def self.perform
    logger=Rails.logger

    snp = Snp.includes(:snpedia_article).where(snpedia_articles: {snp_id: nil}).where(run_nr: nil).first

    snp.run_nr = 1

    snp.save

    logger.info "Getting article for #{snp.rs_number}."

    data= open(URI.encode('http://bots.snpedia.com/api.php?action=parse&format=json&page='+snp.rs_number))

    xml = data.read
    hash = Crack::JSON.parse(xml)

    article = SnpediaArticle.new
    #article.revision = hash['api']['parse']['revid'].to_i
    article.revision = hash['parse']['revid'].to_i
    article.run_nr = 1
    article.snp = snp

    # Skipping this because of MySql error
    article.xml = xml

    article.save


    #html = hash['api']['parse']['text']
    html = hash['parse']['text']

    unless html==nil
      nk = Nokogiri::HTML.parse(html.to_s)

      # Find a table where variants are
      nk.css('.smwtable').each { |table|

        # Find rows of the table and skip the header row
        table.css('tr').drop(1).each {|row|

          # Find variant
          variant=row.css('td')[0].text.strip

          # Remove unneeded characters
          variant=variant.delete '('
          variant=variant.delete ')'
          variant=variant.delete ';'

          ve=VariantEffect.new
          ve.variant=variant
          ve.magnitude=row.css('td')[1].text.strip
          ve.description=row.css('td')[2].text.strip
          ve.snp=snp
          ve.save
        }
      }

    end

    logger.info "#{snp.rs_number} saved to database.'"

    Resque.enqueue_in(5.seconds,ReadSnpediaArticleJob)

  end
end