class CreateBookmarks < ActiveRecord::Migration[7.1]
  def change
    create_table :bookmarks do |t|
      t.references :garden, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
