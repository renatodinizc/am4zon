source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '3.0.2'
gem 'rails', '~> 6.1.4', '>= 6.1.4.4'

gem 'devise'
gem 'jbuilder', '~> 2.7'
gem 'puma', '~> 5.0'
gem 'rubocop-rails', require: false
gem 'turbolinks', '~> 5'
gem 'webpacker', '~> 5.0'
gem 'sassc-rails'

gem 'sprockets-rails', :require => 'sprockets/railtie'
# gem 'bcrypt', '~> 3.1.7'

# Reduces boot times through caching; required in config/boot.rb
gem 'bootsnap', '>= 1.4.4', require: false

group :development, :test do
  gem 'byebug', platforms: %i[mri mingw x64_mingw]
  gem 'capybara'
  gem 'factory_bot_rails'
  gem 'ffaker'
  gem 'rspec-rails'
  gem 'simplecov', require: false
  gem 'sqlite3'
end

group :development do
  gem 'listen', '~> 3.3'
  gem 'rack-mini-profiler', '~> 2.0'
  gem 'spring'
  gem 'web-console', '>= 4.1.0'
end

group :production do
  gem 'pg'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]
