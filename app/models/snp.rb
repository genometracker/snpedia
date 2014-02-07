class Snp < ActiveRecord::Base
  has_one :snpedia_article, inverse_of: :snp
  has_many :variant_effects
  has_many :gwas_results
  has_and_belongs_to_many :medical_conditions

  def to_s
    rs_number
  end
end
