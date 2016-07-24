class ApplicationController < ActionController::Base
  helper :all
  protect_from_forgery
  helper_method :current_user_session, :current_user
  filter_parameter_logging :password, :password_confirmation
  before_filter :set_cache_buster
  before_filter :require_login
  def set_cache_buster
    response.headers["Cache-Control"] = "no-cache, no-store, max-age=0, must-revalidate"
    response.headers["Pragma"] = "no-cache"
    response.headers["Expires"] = "Fri, 01 Jan 1990 00:00:00 GMT"
  end
  def change_password
		if params[:old_password]
			@userlogin = current_user.userlogin
			if @userlogin.valid_password?(params[:old_password])
				if params[:password]==params[:password_confirm]
		 			@userlogin.update_attribute(:password,params[:password])
					flash[:notice]="Password changed successfully"
					redirect_to company_home_path
				else
					flash[:error]="Passwords didn't match"
				end
			else
				flash[:error]="Password authentication is failed, Please try again"
			end
		end
	end
  private
    def current_user_session
      return @current_user_session if defined?(@current_user_session)
      @current_user_session = UserloginSession.find
    end

    def current_user
      if defined?(@current_user)
        return @current_user
      end
      @userlogin =  current_user_session && current_user_session.record
      if @userlogin.nil?
        return nil
     end
     @current_user = @userlogin.loginable
    end

    def require_login
      @user=current_user
      unless @user
        store_location
        flash[:error] = "You must be logged in to access this page"
        redirect_to login_path
        return false
      end
    end
    def require_no_login
      if current_user
        redirect_to home_path
      end
    end

    def is_admin?
      if require_login
        if current_user.class=="Admin"
          redirect_to admin_home_path
        else
          return false
        end
      end
    end
    
    
    def store_location
      session[:return_to] = request.request_uri
    end
    def redirect_back_or_default(default)
      redirect_to(session[:return_to] || default)
      session[:return_to] = nil
    end
end

