# Login, logout
require 'net/imap.rb'
class UserloginSessionsController < ApplicationController
  skip_before_filter :require_login,:except => ['destroy']
  before_filter :require_no_login,:except => ['destroy']
  layout :change_layout

  def new
    @login_session = UserloginSession.new
  end

  def create
    @login_session = UserloginSession.new(params[:userlogin_session])
    if @login_session.save
      redirect_back_or_default home_path
    else
      @errormsg = ""
      @login_session.errors.each do |attr,msg|

        if attr == 'base'
          @error_attr = ""
       else
          @error_attr = attr + " "
          #To captialize first letter
          @error_attr[0]-=32
       end
        @errormsg = @errormsg + @error_attr + msg
      end
      flash[:notice] ="<div class='errorExplanation'> "+@errormsg+"</div>"
      redirect_to login_path
     end
   end

  def destroy
    @login_session = UserloginSession.find
    @login_session.destroy
    flash[:notice] = "Successfully logged out."
    redirect_to login_path
  end

  def change_layout
     "loginform"
  end

end
