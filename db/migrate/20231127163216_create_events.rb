class CreateEvents < ActiveRecord::Migration[7.1]
  def change
    create_table :events do |t|
      t.references :garden, null: false, foreign_key: true
      t.text :description
      t.string :name
      t.date :date
      t.integer :max_attendees

      t.timestamps
    end
  end
end
