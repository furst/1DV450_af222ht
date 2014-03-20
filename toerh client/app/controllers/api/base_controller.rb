module Api
	class BaseController < ApplicationController

        protect_from_forgery with: :null_session

		rescue_from Exception, with: :error_message

        before_action :default_format_json

        def default_format_json
            if ( (request.headers["HTTP_ACCEPT"].nil? && params[:format].nil?) ||
                (request.headers["HTTP_ACCEPT"] != "application/xml" && params[:format] != "xml") )
                request.format = "json"
            end
        end

        def error(status, code, message)
            respond_to do |format|
                format.json { render :json => {:response_type => status, :response_code => code, :messages => message, :help => "http://www.addef.se"}.to_json, :status => status }
                format.xml { render :xml => {:response_type => status, :response_code => code, :messages => message, :help => "http://www.addef.se"}.to_xml, :status => status }
            end
        end

        def notfound
            respond_to do |format|
                format.json { render :json => {:message => "Sidan kunde inte hittas", :response => 404}.to_json, :status => 404 }
                format.xml { render :xml => {:message => "Sidan kunde inte hittas", :response => 404}.to_xml, :status => 404 }
            end
        end

        protected
            def error_message
                respond_to do |format|
                    format.json { render :json => {:message => "Ett fel inträffade", :response => 500}.to_json, :status => 500 }
                    format.xml { render :xml => {:message => "Ett fel inträffade", :response => 500}.to_xml, :status => 500 }
                end
            end

        protected
            def current_user
                @user = User.find_by_auth_token(request.headers['HTTP_X_AUTH_TOKEN'])
            end
            helper_method :current_user

        protected
            def restrict_access_login
                user = User.find_by_auth_token(request.headers['HTTP_X_AUTH_TOKEN'])

                if !user
                    error(401, 401, "You don't have permission to use this page")
                else
                    if user.token_expires < Time.now
                        error(401, 401, 'Auth token expired')
                    end
                end
            end

        protected
            def restrict_access_token
                authenticate_or_request_with_http_token do |token, options|
                    user = Apiuser.find_by_access_token(token)
                    if user
                        if user.blocked
                            error(403, 403, 'User is blocked')
                        end
                        if user.count > 5000
                            error(403, 403, 'User has exceeded rate-limit')
                        end
                    end
                        
                    Apiuser.find_and_increment(access_token: token)
                end
            end

	end
end