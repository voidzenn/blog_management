desc "Create Fake Category and Post data"
task create_fake_data: :environment do
  puts "Creating data"
  puts "Creating categories"
  FactoryBot.create_list(:category, 5)
  puts "Creating posts"
  FactoryBot.create_list(:post, 50)
  puts "Successfully created data"
end
