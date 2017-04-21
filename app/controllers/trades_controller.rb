class TradesController < ApplicationController
  def index
    @players = Player.all
    @dynasty_teams = DynastyTeam.all
    #@player_contracts =PlayerContract.all
    @draft_picks = DraftPick.all
  end

  def update
    binding.pry
  end

  def create
    trade_array = params[:dynasty_team].select{|key, value| value == '1'}.keys
    teams_array = []
    player_contracts =[]
    draft_picks=[]

    trade_array.each do |k, v|
      split_array = k.split('-')
      teams_array.push(split_array[2].to_i) unless teams_array.include?(split_array[2].to_i)
      if split_array[3] == "PlayerContract"
        player_contracts.push(PlayerContract.find_by(id:split_array[4].to_i))
      elsif split_array[3] == "DraftPick"
        draft_picks.push(DraftPick.find_by(id:split_array[4].to_i))
      end
    end
    team_1=DynastyTeam.find_by(id:teams_array[0])
    team_2=DynastyTeam.find_by(id:teams_array[1])

    teams_array
    player_contracts.each do |contract|
      if contract.dynasty_team_id == teams_array[0]
        contract.dynasty_team_id = teams_array[1]
        contract.save!
      else
        contract.dynasty_team_id = teams_array[0]
        contract.save!
      end
    end

    draft_picks.each do |pick|
      if pick.dynasty_team_id == teams_array[0]
        pick.dynasty_team_id = teams_array[1]
        pick.save!
      else
        pick.dynasty_team_id = teams_array[0]
        pick.save!
      end
    end

    redirect_to trades_path
  end

end