module Api
	module V1
		class LicensesController < BaseController
			before_filter :restrict_access_token

			respond_to :xml, :json

			def index
				if params[:limit]
					@licenses = License.page(params[:page]).per(params[:limit])
				else
					@licenses = License.page(params[:page])
				end
			end

			def show
        		@license = License.find(params[:id])

        		rescue
        			error(404, 404, 'The resource could not be found')
      		end

      		def resources
				@resources = License.find_by_id(params[:id]).resources

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