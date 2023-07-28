FactoryBot.define do
  factory :category do
    name { %w["Technology" "World" "AI" "Nature"].sample }
  end
end
