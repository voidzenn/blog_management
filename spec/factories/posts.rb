FactoryBot.define do
  factory :post do
    title { Faker::Marketing.unique.buzzwords.capitalize }
    content { Faker::Lorem.sentences(number: 150).join(" ") }
    author { create :user }
    category { Category.all.sample }

    after(:create) do |post|
      image_file = Rails.root.join('spec', 'fixtures', 'images', 'cover_image.jpg').open

      post.cover_image.attach(
        io: image_file,
        filename: "cover_image.jpg",
        content_type: "image/jpeg"
      )
    end
  end
end
