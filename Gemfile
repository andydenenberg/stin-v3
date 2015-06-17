source 'http://rubygems.org'

ruby "1.9.3"
gem 'rails', '3.1.1'

# Bundle edge Rails instead:
# gem 'rails',     :git => 'git://github.com/rails/rails.git'

gem 'therubyracer-heroku', :group => :production
group :production do
gem 'pg'
end

group :development, :test do
gem 'sqlite3'
end

gem 'will_paginate'

# gem 'bootstrap-will_paginate' 
# put code directly in application_helper.rb instead

gem 'jquery-rails'
gem 'jquery_datepicker'

gem 'paperclip', '~> 2.4' 
require 'yaml'
gem 'aws-s3'
gem 'sendgrid'
gem 'devise'

# Gems used only for assets and not required
# in production environments by default.
#  group :assets do
#    gem 'sass-rails',   '~> 3.1.4'
#    gem 'coffee-rails', '~> 3.1.1'
#    gem 'uglifier', '>= 1.0.3'
#  end

# To use ActiveModel has_secure_password
# gem 'bcrypt-ruby', '~> 3.0.0'

# Use unicorn as the web server
# gem 'unicorn'

# Deploy with Capistrano
# gem 'capistrano'

# To use debugger
# gem 'ruby-debug19', :require => 'ruby-debug'

group :test do
  # Pretty printed test output
  gem 'turn', :require => false
end
