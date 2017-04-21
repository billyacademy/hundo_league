class PlayersController < ApplicationController

  def index
    # @players = HTTParty.get("http://api.fantasy.nfl.com/v1/players/stats?statType=seasonStats&format=json")
    # @dumpPlayerData = player_data_dump
    #@players = Player.all
    if params[:query].present?
      @players = Player.search(params[:query], page: params[:page])
    else
      @players = Player.all.page params[:page]
    end
  end

  def customview
    @count = 1
    @draft_picks = [
    'DAN',
    'ALEX',
    'GOAT',
    'ROB',
    'JONO',
    'ADAM',
    'NATE',
    'BILLY',
    'PEALER',
    'BRENDAN',
    'JUSTIN',
    'BARD',
    'FISCHETTI',
    'DEREK'
    ]
  end

  def new
    @player = Player.new
  end

  def edit
    @player = Player.where(id:params[:id]).first()
    @player_contract = PlayerContract.where(player_id:@player[:player_id]).first()
    if @player_contract != nil
      @contract_type = ContractType.where(id:@player_contract.contract_type_id).first()
      @team = DynastyTeam.where(id:@player_contract.dynasty_team_id).first()
    end
  end

  def create
    @team = Team.new(player_params)
    if @team.save
      redirect_to teams_path
    else
      render :new
    end
  end

  def show
    @player = Player.where(id:params[:id]).first()
    @player_contract = PlayerContract.where(player_id:@player[:player_id]).first()
    if @player_contract != nil
      @contract_type = ContractType.where(id:@player_contract.contract_type_id).first()
      @team = DynastyTeam.where(id:@player_contract.dynasty_team_id).first()
    end
    binding.pry
  end

  def update
    player_contract = PlayerContract.find_by(player_id:player_contract_params[:player_id])
    if player_contract == nil
      binding.pry
      @player_contract = PlayerContract.new(player_contract_params)
      if @player_contract.save
        redirect_to player_path
      else
        flash["Did not save"]
      end
    else
      PlayerContract.update(player_contract.id, player_contract_params)
      redirect_to player_path
    end
  end

  def player_data_dump
    dump = DumpDataService.new

    dump.dump_players
  end

  def autocomplete
    #render json: Player.search(params[:query], autocomplete: true, limit: 10).map(&:name)
  end

  def player_params
    params.require(:player).permit(
      :player_id, :esbid, :gsisPlayerId, :name, :position, :teamAbbr, :stats_id, :id
    )
  end
  def player_contract_params
    params.require(:player_contract).permit(
        :player_id, :dynasty_team_id, :contract_type_id, :first_year, :is_top_fourteen, :current_salary
    )
  end

end
