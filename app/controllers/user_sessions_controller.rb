class UserSessionsController < ApplicationController
    skip_before_filter :require_login, only: [:new, :create]
    
    # GET /login
    def new
        @user_session = UserSession.new
    end
    
    # POST /user_session
    def create
        @user_session = UserSession.new(params[:user_session])
        
        if @user_session.save
            redirect_to root_url
            else
            render action: :new
        end
    end
    
    # DELETE /logout
    def destroy
        current_user_session.destroy
        redirect_to login_url
    end
end
