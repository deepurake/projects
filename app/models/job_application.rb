# Gaurav (gauravbg AT iitk DOT ac DOT in) - June 2009
class JobApplication < ActiveRecord::Base
  belongs_to :job_opening
  belongs_to :student
end
