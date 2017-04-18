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
    @draft_picks = DraftPick.where(dynasty_team_id:@dynasty_team[:id])
    @current_year = Date.today.year
    # if Date.today < Date.new(@current_year,09,01)
    #   @
    # else

    #end
    @next_year = @current_year + 1
    @two_years_from_now = @next_year + 1
    @draft_picks_this_year = DraftPick.where(dynasty_team_id:@dynasty_team[:id], year:@current_year)
    @draft_picks_next_year = DraftPick.where(dynasty_team_id:@dynasty_team[:id], year:@next_year)
    @draft_picks_two_years_from_now = DraftPick.where(dynasty_team_id:@dynasty_team[:id], year:@two_years_from_now)
    @salary_cap_adjustments = SalaryCapAdjustment.where(cap_sender_id: @dynasty_team[:id]).or(SalaryCapAdjustment.where(cap_recipient_id: @dynasty_team[:id]))
    @net_adjustment = 0
    @salary_cap_adjustments.each do |adjustment|
      if adjustment.cap_sender_id == @dynasty_team.id
        @net_adjustment -= adjustment.cap_adjustment
      else
        @net_adjustment += adjustment.cap_adjustment
      end
    end
    @salary_cap = 300
    @total_player_cost = 0
    @player_contract.each do |contract|
      if contract.current_salary < 15
        @total_player_cost += (contract.current_salary + 1)
        puts Player.where(player_id:contract.player_id).first()[:name] +":" + (contract.current_salary + 1).to_s
      else
        @total_player_cost += (contract.current_salary*1.1).round
        puts Player.where(player_id:contract.player_id).first()[:name] + ":" + (contract.current_salary*1.1).round.to_s
      end
    end
  end

  def player_params
    params.require(:player).permit(
        :player_id, :esbid, :gsisPlayerId, :name, :position, :teamAbbr, :stats_id
    )
  end

end