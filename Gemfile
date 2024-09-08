source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby "3.0.4"
gem "rails", "~> 7.0.4", ">= 7.0.4.3"
gem "sprockets-rails"
gem "pg", "~> 1.1"
gem "puma", "~> 5.0"
gem "importmap-rails"
gem "turbo-rails"
gem "stimulus-rails"
gem "jbuilder"
gem "redis", "~> 4.0"
gem "tzinfo-data", platforms: %i[ mingw mswin x64_mingw jruby ]
gem "bootsnap", require: false
gem "figaro"
gem "activeadmin", "~> 3.0.0"
gem "devise", "~> 4.9.2"
gem "sassc", "~> 2.4.0"
gem "activeadmin_quill_editor", "~> 0.2.0"
gem "webpacker", "~> 5.4.4"
gem "friendly_id", "~> 5.5.0"
gem "dotenv-rails"

group :development, :test do
  gem "debug", platforms: %i[ mri mingw x64_mingw ]
  gem "pry-byebug"
  gem "pry-rails"
  gem "faker"
  gem "factory_bot_rails"
  gem "rspec-rails"
  gem "shoulda-matchers"
  gem "rails-controller-testing"
end

group :development do
  gem "web-console"
end

group :test do
  gem "capybara"
  gem "selenium-webdriver"
  gem "webdrivers"
end
