require "minitest_helper"

describe User do
  it "must have a valid factory" do
    user = FactoryGirl.build(:user)
    user.valid?.must_equal true
  end

  it "must have a first name" do
    user = FactoryGirl.build(:user)
    user.valid?.must_equal true
    user.first_name = nil
    user.valid?.must_equal false
  end

  it "must have a last name" do
    user = FactoryGirl.build(:user)
    user.valid?.must_equal true
    user.last_name = nil
    user.valid?.must_equal false
  end
end
