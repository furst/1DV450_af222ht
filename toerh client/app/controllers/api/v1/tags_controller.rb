module Api
	module V1
		class TagsController < BaseController
			before_filter :restrict_access_token

			respond_to :xml, :json

			def index
				if params[:limit]
					@tags = Tag.page(params[:page]).per(params[:limit])
				else
					@tags = Tag.page(params[:page])
				end
			end

			def show
        		@tag = Tag.find(params[:id])

        		rescue
        			error(404, 404, 'Resursen hittades inte')
      		end

      		def resources
				@resources = Tag.find_by_id(params[:id]).resources

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