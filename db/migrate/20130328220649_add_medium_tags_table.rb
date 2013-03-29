class AddMediumTagsTable < ActiveRecord::Migration
  def change
    create_table :medium_tags do |t|
      t.string :tag
      t.timestamps
    end
  end
end
