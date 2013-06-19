class CreatePeople < ActiveRecord::Migration
  def change
    create_table :people do |t|
      t.string :name, :null => false
      t.string :email, :null => false
      t.integer :buddy_id
      t.timestamps
    end

    add_index :people, :name, :unique => true
  end
end
