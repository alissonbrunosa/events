class Event < ActiveRecord::Base
	has_attached_file :photo, styles: { medium: "400x400>", banner: "900x650>" }, default_url: "/images/:style/calendar.jpg"
  validates_attachment_content_type :photo, content_type: /\Aimage\/.*\Z/
	validates :title, :description, :date_start, :local, presence: true
end
