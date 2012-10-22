class CreateAlbumTable < ActiveRecord::Migration
  def up
    create_table :albums do |t|
      t.integer :user_id
      t.string  :title
      t.string  :artist
      t.integer :year

      t.timestamps
    end
  end

  def down
    drop_table :albums
  end
end