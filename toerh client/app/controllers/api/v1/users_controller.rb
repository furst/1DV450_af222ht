module Api
	module V1
		class UsersController < BaseController
			before_filter :restrict_access_token

			respond_to :xml, :json

			def index
				if params[:limit]
					@users = User.page(params[:page]).per(params[:limit])
				else
					@users = User.page(params[:page])
				end
			end

			def show
        		@user = User.find(params[:id])

        		rescue
        			error(404, 404, 'Resursen hittades inte')
      		end

      		def resources
				@resources = User.find_by_id(params[:id]).resources

				if params[:limit]
					@resources = @resources.page(params[:page]).per(params[:limit])
				else
					@resources = @resources.page(params[:page])
				end

        		rescue
        			render_404
			end

		    private
			    def render_404
	  				error(404, 404, 'The user could not be found')
				end
		end
	end
end