source "https://rubygems.org"

ruby "3.2.2"

gem "rails", "~> 7.1.3", ">= 7.1.3.4"

gem "sprockets-rails"

gem "pg", "~> 1.1"

gem "puma", ">= 5.0"

gem "jbuilder"

gem "hotwire-rails", "~> 0.1.3"

gem "importmap-rails", "~> 2.0"

gem 'turbo-rails'

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
  # Use system testing [https://guides.rubyonrails.org/testing.html#system-testing]
  gem "capybara"
  gem "selenium-webdriver"
  gem 'rspec-rails', '~> 6.1', '>= 6.1.3'
  gem 'simplecov', '~> 0.22.0'
  gem 'webmock', '~> 3.19', '>= 3.19.1'
end
