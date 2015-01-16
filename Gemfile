source 'https://rubygems.org'

ruby '2.2.0'

gem 'rails', '4.1.6'


gem 'sass-rails', '~> 4.0.3'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.0.0'
gem 'jquery-rails'
gem 'jquery-turbolinks'
gem 'turbolinks'
gem 'jbuilder', '~> 2.0'
gem 'haml-rails'
gem 'quiet_assets'
gem 'font-awesome-rails'

gem 'paper_trail', '~> 3.0.6'

gem 'devise'
gem 'omniauth'
gem 'omniauth-twitter'

group :development do
  gem 'terminal-notifier-guard'
  gem 'spring'
  gem 'better_errors'
  gem 'rack-mini-profiler'
  gem 'simplecov', '~> 0.7.0', require: false
end

group :development, :test do
  gem 'mysql2'
  gem 'spring-commands-rspec'
  gem 'pry-rails'

  gem 'rspec-rails'
  gem 'factory_girl_rails'
  gem 'forgery'
  gem 'database_rewinder'
  gem 'guard-rspec'
  gem 'guard-spring'

  # gem 'bullet'
end

group :production do
  gem 'pg'
  gem 'rails_12factor'
end

group :doc do
  'sdoc'
end
