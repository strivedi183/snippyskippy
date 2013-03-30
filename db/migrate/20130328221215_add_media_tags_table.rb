class AddMediaTagsTable < ActiveRecord::Migration
  def change
    create_table :media_tags, :id => false do |t|
      t.integer :tag_id
      t.integer :medium_id
    end
  end
end
