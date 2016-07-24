class HomeController < ApplicationController
  def index
    case current_user.class.name
      when "Student" then redirect_to student_home_path
      when "Company" then redirect_to company_home_path
      when "Admin" then redirect_to admin_home_path
    end
  end
end
