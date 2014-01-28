require 'open-uri'
require 'crack'

class SnpediaReadSnpDetailsJob
  @queue = 'read_snp_details'

  def work
    snp=Snp.find_by snpedia_revision: nil

    data= open(URI.encode('http://bots.snpedia.com/api.php?action=parse&format=xml&page='+snp.rs_number))

    hash = Crack::XML.parse(data.read)

    snp.snpedia_revision=hash['api']['parse']['revid']

    page = hash['api']['parse']['text']

  end
end