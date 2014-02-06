class AddRunNrToSnp < ActiveRecord::Migration
  def change
    add_column :snps, :run_nr, :integer
  end
end
