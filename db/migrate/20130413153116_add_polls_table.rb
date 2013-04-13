class AddPollsTable < ActiveRecord::Migration
  def change
    create_table :polls do |t|
      t.integer :client_id
      t.integer :rank_1_medium_id
      t.integer :rank_2_medium_id
      t.integer :rank_3_medium_id
      t.integer :vote_1, :default => 0
      t.integer :vote_2, :default => 0
      t.integer :vote_3, :default => 0
      t.boolean :is_active, :default => true
      t.timestamps
    end
  end
end
