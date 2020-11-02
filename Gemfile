source "https://rubygems.org"

ruby "2.6.5"

gem "acts-as-taggable-on"
gem "airbrake"
gem "bourbon"
gem "coffee-rails"
gem "delayed_job_active_record"
gem "email_validator"
gem "flutie"
gem "github_api"
gem "haml-rails", "~> 2.0"
gem "i18n-tasks"
gem "jquery-rails"
gem "neat"
gem "normalize-rails"
gem "omniauth"
gem "omniauth-github"
gem "pg", '~> 0.18'
gem "rack-timeout"
gem "rails", "5.2.4.4"
gem "recipient_interceptor"
gem "responders"
gem "sass-rails", "~> 5.0.0"
gem "selectize-rails"
gem "simple_form"
gem "title"
gem "uglifier"
gem "unicorn"
gem 'honeybadger'
gem 'rails_autolink'

group :development do
  gem "spring"
  gem "spring-commands-rspec"
end

group :development, :test do
  gem "awesome_print"
  gem "byebug"
  gem "dotenv-rails"
  gem "factory_girl_rails"
  gem "pry-rails"
  gem "rspec-rails"
end

group :test do
  #gem "capybara-webkit", ">= 1.2.0"
  gem "database_cleaner"
  gem "formulaic"
  gem "launchy"
  gem "shoulda-matchers", require: false
  gem "timecop"
  gem "webmock"
end

group :staging, :production do
  gem "newrelic_rpm", ">= 3.7.3"
end

group :analyzers do
  gem 'brakeman', require: false
  gem 'bundler-audit', require: false
end