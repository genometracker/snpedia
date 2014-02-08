json.array!(@publications) do |publication|
  json.extract! publication, :id, :snp_id, :title, :url, :description
  json.url publication_url(publication, format: :json)
end
