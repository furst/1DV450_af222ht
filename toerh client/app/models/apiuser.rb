class Apiuser < ActiveRecord::Base
	has_secure_password
	before_create :generate_access_token

	validates :email, presence: true,
						:uniqueness => true,
						:format => {:with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i}
	validates :password, :presence => true,
                       	:confirmation => true,
                       	:length => {:within => 6..40},
                       	:on => :create

	private
		def generate_access_token
			begin
				self.access_token = SecureRandom.hex
			end while self.class.exists?(access_token: access_token)
		end

	def self.find_and_increment(conditions = :none)
	  	if object = where(conditions).first
	    	object.increment!(:count)
	  	end
	end
end
