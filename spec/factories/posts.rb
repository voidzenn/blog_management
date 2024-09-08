FactoryBot.define do
  factory :post do
    title { Faker::Marketing.unique.buzzwords.capitalize }
    content { Faker::Lorem.sentences(number: 150).join(" ") }
    author { create :admin_user }
    category { Category.all.sample }
  end
end
