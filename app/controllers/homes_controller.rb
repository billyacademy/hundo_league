class HomesController < ApplicationController
  def index
    @weeks = Week.all.order('week_number')
  end
end
