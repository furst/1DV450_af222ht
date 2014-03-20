module Dev
	class BaseController < ApplicationController

		#rescue_from Exception, with: :error_message

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

        private
            def current_user
                @current_user ||= Apiuser.find(session[:apiuser_id]) if session[:apiuser_id]
            end
            helper_method :current_user

        private
            def current_admin
                current_user ||= Apiuser.find(session[:apiuser_id]) if session[:apiuser_id]
                if current_user
                    if current_user.is_admin
                        @current_admin = current_user
                    end
                end
            end
            helper_method :current_admin

	end
end