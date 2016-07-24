class AdminsController < ApplicationController

  before_filter :is_admin?
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
    @admin =  @user.loginable
    @notices = Notice.all
    @notice = Notice.new
  end


  def add_notice
    @notice = Notice.new(params[:notice])
    src_filename = params[:attachment]
    if src_filename && !src_filename.original_filename.empty?
      filename = "#{RAILS_ROOT}/notices/" + src_filename.original_filename
      if File.open(filename, 'w'){ |f| f.write(src_filename.read) }
        @notice.attachment=src_filename.original_filename
      end
   end
   @notice.save
   @admin = current_user
   @notices = Notice.all
   render :action => 'show'
  end

  def change_dept_prog
    @dept_prog=DeptProg.get

    dept_names=Department::DepartmentNames
    num_depts=dept_names.length
    dept_ids=Department::DepartmentIDs
    if params
      @pdc=Pdc.new
      for d in 0..num_depts-1
        if params[dept_names[d]]
          params[dept_names[d]].each do |prog|
            @pdc.add(prog.to_i,dept_ids[d])
          end
        end
      end
      @dept_prog.update_attribute(:dept_prog, @pdc)
     end
  end
end

