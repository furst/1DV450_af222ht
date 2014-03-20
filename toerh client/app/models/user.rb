class User < ActiveRecord::Base
	has_many :resources
	before_save :generate_access_token

	def self.create_with_omniauth(auth)
    	create! do |user|
      		user.provider = auth["provider"]
      		user.uid = auth["uid"]
      		user.email = auth["info"]["email"]
      		user.token = auth["credentials"]["token"]
      		user.name = auth["info"]["name"]
      		user.token_expires = Time.now + 1.hour
    	end
  	end

  	def update_with_omniauth(auth)
      	self.email = auth["info"]["email"]
      	self.name = auth["info"]["name"]
      	self.token = auth["credentials"]["token"]
      	self.token_expires = Time.now + 1.hour
      	self.save
  	end

  	private
		def generate_access_token
			begin
				self.auth_token = SecureRandom.hex
			end while self.class.exists?(auth_token: auth_token)
		end
end
