class SessionsController < ApplicationController

    layout "login"

    def new
        session[:return_to] = params[:return_to] if params[:return_to]
    end

    def create
        user = User.find_by_email(params[:email])
        if user && user.authenticate(params[:password])
            session[:user_id] = user.id
            if session[:return_to]
                redirect_to session[:return_to]
                session[:return_to] = nil
            else
                redirect_to login_path
            end
        else
            flash[:notice] = "Invalid email or password"
            render "new"
        end
    end

    def destroy
        session[:user_id] = nil
        redirect_to login_path, :notice => 'You are now logged out'
    end
end

