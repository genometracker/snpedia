class ChangeSnpediaArticleXmlColumnType < ActiveRecord::Migration
  def up
    remove_column :snpedia_articles, :xml
    add_column :snpedia_articles, :xml, :text
  end

  def down
    remove_column :snpedia_articles, :xml
    add_column :snpedia_articles, :xml, :string
  end
end
