class Player < ApplicationRecord
  # has_one :dynasty_team, primary_key: 'player_id', foreign_key: 'player_id'
  has_one :player_contract, primary_key: 'player_id', foreign_key: 'player_id'
  searchkick

  def self.get_players_from_name_list(list)
    Player.connection.execute('select name, player_id from players where name in ('+list+')')
  end
end
