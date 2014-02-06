json.array!(@variant_effects) do |variant_effect|
  json.extract! variant_effect, :id, :snp_id, :variant, :description
  json.url variant_effect_url(variant_effect, format: :json)
end
