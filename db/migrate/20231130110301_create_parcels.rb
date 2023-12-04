class CreateParcels < ActiveRecord::Migration[6.0]
  def change
    create_table :parcels do |t|
      t.string :name
      t.integer :size
      t.references :garden, foreign_key: true
      t.timestamps
    end
  end
end
