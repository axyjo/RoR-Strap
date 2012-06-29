class User < ActiveRecord::Base
  attr_accessible :first_name, :last_name, :email
  validates_presence_of :first_name
  validates_presence_of :last_name
  validates_uniqueness_of :email
  validates_format_of :email, :with => /^[-a-z0-9_+\.]+\@([-a-z0-9]+\.)+[a-z0-9]{2,4}$/i
end
