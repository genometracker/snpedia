require 'open-uri'
require 'crack'
require 'resque'
require 'resque_scheduler'

class SnpediaReadSnpsJob

  @queue='read_snpedia_snps'

  LIMIT = 500
  URL = 'http://bots.snpedia.com/api.php?format=xml&action=query&list=categorymembers&cmtitle=Category:Is_a_snp&cmlimit=%{limit}'
  URL_NEXT_PAGE = 'http://bots.snpedia.com/api.php?format=xml&action=query&list=categorymembers&cmtitle=Category:Is_a_snp&cmlimit=%{limit}&cmcontinue=%{start_page}'

  def self.perform(start_page)
    url = URL % {:limit => LIMIT}

    unless start_page==nil
      url = URL_NEXT_PAGE % {:limit => LIMIT, :start_page => start_page}
    end

    data = open(URI.encode(url)).read
    hash = Crack::XML.parse(data)

    next_page = hash['api']['query_continue']['categorymembers']['cmcontinue'].to_s

    hash['api']['query']['categorymembers']['cm'].each do |cm|
      if cm['title'].to_s.start_with?('R')

        snp=Snp.new
        snp.rs_number=cm['title']
        snp.save
      end
    end

    Resque.enqueue_in(5.minutes,SnpediaReadSnpsJob,next_page)

  end

end