class AddMagnitudeToVariantEffect < ActiveRecord::Migration
  def change
    add_column :variant_effects, :magnitude, :string
  end
end
