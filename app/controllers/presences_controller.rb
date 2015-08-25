class PresencesController < ApplicationController
  before_action :authenticate_user!
  def create
  	@event = Event.find(params[:event_id])
  	@presence = @event.presences.where(user_id: current_user.id).first_or_create
  	render json: {presences_count: @event.presences_count}
  end

  def destroy
  	event = Event.find(params[:event_id])
  	event.presences.where(user_id: current_user.id).first.destroy
  	event.reload
  	render json: {presences_count: event.presences_count}
  end
end
