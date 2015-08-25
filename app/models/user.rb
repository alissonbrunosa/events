class User < ActiveRecord::Base
	has_many :events
	has_many :presences
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

end
