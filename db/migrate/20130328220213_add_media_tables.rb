class AddMediaTables < ActiveRecord::Migration
  def change
    create_table :media do |t|
      t.string :title
      t.text :url
      t.string :type
      t.text :description
      t.integer :stylist_id
      t.timestamps
    end
  end
end
