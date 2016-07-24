class StudentsRegistrationController < ApplicationController
  skip_before_filter :require_login
  def new
    @prog=params[:prog]
    if Program::ProgramNames.index(@prog).nil?
      redirect_to '/students_registration'
      return
    end
    @student = Student.new
    @student_data = StudentData.new
    @preferences = Preference.new
    @userlogin = Userlogin.new
    case @prog
      when "btech","msci"
        @prog_data=UgData.new
      when "mtech","mdes","msc2","mba"
        @prog_data=PgData.new
      when "phd"
        @prog_data=PhdData.new
      when "dual"
        @prog_data=DualData.new
    end
    render @prog
    return
  end

  
  def create
    @prog=Program.get_name(params[:student][:program_id].to_i)
    if @prog.nil?
      redirect_to '/students_registration'
      return
    end
    @student = Student.new(params[:student])
    case @prog
        when "btech","msci"
          @prog_data=UgData.new(params[:ug_data])
        when "mtech","mdes","msc2","mba"
          @prog_data=PgData.new(params[:pg_data])
        when "phd"
          @prog_data=PhdData.new(params[:phd_data])
        when "dual"
          @prog_data=DualData.new(params[:dual_data])
          @student.cpi = [@prog_data.pg_cpi,@prog_data.ug_cpi].max
      end
    @student_data = StudentData.new(params[:student_data])
    if @student.save
      @prog_data.student_id = @student.id
      @prog_data.save      
      @student_data.student_id = @student.id
      @student_data.expected_grad_date=params[:expected_grad_month]+" "+params[:expected_grad_year]
      @student_data.save
      Preference.create(params[:preference])
      flash[:notice]="Rgistration is successful"      
      #@student.student_data=@student_data
    else
      flash[:notice]="Form has some errors"
      render @prog
      return
    end
    redirect_to home_path
  end

end