class CreateTeamAssignments < ActiveRecord::Migration
  def change
    create_table :team_assignments do |t|
      t.integer :person_id
      t.integer :team_id

      t.timestamps
    end

    add_index :team_assignments, :person_id
    add_index :team_assignments, :team_id
    add_index :team_assignments, [:person_id, :team_id], :unique => true
  end
end
