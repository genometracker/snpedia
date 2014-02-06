require 'open-uri'
require 'crack'
require 'resque'
require 'resque_scheduler'

class ReadSnpediaMedicalConditionsJob
  @queue = 'read_medical_conditions'
  LIMIT = 500
  URL = 'http://bots.snpedia.com/api.php?format=xml&action=query&list=categorymembers&cmtitle=Category:Is_a_medical_condition&cmlimit=%{limit}'
  URL = 'http://bots.snpedia.com/api.php?format=xml&action=query&list=categorymembers&cmtitle=Category:Is_a_medical_condition&cmlimit=%{limit}&cmcontinue=%{start_page}'

  def self.perform(start_page)

    url = URL % {:limit => LIMIT}

    unless start_page==nil
      url = URL_NEXT_PAGE % {:limit => LIMIT, :start_page => start_page}
    end

    data = open(URI.encode(url)).read

    hash = Crack::XML.parse(data)


    #next_page = hash['api']['query_continue']['categorymembers']['cmcontinue'].to_s

    hash['api']['query']['categorymembers']['cm'].each do |cm|

      mc = MedicalCondition.new
      mc.name = cm['title']
      mc.save

      #snp=Snp.new
      #snp.rs_number=cm['title']
      #snp.save
    end

    #Resque.enqueue_in(5.seconds,ReadSnpediaMedicalConditionsJob,nil)
  end
end