class EventsController < ApplicationController
  def index
    @events = Event.all.order(:id)
  end

  def show
    @event = Event.first if !params[:id]
    @event = Event.find(params[:id]) if params[:id]
    if params[:league_id]
      @participants = @event.people.where(league_id: params[:league_id])
      @league = League.find(params[:league_id]).name
    else
      @participants = @event.people
    end
  end

  def create
    @event = Event.create(event_params)
    redirect_to people_path
  end

  private

  def event_params
    params.require(:event).permit(:name, :tagline)
  end
end
