class TeamsController < ApplicationController

  def index
    @teams = Team.all.collect { |team| [team.name, team.owner] }
  end

  def new
    @team = Team.new
  end

  def create
    @teams = Team.all.collect { |team| [team.name, team.owner] }
    @team = Team.new(team_params)
    #team.e_id = params["concert"]["venue_id"].to_i
    if @team.save
      redirect_to teams_path
    else
      render :new
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
      # Handle a successful update.
    else
      render 'edit'
    end
  end
  private

  def team_params
    params.require(:team).permit(
        :name, :owner)
  end
end