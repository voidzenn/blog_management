FactoryBot.define do
  factory :admin_user do
    email { Faker::Internet.email }
    name { Faker::Name.name }
    password { "#admin123" }
  end
end
