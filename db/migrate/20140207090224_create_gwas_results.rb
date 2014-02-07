class CreateGwasResults < ActiveRecord::Migration
  def change
    create_table :gwas_results do |t|
      t.references :snp, index: true
      t.string :risk_allele
      t.string :effect_size
      t.string :p_value
      t.string :article_url
      t.string :article_title

      t.timestamps
    end
  end
end
