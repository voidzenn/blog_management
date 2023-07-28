desc "Create Fake Post Data with Factories"
task create_fake_post: :environment do
  puts "Creating post"
  FactoryBot.create_list(:post, 50)
  puts "Successfully created data"
end
