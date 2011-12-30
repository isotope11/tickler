FactoryGirl.define do
  factory :user do
    email 'josh@isotope11.com'
    password '123456'
    password_confirmation '123456'
  end
  factory :card do
    name 'Test'
    description 'Just a description'
    folder_name '1'
    user { User.first || FactoryGirl.create(:user) }
  end
end
