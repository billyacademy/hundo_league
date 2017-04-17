class CreateDynastyTeam < ActiveRecord::Migration[5.0]
  def change
    create_table :dynasty_teams do |t|
        t.integer :owner_id
        t.string :team_name

        t.timestamps
    end
  end
end
