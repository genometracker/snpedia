require 'open-uri'
require 'crack'

class ReadSnpediaArticleJob
  @queue = 'read_snpedia_articles'

  def self.perform
    logger=Rails.logger

    snp=Snp.includes(:snpedia_article).where(snpedia_articles: {snp_id: nil}).first

    logger.info "Getting article for #{snp.rs_number}."

    data= open(URI.encode('http://bots.snpedia.com/api.php?action=parse&format=xml&page='+snp.rs_number))

    xml = data.read
    hash = Crack::XML.parse(xml)

    article = SnpediaArticle.new
    article.revision = hash['api']['parse']['revid'].to_i
    article.run_nr = 1
    article.snp = snp
    article.xml = xml

    article.save

    logger.info "#{snp.rs_number} saved to database.'"

  end
end