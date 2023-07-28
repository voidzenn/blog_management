FactoryBot.define do
  factory :post do
    title { Faker::Lorem.sentence }
    content { Faker::Lorem.sentences(number: 30).join(" ") }
    author { create :admin_user }
    category { create :category }
  end
end
