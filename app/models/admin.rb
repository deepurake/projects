class Admin < User
  has_one :userlogin, :as => :loginable
  validates_presence_of :name
end

