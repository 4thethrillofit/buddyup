class CreateBuddyPairs < ActiveRecord::Migration
  def change
    create_table :buddy_pairs do |t|
      t.integer :team_id, :null => false
      t.integer_array :permutation, :null => false
      t.boolean :has_been_assigned, :default => false, :null => false
      t.timestamps
    end

    add_index :buddy_pairs, :team_id
    add_index :buddy_pairs, [:permutation, :team_id]
  end
end
