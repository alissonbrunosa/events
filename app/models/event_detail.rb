class EventDetail < ActiveRecord::Base
	enum status: [:not_response, :confirm, :unconfirm]
  belongs_to :user
  belongs_to :event
	after_save :reset_counters
	after_destroy :reset_counters

	private
		def reset_counters
			puts "Entrou"
			event = self.event
			confirm = event.event_details.where(status: 1).count
			unconfirm = event.event_details.where(status: 2).count
			puts confirm
			puts unconfirm
			event.event_confirm_count = confirm
	    event.event_unconfirm_count = unconfirm
	    event.save
		end
end
