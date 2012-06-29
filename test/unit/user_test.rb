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

  it "does not validate when the email does not contain a TLD" do
    user = FactoryGirl.build(:user)
    user.email = "test@localhost"
    user.valid?.must_equal false
  end

  it "validates when there is a plus in the email address" do
    user = FactoryGirl.build(:user)
    user.email = "john+test@example.com"
    user.valid?.must_equal true
  end

  it "does not validate when the email host is an IP address" do
    user = FactoryGirl.build(:user)
    user.email = "john@127.0.0.1"
    user.valid?.must_equal false
  end
end
