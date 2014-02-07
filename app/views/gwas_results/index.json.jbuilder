json.array!(@gwas_results) do |gwas_result|
  json.extract! gwas_result, :id, :snp_id, :risk_allele, :effect_size, :p_value, :article_url, :article_title
  json.url gwas_result_url(gwas_result, format: :json)
end
