class AddImagesToProduct < ActiveRecord::Migration
  def change
    add_column :products, :image1, :string
    add_column :products, :image2, :string
    add_column :products, :image3, :string
    add_column :products, :image4, :string
    add_column :products, :image5, :string
  end
end
