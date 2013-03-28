class AddUsersTable < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.text :image
      t.string :password_digest
      t.integer :userable_id
      t.string :userable_type
      t.boolean :is_admin, :default => false
      t.timestamps
    end
  end
end
