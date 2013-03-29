class AddClientsTable < ActiveRecord::Migration
  def change
    create_table :clients do |t|
      t.string :address
      t.float :latitude
      t.float :longitude
      t.timestamps
    end
  end
end
