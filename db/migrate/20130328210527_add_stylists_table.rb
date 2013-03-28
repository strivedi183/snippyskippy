class AddStylistsTable < ActiveRecord::Migration
  def change
    create_table :stylists do |t|
      t.integer :salon_id
      t.timestamps
    end
  end
end
