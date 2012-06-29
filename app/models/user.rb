class User < ActiveRecord::Base
  attr_accessible :first_name, :last_name
  validates_presence_of :first_name
  validates_presence_of :last_name
end
