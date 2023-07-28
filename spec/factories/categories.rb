FactoryBot.define do
  factory :category do
    sequence(:name) { |n| %w[Technology World AI Nature History][n % 5] }
  end
end
