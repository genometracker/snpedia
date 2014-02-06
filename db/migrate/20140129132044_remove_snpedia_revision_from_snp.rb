class RemoveSnpediaRevisionFromSnp < ActiveRecord::Migration
  def up
    remove_column :snps, :snpedia_revision
  end

  def down
    add_column :snps, :snpedia_revision, :string
  end
end
