class CreateSnpediaArticles < ActiveRecord::Migration
  def change
    create_table :snpedia_articles do |t|
      t.integer :revision
      t.integer :run_nr
      t.string :xml
      t.references :snp

      t.timestamps
    end
  end
end
