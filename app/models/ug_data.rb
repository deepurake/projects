# Gaurav (gauravbg AT iitk DOT ac DOT in) - June 2009
class UgData < ActiveRecord::Base
  belongs_to :student   #, :conditions => ["program_id = 1"]
end
