require "minitest_helper"

describe Authentication do
  it "must have a valid factory" do
    auth = FactoryGirl.build(:authentication)
    auth.valid?.must_equal true
  end

  it "must have a user id" do
    auth = FactoryGirl.build(:authentication)
    auth.user_id = nil
    auth.valid?.must_equal false
  end

  it "must have a provider" do
    auth = FactoryGirl.build(:authentication)
    auth.provider = nil
    auth.valid?.must_equal false
  end
end
