class CreateRankings < ActiveRecord::Migration[5.0]
  def change
    create_table :rankings do |t|

      t.integer :team_id, null: false
      t.integer :week_id, null: false
      t.integer :rank
      t.string :comment

      t.timestamps

    end

  end
end
