class DumpDataService
  def initialize
  end

  def dump_players
    players2014 = HTTParty.get("http://api.fantasy.nfl.com/v1/players/stats?statType=seasonStats&season=2014&format=json")
    players2014['players'].each do |player|
      if Player.exists?(:player_id => player['id'])
      else
        new_player = Player.new(
            player_id:player['id'],
            esbid:player['esbid'],
            gsisPlayerId:player['gsisPlayerId'],
            name:player['name'],
            position:player['position'],
            teamAbbr:player['teamAbbr'],
            stats_id:nil
        )
        new_player.save
      end
    end

    players2015 = HTTParty.get("http://api.fantasy.nfl.com/v1/players/stats?statType=seasonStats&season=2015&format=json")
    players2015['players'].each do |player|
      if Player.exists?(:player_id => player['id'])
      else
        new_player = Player.new(
            player_id:player['id'],
            esbid:player['esbid'],
            gsisPlayerId:player['gsisPlayerId'],
            name:player['name'],
            position:player['position'],
            teamAbbr:player['teamAbbr'],
            stats_id:nil
        )
        new_player.save
      end
    end

    players2016 = HTTParty.get("http://api.fantasy.nfl.com/v1/players/stats?statType=seasonStats&format=json")
    players2016['players'].each do |player|
      if Player.exists?(:player_id => player['id'])
      else
        new_player = Player.new(
            player_id:player['id'],
            esbid:player['esbid'],
            gsisPlayerId:player['gsisPlayerId'],
            name:player['name'],
            position:player['position'],
            teamAbbr:player['teamAbbr'],
            stats_id:nil
        )
        new_player.save
      end
    end
  end

end