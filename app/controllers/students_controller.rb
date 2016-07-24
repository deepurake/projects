class StudentsController < ApplicationController
  layout :setlayout
  before_filter :require_login
  def show
    @login_session = UserloginSession.find
    if @login_session.nil?
      redirect_to login_path
      return
    end
    @user = @login_session && @login_session.record
    if @user.nil?
      redirect_to login_path
      return
    end
    @student =  @user.loginable
    @notices = Notice.all(:order => "id DESC")
  end
  def setlayout
    'students'
  end
  def download
    notice_filename = params[:filename]
    if !notice_filename
      redirect_to student_home_path
    else
      notice_path = RAILS_ROOT+"/notices/"+notice_filename
      send_file notice_path
    end
  end
end

