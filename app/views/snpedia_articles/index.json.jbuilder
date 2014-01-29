json.array!(@snpedia_articles) do |snpedia_article|
  json.extract! snpedia_article, :id, :revision, :run_nr, :xml, :references
  json.url snpedia_article_url(snpedia_article, format: :json)
end
