json.array!(@snps) do |snp|
  json.extract! snp, :id, :rs_number, :snpedia_revision
  json.url snp_url(snp, format: :json)
end
