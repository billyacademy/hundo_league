class TradesController < ApplicationController
  def index
    @players = Player.all
    @dynasty_teams = DynastyTeam.all
    @draft_picks = DraftPick.all
    @current_year = Date.today.year
  end

  def update
    binding.pry
  end

  def create
    trade_array = params[:dynasty_team].select{|key, value| value == '1'}.keys
    salary_cap_array = params[:dynasty_team].select{|key, value| !value.blank? && value != '0' && !key.include?('PlayerContract') && !key.include?('DraftPick')}
    teams_array = []
    player_contracts =[]
    draft_picks=[]

    salary_cap_array.each do |key, value|
      split_array = key.split('-')
      teams_array.push(split_array[2].to_i) unless teams_array.include?(split_array[2].to_i)
    end

    trade_array.each do |k, v|
      split_array = k.split('-')
      teams_array.push(split_array[2].to_i) unless teams_array.include?(split_array[2].to_i)
      if split_array[3] == "PlayerContract"
        player_contracts.push(PlayerContract.find_by(id:split_array[4].to_i))
      elsif split_array[3] == "DraftPick"
        draft_picks.push(DraftPick.find_by(id:split_array[4].to_i))
      # elsif split_array[3] == "SalaryCapAdjustment"
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

    salary_cap_array.each do |transaction_details, amount|
      split_array = transaction_details.split('-')
      binding.pry
      if split_array[2].to_i == teams_array[0]
        SalaryCapAdjustment.create(cap_recipient_id: DynastyTeam.find_by(id: teams_array[1]).id,
                                   cap_sender_id: DynastyTeam.find_by(id: teams_array[0]).id,
                                   year: split_array[4],
                                   cap_adjustment: amount.to_i,
                                   comments: Owner.find_by(id:DynastyTeam.find_by(id: teams_array[0]).owner_id).first_name +
                                       ' sends $' + amount.to_s + ' to ' +
                                       Owner.find_by(id:DynastyTeam.find_by(id: teams_array[1]).owner_id).first_name)
      else
        SalaryCapAdjustment.create(cap_recipient_id: DynastyTeam.find_by(id: teams_array[0]).id,
                                   cap_sender_id: DynastyTeam.find_by(id: teams_array[1]).id,
                                   year: split_array[4],
                                   cap_adjustment: amount.to_i,
                                   comments: Owner.find_by(id:DynastyTeam.find_by(id: teams_array[1]).owner_id).first_name +
                                       ' sends $' + amount.to_s + ' to ' +
                                       Owner.find_by(id:DynastyTeam.find_by(id: teams_array[0]).owner_id).first_name)
      end
    end


    redirect_to trades_path
  end

end