class DynastyTeamsController < ApplicationController

  def index
    @dynasty_teams = DynastyTeam.all
  end

  def new
    @dynasty_team = DynastyTeam.new
  end

  def create
    @dynasty_team = DynastyTeam.new(dynasty_team_params)
    if @dynasty_team.save
      redirect_to dynasty_teams_path
    else
      render :new
    end
  end

  def show
    @dynasty_team = DynastyTeam.where(id:params[:id]).first()
    @owner = Owner.where(id:@dynasty_team[:owner_id]).first()
    @player_contract = PlayerContract.where(dynasty_team_id:@dynasty_team[:id])
    @quarterbacks = Player.where(player_id:PlayerContract.where(dynasty_team_id:@dynasty_team[:id]).pluck(:player_id), position:'QB')
    @wide_receivers = Player.where(player_id:PlayerContract.where(dynasty_team_id:@dynasty_team[:id]).pluck(:player_id), position:'WR')
    @running_backs = Player.where(player_id:PlayerContract.where(dynasty_team_id:@dynasty_team[:id]).pluck(:player_id), position:'RB')
    @tight_ends = Player.where(player_id:PlayerContract.where(dynasty_team_id:@dynasty_team[:id]).pluck(:player_id), position:'TE' )
    @kickers = Player.where(player_id:PlayerContract.where(dynasty_team_id:@dynasty_team[:id]).pluck(:player_id), position:'K')
    @defenses = Player.where(player_id:PlayerContract.where(dynasty_team_id:@dynasty_team[:id]).pluck(:player_id), position:'DEF')
    @players = Player.where(player_id:PlayerContract.where(dynasty_team_id:@dynasty_team[:id]).pluck(:player_id))

    #@player_contracts = Player.where(player_id:PlayerContract.where(dynasty_team_id:@dynasty_team[:id])
    # @player_contracts.each do |player_contract|
    #   binding.pry
    # end
    # binding.pry
    # @player_contracts = PlayerContract.where()
    # @week = Week.where('week_number' => '0')
    # @rankings = Ranking.all.order('rank').collect { |ranking|  {id: ranking.id, team_id: ranking.team_id, week_id: ranking.week_id, rank: ranking.rank, comment: ranking.comment}}
    # @week_rankings = []
    # @previous_week_rankings = []
    # @rankings.each do |ranking|
    #   if ranking[:week_id] == params[:id].to_i
    #     @week_rankings.push(ranking)
    #   elsif ranking[:week_id] == params[:id].to_i - 1
    #     @previous_week_rankings.push(ranking)
    #   end
    # end
    # @teams = Team.all.collect { |team| {id: team.id, name: team.name, owner: team.owner}}
  end

  def player_params
    params.require(:player).permit(
        :player_id, :esbid, :gsisPlayerId, :name, :position, :teamAbbr, :stats_id
    )
  end

end