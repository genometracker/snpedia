class AddSnpsToMedicalConditions < ActiveRecord::Migration
  create_table :medical_conditions_snps do |t|
    t.belongs_to :medical_condition
    t.belongs_to :snp
  end
end
