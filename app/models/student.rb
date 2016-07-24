# Gaurav (gauravbg AT iitk DOT ac DOT in) - June 2009
class Student < User

  validates_presence_of Student.get_required_fields(self)
  has_one :userlogin, :as => :loginable

  belongs_to :department
  belongs_to :program

  has_one :student_data
  has_many :job_applications
  has_many :job_openings, :through => :job_applications     # openings this fellow has applied for


  # we can use :conditions here to add an additional layer
  # which IMO is totally redundant since this is a *mapping*
  # outward. we can alternatively use hmp here but i guess
  # this works just as well. we will have a method data which
  # would return the concerned object. one db call is inevitable
  # anyway
  has_one :ug_data
  has_one :pg_data
  has_one :dual_data
  has_one :phd_data


  #-----------------scopes-----------------

  named_scope :dept, lambda { |d|   { :conditions => {:department_id => Department.get_id(d)} } }
  named_scope :prog, lambda { |p|   { :conditions => {:department_id => Program.get_id(p)} } }
  named_scope :pdc,  lambda { |pdc| { :conditions => [pdc.generate_conditions] } }


  # The lamda's below are necessary...
  named_scope :btech,   lambda {{:conditions => {:program_id => Program.get_id("btech")}}}
  named_scope :mtech,   lambda {{:conditions => {:program_id => Program.get_id("mtech")}}}
  named_scope :dual, lambda {{:conditions => {:program_id => Program.get_id("dual")}}}
  named_scope :msci, lambda {{:conditions => {:program_id => Program.get_id("msci")}}}
  named_scope :msc2, lambda {{:conditions => {:program_id => Program.get_id("msc2")}}}
  named_scope :mdes, lambda {{:conditions => {:program_id => Program.get_id("mdes")}}}
  named_scope :mba,  lambda {{:conditions => {:program_id => Program.get_id("mba")}}}
  named_scope :phd,  lambda {{:conditions => {:program_id => Program.get_id("phd")}}}



  #-----------------scopes-----------------




  def data
    self.student_data
  end

  def specific_data             # program specific data
    case self.program_id
      when Program.get_id("btech"), Program.get_id("msci")
        self.ug_data
      when Program.get_id("mtech"), Program.get_id("mba"), Program.get_id("mdes"), Program.get_id("msc2")
        self.pg_data
      when Program.get_id("phd")
        self.phd_data
      when Program.get_id("dual")
        self.dual_data
    end
  end


end

