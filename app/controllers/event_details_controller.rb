class EventDetailsController < ApplicationController
	before_action :authenticate_user!
	def create
		@event = Event.find(params[:event_id])
		@event_detail = @event.event_details.where(user_id: current_user.id).first_or_initialize
		@event_detail.status = params[:status]
		@event_detail.save
		render json: {
			status: @event_detail.status, 
			confirm_count: @event.event_confirm_count,
			unconfirm_count: @event.event_unconfirm_count
		}
	end

	def update
		create
	end
end
