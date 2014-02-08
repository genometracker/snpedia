class CreatePublications < ActiveRecord::Migration
  def change
    create_table :publications do |t|
      t.references :snp, index: true
      t.string :title
      t.string :url
      t.text :description

      t.timestamps
    end
  end
end
