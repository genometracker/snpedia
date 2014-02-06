class CreateVariantEffects < ActiveRecord::Migration
  def change
    create_table :variant_effects do |t|
      t.references :snp, index: true
      t.string :variant
      t.string :description

      t.timestamps
    end
  end
end
