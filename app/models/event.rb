class Event < ActiveRecord::Base
	belongs_to :user
	has_many :presences
	has_attached_file :photo, styles: { 
		medium: "400x300#", 
		banner: "750x500#" 
	}
  validates_attachment_content_type :photo, content_type: /\Aimage\/.*\Z/
  process_in_background :photo, processing_image_url: "/images/original/calendar.jpg"
	validates :title, :description, :date_time, :local, presence: true

	
end
