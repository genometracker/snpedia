json.array!(@snps) do |snp|
  json.extract! snp, :id, :rs_number
  json.url snp_url(snp, format: :json)
end
