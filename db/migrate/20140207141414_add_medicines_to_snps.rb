class AddMedicinesToSnps < ActiveRecord::Migration
  def change
    create_table :medicines_snps do |t|
      t.belongs_to :medicine
      t.belongs_to :snp
    end
  end
end
