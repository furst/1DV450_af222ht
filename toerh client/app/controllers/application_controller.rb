class ApplicationController < ActionController::Base
    # Prevent CSRF attacks by raising an exception.
    # For APIs, you may want to use :null_session instead.
    protect_from_forgery

    skip_before_filter :verify_authenticity_token, :only => [:options]

    #before_filter :set_cache_buster
    before_filter :set_cors_headers

    def set_cors_headers
    	headers['Access-Control-Allow-Origin'] = '*' 
        headers['Access-Control-Allow-Methods'] = 'POST, PUT, DELETE, GET, OPTIONS'
        headers['Access-Control-Request-Method'] = '*' 
        headers['Access-Control-Allow-Headers'] = 'Origin, X-Requested-With, Content-Type, Accept, Authorization, X-auth-token'

    end

	def set_cache_buster
		response.headers["Cache-Control"] = "no-cache, no-store, max-age=0, must-revalidate"
		response.headers["Pragma"] = "no-cache"
	    response.headers["Expires"] = "Fri, 01 Jan 1990 00:00:00 GMT"
	end
end
