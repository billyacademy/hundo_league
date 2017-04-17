class CreatePlayers < ActiveRecord::Migration[5.0]
  def change
    create_table :players do |t|

      t.integer :player_id, null: false
      t.string :esbid
      t.string :gsisPlayerId
      t.string :name
      t.string :position
      t.string :teamAbbr
      t.integer :stats_id

      t.timestamps

    end
  end
end
