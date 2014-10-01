FactoryGirl.define do

  factory :user do
    email "foo@bar.com"
    password "foobarbaz"
    password_confirmation "foobarbaz"

    factory :admin do
      admin true
    end

  end

end
