module Api
	module V1
		class ResourcesController < BaseController
			before_filter :restrict_access_login, :only => [:create, :update, :destroy]
			before_filter :restrict_access_token

			respond_to :xml, :json

			def cors
			end

			def index
				if params[:limit]
					@resources = Resource.page(params[:page]).per(params[:limit])
				else
					@resources = Resource.page(params[:page])
				end
			end

			def show
        		@resource = Resource.find(params[:id])

        		rescue
        			error(404, 404, 'Resursen hittades inte')
      		end

      		def create
        		@resource = Resource.new(resource_params)

        		if @resource.save
        		else
        			validation_error(@resource.errors.messages) and return
        		end

        		if(params.has_key?(:tags))
        			tags = params[:tags].split(",").map(&:to_i)

        			for tag in tags
					  	@tagging = Tagging.create(:resource_id => @resource.id, :tag_id => tag)
						@tagging.save
					end
        		end

        		respond_with @resource, status: 201

        		rescue
        			error(500, 500, 'Ett oväntat fel inträffade')
		    end

		    def update
		    	resource = Resource.find_by_id(params[:id])
		    	
		    	if resource.user_id != current_user.id
		    		error(403, 403, 'The resource belongs to another user') and return
		    	end

		    	if(params.has_key?(:tags))
			    	Tagging.destroy_all(:resource_id => new_resource.id)
			     	tags = params[:tags].split(",").map(&:to_i)

					for tag in tags
					  	@tagging = Tagging.create(:resource_id => new_resource.id, :tag_id => tag)
						@tagging.save
					end
				end

		        if resource.update(resource_params)
        		else
        			validation_error(resource.errors.messages) and return
        		end

		        respond_with @resource, status: 204

		    	rescue
		    		render_404
		    end

		    def destroy

		    	resource = Resource.find_by_id(params[:id])
		    	
		    	if resource.user_id != current_user.id
		    		error(403, 403, 'The resource belongs to another user') and return
		    	end

		        respond_with Resource.destroy(params[:id])
		        rescue
		    		render_404
		    end

		    private
			    def render_404
	  				error(404, 404, 'The resource could not be found')
				end

			private
			    def validation_error(message)
	  				error(422, 422, message)
				end

		    private
		  		def resource_params
		  			user = User.find_by_auth_token(request.headers['HTTP_X_AUTH_TOKEN'])
		  			params[:user_id] = user.id
		        	params.permit(:name, :description, :url, :license_id, :resource_type_id, :user_id)
		      	end
		end
	end
end