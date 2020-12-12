FactoryBot.define do
  factory :user do
    name {Faker::Name.last_name}#Faker: スペース空けずに
    email {Faker::Internet.free_email}#Faker: スペース空けずに
    password = Faker::Internet.password(min_length: 6)#Faker: スペース空けずに
    password {password}
    password_confirmation {password}
  end
end