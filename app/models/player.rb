class Player < ApplicationRecord
  searchkick

  def self.get_players_from_name_list(list)
    Player.connection.execute('select name, player_id from players where name in ('+list+')')
  end
end
