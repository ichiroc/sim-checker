source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.5.1'

gem 'rails', '~> 5.2.2'

gem 'bootsnap', require: false
gem 'jbuilder'
gem 'puma'
gem 'sass-rails'

# additional gems
gem 'devise'
gem 'hamlit-rails'
gem 'pg'
gem 'webpacker'

group :development, :test do
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]

  # additional gems
  gem 'capybara'
  gem 'chromedriver-helper'
  gem 'factory_bot_rails'
  gem 'rspec-rails'
  gem 'selenium-webdriver'
end

group :development do
  gem 'listen'
  gem 'spring'
  gem 'spring-watcher-listen'
  gem 'web-console'

  # additional gems
  gem 'better_errors'
  gem 'pry'
  gem 'pry-doc'
  gem 'pry-remote'
end

gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
