class JobOpening < ActiveRecord::Base


  validates_presence_of :nature, :designation,:description,:bond,:medical_requirements
  validates_presence_of :resume_shortlist,:aptitude,:gd,:tech_test,:tech_interview,:no_rounds,:hr_interview
  validates_presence_of :contact_details1
  validate :package_info

  def package_info
    return !(self.package_btech.nil? || self.package_mtech.nil? || self.package_dual.nil? || self.package_mdes.nil?|| self.package_mba.nil?|| self.package_mdes.nil?|| self.package_phd.nil?|| self.package_msc2|| self.package_msci.nil?)
  end

  has_one :attachment_package_details, :as => :attachable
  has_one :attachment_job_application, :as => :attachable

  belongs_to :company


  has_many :job_applications
  has_many :students, :through => :job_applications

  serialize :eligibility, Pdc
  serialize :contact_details1, Hash
  serialize :contact_details2, Hash
  serialize :contact_details3, Hash
  serialize :package_btech,Array
  serialize :package_mtech,Array
  serialize :package_dual,Array
  serialize :package_msci,Array
  serialize :package_msc2,Array
  serialize :package_mba,Array
  serialize :package_mdes,Array
  serialize :package_phd,Array


end

