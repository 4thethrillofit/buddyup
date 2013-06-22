class CreateBuddyPairs < ActiveRecord::Migration
  def change
    create_table :buddy_pairs do |t|
      t.integer :team_id, :null => false
      t.integer_array :permutation, :null => false
      t.timestamps
    end

    add_index :buddy_pairs, :team_id
  end
end
