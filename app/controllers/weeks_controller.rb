class WeeksController < ApplicationController
  def index
    @weeks = Week.all.collect { |week| [week.week_number] }
  end

  def new
    @week = Week.new
  end

  def create
    @weeks = Week.all.collect { |week| [week.week_number] }
    @team = Week.new(week_params)
    if @team.save
      redirect_to weeks_path
    else
      render :new
    end
  end

  def show
    @week = Week.where('week_number' => '0')
    @rankings = Ranking.all.collect { |ranking|  {id: ranking.id, team_id: ranking.team_id, week_id: ranking.week_id, rank: ranking.rank, comment: ranking.comment}}
    @week_rankings = []
    @rankings.each do |ranking|
      if ranking[:week_id] == params[:id].to_i
        @week_rankings.push(ranking)
      end
    end
    @teams = Team.all.collect { |team| {id: team.id, name: team.name, owner: team.owner}}
  end

  def week_params
    params.require(:week).permit(
        :week_number)
  end

end
