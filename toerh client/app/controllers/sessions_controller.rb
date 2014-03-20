class SessionsController < ApplicationController

	layout "home"

	def home
	end

	def create

		auth = request.env['omniauth.auth']
		user = User.find_by_provider_and_uid(auth["provider"], auth["uid"]) || User.create_with_omniauth(auth)

		user.update_with_omniauth(auth)

		url = session[:client_call]
		session[:client_call] = nil
		redirect_to "#{url}?auth_token=#{user.auth_token}&token_expires=#{Rack::Utils.escape(user.token_expires.to_s)}"
	end

	def authenticate
		session[:client_call] = params[:callback]
		redirect_to "/auth/toerh"
	end
end