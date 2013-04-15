class AddBioColumnToStylistsTable < ActiveRecord::Migration
  def change
    add_column :stylists, :bio, :text
  end
end
