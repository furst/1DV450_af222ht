module Dev
	module V1
		class ApiusersController < BaseController
			before_action :require_login, only: [:account]
			before_action :require_admin, only: [:users]

			before_action :default_format_html

			layout "application"

			def login
			end

			def account
				apiuser = current_user
				@token = apiuser.access_token
				@email = apiuser.email
				@name = apiuser.name
				@count = apiuser.count
			end

			def register
				@apiuser = Apiuser.new
			end

			def create
				@apiuser = Apiuser.new(apiuser_params)
				if @apiuser.save
					session[:apiuser_id] = @apiuser.id
					redirect_to dev_account_path
				else
					render 'register'
				end
			end

			def post_login
				apiuser = Apiuser.find_by_email(params[:email])
				if apiuser && apiuser.authenticate(params[:password])
			    	session[:apiuser_id] = apiuser.id
			    	redirect_to dev_account_path
			  	else
			  		flash[:notice] = "Invalid email or password"
			    	render 'login'
		  		end
			end

			def logout
				session[:apiuser_id] = nil
				redirect_to dev_login_path, :notice => 'Utloggad'
			end

			def users
				@apiusers = Apiuser.where(is_admin: '0')
			end

			def edit
				@apiuser = Apiuser.find(params[:id])
			end

			def update
				@apiuser = Apiuser.find(params[:id])

				if @apiuser.update(apiuser_params)
		    		redirect_to dev_userslist_path, :notice => 'Användare uppdaterad'
		  		else
		    		render 'edit'
		  		end
			end

			def destroy
		  		@apiuser = Apiuser.find(params[:id])
		  		@apiuser.destroy
		 
		  		redirect_to dev_userslist_path
			end

			private
				def apiuser_params
					params.require(:apiuser).permit(:email, :password, :password_confirmation, :blocked)
				end

			private
				def require_login
					if current_user.nil? then
						redirect_to dev_login_path
					end
				end

			private
				def require_admin
					if current_admin.nil? then
						redirect_to dev_login_path
					end
				end

			def default_format_html
		        request.format = "html"
		    end
		end
	end
end


