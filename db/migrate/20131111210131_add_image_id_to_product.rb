class AddImageIdToProduct < ActiveRecord::Migration
  def change
    add_column :products, :image_id, :integer
  end
end
