class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :name
      t.text :description
      t.integer :price_in_cents
      t.integer :rating

      t.timestamps
    end
  end
end
