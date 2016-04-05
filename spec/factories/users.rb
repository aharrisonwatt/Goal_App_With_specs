FactoryGirl.define do
  factory :user do
    username 'ginger_baker'
    password 'password'

    factory :bad_username do
      username 'ginger'
    end

    factory :bad_password do
      password 'bad_password'
    end
  end
end
