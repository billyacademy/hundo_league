class CreateDraftPicks < ActiveRecord::Migration[5.0]
  def change
    create_table :draft_picks do |t|
      t.integer :dynasty_team_id
      t.integer :year
      t.integer :round
      t.integer :pick
      t.text :comments
    end
  end
end
