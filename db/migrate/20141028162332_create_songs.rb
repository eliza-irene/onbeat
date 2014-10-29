class CreateSongs < ActiveRecord::Migration
  def change
    create_table :songs do |t|
      t.string :name
      t.string :artist
      t.float :bpm
      t.string :mood
      t.string :genre
      t.integer :playlist_id

      t.timestamps
    end
  end
end
