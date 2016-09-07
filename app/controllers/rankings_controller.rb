class RankingsController < ApplicationController

  def index
    @rankings = Ranking.all.order('rank').collect { |ranking| [ranking.team_id, ranking.week_id, ranking.rank, ranking.comment] }
  end

  def new
    @ranking = Ranking.new
    @teams = Team.all.collect { |team| [team.name, team.owner, team.id] }
    @weeks = Week.all.collect { |week| [week.week_number] }
    @rankings = Array.new(12) {Ranking.new}
    @rank_number = 1

  end

  def create
    @teams = Team.all.collect { |team| [team.name, team.owner, team.id] }
    @weeks = Week.all.collect { |week| [week.week_number] }
    @rankings = params[:rankings].values.collect { |ranking| Ranking.new(ranking)}

    @rankings.each do |ranking|
      ranking.week_id = params["ranking"]["week_id"].to_i
    end


    if @rankings.all?(&:valid?)
      @rankings.each(&:save!)
      redirect_to rankings_path
    else
      render :new
    end

  end
  private

  def ranking_params
    params.require(:ranking).permit(
        :team_id, :week_id, :rank, :comment)
  end

  def team_params
    params.require(:team).permit(
        :id
    )
  end

  def week_params
    params.require(:week).permit(
        :id
    )
  end
end
