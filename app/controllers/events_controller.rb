class EventsController < ApplicationController
  def index
  	@events = Event.all
      authorize @events
  end

  def show
  	@event = Event.find(params[:id])
  end

  def new
    @event = Event.new
      authorize @event
  end

  def create
    @event = Event.new(params.require(:event).permit(:title, :body))
      authorize @event
    if @event.save
      flash[:notice] = "Event was saved."
      redirect_to @event
    else
      flash[:error] = "There was an error saving the event. Please try again."
      render :new
    end
  end

  def edit
    @event = Event.find(params[:id])
      authorize @event
  end

def update
    @event = Event.find(params[:id])
      authorize @event
    if @event.update_attributes(params.require(:event).permit(:title, :body))
      flash[:notice] = "Event was updated."
      redirect_to @event
    else
      flash[:error] = "There was an error saving the event. Please try again."
      render :edit
    end
end

end