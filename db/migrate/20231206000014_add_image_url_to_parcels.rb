class AddImageUrlToParcels < ActiveRecord::Migration[7.1]
  def change
    add_column :parcels, :image_url, :string
  end
end
