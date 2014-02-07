class CreateMedicines < ActiveRecord::Migration
  def change
    create_table :medicines do |t|
      t.string :title
      t.text :description

      t.timestamps
    end
  end
end
