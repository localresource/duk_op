source 'http://rubygems.org'
ruby '2.3.8'
# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.2.0'

gem 'bootstrap-sass', '~> 3.3.4'


gem 'paperclip', '~> 4.2'
gem 'lograge'
gem 'chronic'
gem 'rails_autolink'

group :production do
  gem 'pg', '~> 0.18'
  gem 'rmagick', platforms: [:ruby]
  gem 'unicorn', platforms: [:ruby]
  gem 'unicorn-worker-killer', platforms: [:ruby]
end

# Use SCSS for stylesheets
gem 'sass-rails', '~> 4.0.2'

# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'

# Use CoffeeScript for .js.coffee assets and views
gem 'coffee-rails', '~> 4.0.0'

# See https://github.com/sstephenson/execjs#readme for more supported runtimes
gem 'therubyracer', platforms: :ruby

# Use jquery as the JavaScript library
gem 'jquery-rails'

gem 'high_voltage'

# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 1.2'

gem 'devise'

gem 'simple_form'
gem 'momentjs-rails', '>= 2.8.1'
gem 'bootstrap3-datetimepicker-rails', '~> 3.1.3'
gem 'simple_captcha2', require: 'simple_captcha'
gem 'chartkick'
group :doc do
  # bundle exec rake doc:rails generates the API under doc/api.
  gem 'sdoc', require: false
end

group :development, :test do
  gem 'rspec-rails', '~> 2.0'
  gem 'byebug'
end

group :test do
  gem 'database_cleaner'
  gem 'factory_girl_rails'
  gem 'sqlite3'
end

group :development do
  gem 'better_errors'
  gem 'binding_of_caller'
  gem 'quiet_assets'
  gem 'rack-mini-profiler'
  gem 'xray-rails'
end

gem 'rails_12factor', group: :production
# Ruby interface to CRON
gem 'whenever', require: false
# Analytics
gem 'ahoy_matey'

# Use ActiveModel has_secure_password
# gem 'bcrypt-ruby', '~> 3.1.2'

# Use unicorn as the app server
# gem 'unicorn', group: [:production]

# Use Capistrano for deployment
# gem 'capistrano', group: :development

# Use debugger
# gem 'debugger', group: [:development, :test]

gem 'puma'
