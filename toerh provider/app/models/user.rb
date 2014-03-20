class User < ActiveRecord::Base
	has_many :resources
	has_secure_password

	before_create :generate_uid

	has_many :oauth_applications, class_name: 'Doorkeeper::Application', as: :owner

	private
		def generate_uid
			begin
				self.uid = SecureRandom.hex
			end while self.class.exists?(uid: uid)
		end
end
