# New acct creation and stuff
require 'net/imap.rb'
class UserloginsController < ApplicationController
  skip_before_filter :require_login
  before_filter :require_no_login
  layout :setlayout
  def new
     @user = Userlogin.new
  end

  def create
     @user = Userlogin.new(params[:userlogin])
     @user.last_login_ip = request.remote_ip
     @user.last_login_at = Time.now.to_s(:db)
     @user.last_request_at = Time.now.to_s(:db)
     case @user.loginable_type
        when "Student" then
           @student = Student.new(params[:user])
           if @student.save
              @user.loginable = @student
            else
              render :action => 'new'
              return
           end
       when "Company" then
         @company = Company.new(params[:user])
         if @company.save
            @user.loginable = @company
          else
            render :action => 'new'
            return
         end
       when "Admin" then
           @admin = Admin.new(params[:user])
           if @admin.save
              @user.loginable = @admin
            else
              render :action => 'new'
              return
           end
        else
          render :action => 'new'
          return
       end


     if @user.save
       flash[:notice] = "Registration successful."
       redirect_to home_path
     else
       render :action => 'new'
     end
  end

  def setlayout
    'loginform'
  end

  def forgot_password
    @username=params[:login]
    if @username
      @user = Userlogin.find_by_login(@username)
      if @user.nil?
        flash[:error] = "Login doesn't exists"
        return
      end
      if @user.loginable_type=="Student"
        @is_student = true
      else
        @is_student = false
      end
    end
  end

  def reset_password
    if params[:cc]
      @cc_login = params[:cc][:login]
      @cc_password = params[:cc][:password]
      imap = Net::IMAP.new("newmailhost.cc.iitk.ac.in")
      begin
        imap.login(@cc_login,@cc_password)
      rescue Net::IMAP::NoResponseError
        flash[:error] = "Authentication invalid"
        return
      end
      imap.disconnect
      puts "connected successfully to imap server"
      if params[:pas][:password]==params[:pas][:password_confirm]
        @user = Userlogin.find_by_login(@user)
        @user.update_attribute(:password,params[:pas][:password])
        flash[:error] = "Passwords is set"
        redirect_to home_path
      else
        flash[:error] = "Passwords didn't match"
        redirect_to forgot_password_path
      end
    else
      redirect_to forgot_password_path
    end
  end

end

