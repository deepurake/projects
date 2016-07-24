class Userlogin < ActiveRecord::Base

  validates_presence_of :loginable_type
  validates_presence_of :last_request_at
  acts_as_authentic do |config|
    config.logged_in_timeout = 100.minutes
  end
  belongs_to :loginable, :polymorphic => true
end

