FactoryGirl.define do
  factory :authentication do
    provider 'facebook'
    uid '4'
    after(:build) do |obj|
      user = FactoryGirl.create(:user)
      obj.user_id  = user.id
    end
  end

  factory :user do
    first_name 'John'
    last_name 'Smith'
    email 'john@example.com'
  end
end
