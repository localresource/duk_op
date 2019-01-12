source 'http://rubygems.org'
ruby '2.5.1'
# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '5.2.2'
gem 'railties', '5.2.2'

gem 'bootstrap-sass', '3.4.0'


gem 'paperclip', '6.1.0'
gem 'lograge', '0.10.0'
gem 'chronic', '0.10.2'
gem 'rails_autolink', '1.1.6'

group :production do
  gem 'rmagick', platforms: [:ruby]
  gem 'unicorn', platforms: [:ruby]
  gem 'unicorn-worker-killer', platforms: [:ruby]
end
gem 'pg', '1.1.4'

# Use SCSS for stylesheets
gem 'sass-rails', '5.0.7'

# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '4.1.20'

# Use CoffeeScript for .js.coffee assets and views
gem 'coffee-rails', '4.2.2'

# See https://github.com/sstephenson/execjs#readme for more supported runtimes
gem 'therubyracer', platforms: :ruby

# Use jquery as the JavaScript library
gem 'jquery-rails', '4.3.3'

gem 'high_voltage', '3.1.0'

# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '2.8.0'

gem 'devise', '4.5.0'

gem 'simple_form', '4.1.0'
gem 'momentjs-rails', '2.20.1'
gem 'bootstrap3-datetimepicker-rails', '4.17.47'
gem 'simple_captcha2', require: 'simple_captcha'
gem 'chartkick', '3.0.2'
group :doc do
  # bundle exec rake doc:rails generates the API under doc/api.
  gem 'sdoc', require: false
end

group :development, :test do
  gem 'rspec-rails', '3.8.1'
  gem 'byebug', '10.0.2'
end

group :test do
  gem 'database_cleaner', '1.7.0'
  gem 'factory_girl_rails', '4.9.0'
  gem 'sqlite3', '1.3.13'
end

group :development do
  gem 'better_errors', '2.5.0'
  gem 'binding_of_caller', '0.8.0'
  #gem 'quiet_assets', '1.1.0'
  gem 'rack-mini-profiler', '1.0.1'
  gem 'xray-rails', '0.3.1'
end

gem 'rails_12factor', group: :production
# Ruby interface to CRON
gem 'whenever', require: false
# Analytics
#gem 'ahoy_matey'

# Use ActiveModel has_secure_password
# gem 'bcrypt-ruby', '~> 3.1.2'

# Use unicorn as the app server
# gem 'unicorn', group: [:production]

# Use Capistrano for deployment
# gem 'capistrano', group: :development

# Use debugger
# gem 'debugger', group: [:development, :test]

gem 'puma', '3.12.0'
