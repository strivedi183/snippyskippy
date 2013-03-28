class AddMediaMediumTagsTable < ActiveRecord::Migration
  def change
    create_table :media_medium_tags, :id => false do |t|
      t.integer :medium_tag_id
      t.integer :medium_id
    end
  end
end
