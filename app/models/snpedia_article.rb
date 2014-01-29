class SnpediaArticle < ActiveRecord::Base
  belongs_to :snp, inverse_of: :snpedia_article
end
