class Owners < ApplicationController

  def index
  end

  def new
    @owner = Owner.new
  end

  def create
    @owner = Owner.new(player_params)
    if @owner.save
      redirect_to owners_path
    else
      render :new
    end
  end

  def owner_params
    params.require(:player).permit(
        :first_name, :last_name, :email
    )
  end

end
