FactoryGirl.define do
  factory :authentication do
    provider 'facebook'
    uid '4'
    after_build do |obj|
      user = FactoryGirl.create(:user)
      obj.user_id  = user.id
    end
  end
end
