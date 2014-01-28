class CreateSnps < ActiveRecord::Migration
  def change
    create_table :snps do |t|
      t.string :rs_number
      t.string :snpedia_revision

      t.timestamps
    end
  end
end
