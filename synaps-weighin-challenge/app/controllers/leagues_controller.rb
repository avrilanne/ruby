class LeaguesController < ApplicationController
  def index
    @leagues = League.all.order(:id)
  end

  def show
    @league = League.find(params[:id])
    @events = @league.participating_events
  end

  def create
    @league = League.create(league_params)
    redirect_to league_path
  end

  private

  def league_params
    params.require(:league).permit(:name)
  end
end
