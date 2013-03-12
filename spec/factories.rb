FactoryGirl.define do
  factory :user_vlod, class:User do
    name     "vlod"
    email    "vlod@foo.com"
    password "foo123"
    password_confirmation "foo123"
    signed_up true
  end
end