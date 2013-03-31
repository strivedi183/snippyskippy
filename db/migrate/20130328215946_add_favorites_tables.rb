class AddFavoritesTables < ActiveRecord::Migration
  def change
    create_table :favorites do |t|
      t.integer :medium_id
      t.integer :client_id
      t.integer :rank
      t.boolean :is_favorite
      t.timestamps
    end
  end
end
