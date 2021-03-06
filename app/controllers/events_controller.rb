class EventsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_event, only: [:edit, :update, :destroy]

  def index
    @events = Event.includes(:presences).order(created_at: :desc).page(params[:page])
  end

  def events_current_user
    @events = current_user.events.order(created_at: :desc).page(params[:page])
  end

  def show
    @event = Event.find(params[:id])
  end

  def new
    @event = current_user.events.build
  end

  def edit
    authorize @event
  end

  def create
    Event.transaction do
      @event = current_user.events.build(event_params)
      @event.presences.build(user_id: current_user.id)
      respond_to do |format|
        if @event.save
          @event.post_facebook session[:access_toke], event_url(@event)
          format.html { redirect_to @event, notice: 'Event was successfully created.' }
          format.json { render :show, status: :created, location: @event }
        else
          format.html { render :new }
          format.json { render json: @event.errors, status: :unprocessable_entity }
        end
      end
    end
  end

  def update
    authorize @event
    respond_to do |format|
      if @event.update(event_params)
        format.html { redirect_to @event, notice: 'Event was successfully updated.' }
        format.json { render :show, status: :ok, location: @event }
      else
        format.html { render :edit }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @event.destroy
    respond_to do |format|
      format.html { redirect_to events_url, notice: 'Event was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
  def set_event
    @event = current_user.events.find(params[:id])
  end

  def event_params
    params.require(:event).permit(:photo, :title, :description, :local, :date_time, :enable_facebook_post)
  end
end
