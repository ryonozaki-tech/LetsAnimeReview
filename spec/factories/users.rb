FactoryBot.define do
  
  factory :user do
    password              {"00000000"}
    password_confirmation {"00000000"}
    sequence(:nickname) {Faker::Name.initials}
    sequence(:email) {Faker::Internet.email}
  end

end