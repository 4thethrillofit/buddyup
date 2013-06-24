class CreatePeople < ActiveRecord::Migration
  def change
    create_table :people do |t|
      t.string :name, :null => false
      t.string :email, :null => false
      t.integer :buddy_pair_id
      t.timestamps
    end

    add_index :people, :email, :unique => true
  end
end
