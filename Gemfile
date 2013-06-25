source 'https://rubygems.org'

gem 'rails', '3.2.13'

gem 'pg'
gem 'jquery-rails'
gem 'jquery-ui-rails'
gem 'bcrypt-ruby', '~> 3.0.0'
gem 'activerecord-postgres-array'
gem 'redis'
gem 'sidekiq'
gem 'clockwork'

group :assets do
  gem 'sass-rails',   '~> 3.2.3'
  gem 'coffee-rails', '~> 3.2.1'
  gem 'uglifier', '>= 1.0.3'
end

group :development, :test do
  gem 'debugger'
  gem 'rspec-rails'
  gem "selenium-webdriver"
end

group :test do
  gem 'capybara', :git => 'git://github.com/jnicklas/capybara.git'
  gem 'shoulda-matchers'
  gem 'factory_girl_rails'
  gem 'simplecov', :require => false
  gem "guard-rspec"
  gem 'database_cleaner'
  gem 'launchy'
end
