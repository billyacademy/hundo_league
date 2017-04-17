class CreatePlayerContracts < ActiveRecord::Migration[5.0]
  def change
    create_table :player_contracts do |t|
      t.integer :player_id
      t.integer :dynasty_team_id
      t.integer :contract_type_id
      t.integer :first_year
      t.boolean :is_top_fourteen
      t.integer :current_salary

      t.timestamps

    end
  end
end
