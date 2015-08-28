class Event < ActiveRecord::Base
	attr_accessor :enable_facebook_post
	belongs_to :user
	has_many :presences
	has_attached_file :photo, 
		default_url: "https://s3-sa-east-1.amazonaws.com/eventsbrazil/default/:style/missing.png",
		styles: { 
			thumb: "350x250#",
			medium: "400x300#", 
			banner: "750x500#" 
		}
  validates_attachment_content_type :photo, content_type: /\Aimage\/.*\Z/
  validates :title, :description, :date_time, :local, presence: true


	def post_facebook token, url
		if enable_facebook_post && token && user.facebook?
			Facebook.new(token).post(self, url)
		end
	end
	
end
