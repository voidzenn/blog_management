desc "Create category data from factory"
task create_category_data: :environment do
  puts "Creating category data"
  FactoryBot.create_list(:category, 5)
  puts "Successfully created data"
end