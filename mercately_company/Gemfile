source "https://rubygems.org"

ruby "3.2.2"

gem "rails", "~> 7.1.3", ">= 7.1.3.4"

gem "sprockets-rails"

gem "pg", "~> 1.1"

gem "puma", ">= 5.0"

gem "importmap-rails"

gem "turbo-rails"

gem "stimulus-rails"

gem "jbuilder"

gem 'paranoia', '~> 2.1', '>= 2.1.5'

gem "tailwindcss-rails", "~> 2.6"

gem 'dotenv-rails'

# Use Redis adapter to run Action Cable in production
# gem "redis", ">= 4.0.1"

gem "tzinfo-data", platforms: %i[ windows jruby ]

gem "bootsnap", require: false

group :development, :test do
  gem "debug", platforms: %i[ mri windows ]
end

group :development do
  gem "web-console"
end

group :test do
  gem 'rspec-rails', '~> 6.1', '>= 6.1.3'
  gem "capybara"
  gem "selenium-webdriver"
  gem 'simplecov', '~> 0.22.0'
  gem 'webmock', '~> 3.19', '>= 3.19.1'
end
