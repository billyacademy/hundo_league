class CreateTeams < ActiveRecord::Migration[5.0]
  def change
    create_table :teams do |t|
      t.string :name,           null: false, default: ""
      t.string :owner,         null: false, default: ""

      t.timestamps
    end
  end
end
