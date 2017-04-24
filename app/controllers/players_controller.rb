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
    respond_to do |format|

      @player = Player.new

      format.html
      format.json { render json: @player }

    end
  end

  def edit
    @player = Player.find_by(id:params[:id])
    @player_contract = PlayerContract.find_by(player_id:@player[:player_id])
    if @player_contract != nil
      @contract_type = ContractType.find_by(id:@player_contract.contract_type_id)
      @team = DynastyTeam.find_by(id:@player_contract.dynasty_team_id)
    end
  end

  def create
    if params['player']['name'] == nil
      @player_id = params[:player][:id]
    else
      new_player = Player.new(
        player_id: params['player']['player_id'].to_i,
        esbid: params['player']['esbid'],
        gsisPlayerId: params['player']['gsisPlayerId'],
        name: params['player']['name'],
        position: params['player']['position'],
        teamAbbr: params['player']['teamAbbr']
      )
      if new_player.save
        flash[:notice] = 'Player has been successfully added'
        redirect_to new_player_path
      else
        flash[:success] = 'Try again.'
        redirect_to new_player_path
      end
    end
    if params["commit"] != 'Add Player'
      @player_json = HTTParty.get("http://api.fantasy.nfl.com/v1/players/details?playerId="+@player_id)
      @player_json = @player_json["players"][0]
      respond_to do |format|
        format.js { render 'players/show_update'}
      end
    end
  end

  def show
    @player = Player.find_by(id:params[:id])
    @player_contract = PlayerContract.find_by(player_id:@player[:player_id])
    if @player_contract != nil
      @contract_type = ContractType.find_by(id:@player_contract.contract_type_id)
      @team = DynastyTeam.find_by(id:@player_contract.dynasty_team_id)
    end
  end

  def update
    player_contract = PlayerContract.find_by(player_id:player_contract_params[:player_id])
    if player_contract == nil
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
