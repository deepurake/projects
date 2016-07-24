class CompaniesController < ApplicationController
  layout :companylayout
  before_filter :require_login
=begin
  def show
    @user=current_user
    if @user.nil?
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
    end
  end
=end
  def home
  end

  def create
    @opening=JobOpening.new(params[:opening])
    @opening.eligibility=eligibility_to_pdc(params[:eligibility])
    @opening.published=0
    @opening.application_deadline=Time.now.to_s(:db)
    @opening.company_id=current_user.id
    if @opening.save
      if params[:packages_attachment]!=""
        @attachment=AttachmentPackageDetails.create(:file => params[:packages_attachment],:attachable => @opening)
        print @attachment.errors.inspect
      end
      if params[:application_form]!=""
        @attachment=AttachmentApplicationForm.create(:file => params[:application_form],:attachable => @opening)
        print @attachment.errors.inspect
      end
      flash[:notice]="Opening is added sucessfully"
      print @opening.errors
      redirect_to company_home_path
    else
      flash[:notice]="Opening is not added"
      render :add_opening
    end
  end
  def add_opening
  end
	def view_openings
		@company =  current_user
		@openings = JobOpening.all(:conditions => {:company_id => @company.id})

	end
	
	def pending_applications
	  @pending_applications=applications("pending")
	end

	def rejected_applications
    @rejected_applications=applications("rejected")
	end

	def shortlisted_applications
    @shortlisted_applications=applications("shortlisted")
	end

	def accepted_applications
    @accepted_applications=applications("accepted")
	end

	def download_resumes

  end
  def mail_students
  end
	def companylayout
		return 'companies'
	end

  def eligibility_to_str
    render :text => eligibility_to_pdc(params[:eligibility]).to_h

  end

  private
  def eligibility_to_pdc(eligibilty)
    pdc=Pdc.new
    dept_names=Department::DepartmentNames
    num_depts=dept_names.length
    dept_ids=Department::DepartmentIDs
    for d in 0..num_depts-1
      if eligibilty[dept_names[d]]
        eligibilty[dept_names[d]].each do |prog|
          pdc.add(prog.to_i,dept_ids[d])
        end
      end
    end
    return pdc
  end
  
  def applications(status)
		@company = current_user
		opening_ids = JobOpening.find(:all,:select => "id",:conditions => {:company_id => @company.id},:readonly => true)
		@applications = JobApplication.find(:all,:conditions => {:job_opening_id => opening_ids,:status => status })
  end
  
end



