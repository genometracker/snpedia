class MedicalCondition < ActiveRecord::Base
  has_and_belongs_to_many :snps
end
