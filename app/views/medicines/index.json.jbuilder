json.array!(@medicines) do |medicine|
  json.extract! medicine, :id, :title, :description
  json.url medicine_url(medicine, format: :json)
end
