FactoryBot.define do
  factory :room do
    name {Faker::Team.name} #Faker: スペース空けずに:Team.name
  end
end