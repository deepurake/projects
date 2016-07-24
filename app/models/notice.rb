class Notice < ActiveRecord::Base
  validates_presence_of :title, :content, :sent_to
end

