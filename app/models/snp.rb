class Snp < ActiveRecord::Base
  has_one :snpedia_article, inverse_of: :snp
end
