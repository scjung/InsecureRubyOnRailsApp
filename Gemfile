# frozen_string_literal: true

source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.6.5'

gem 'bcrypt', '~> 3.1.13'
gem 'bootstrap-sass', '~> 3.4.1'
gem 'bootstrap-will_paginate', '~> 1.0.0'
gem 'faker', '~> 2.1.2'
gem 'jbuilder', '~> 2.10.0'
gem 'puma', '~> 4.3.3'
gem 'rails', '~> 6.0.2', '>= 6.0.2.1'
gem 'sass-rails', '>= 6.0.0'
gem 'turbolinks', '~> 5.2.1'
gem 'webpacker', '~> 4.2.2'
gem 'will_paginate', '~> 3.1.8'

gem 'bootsnap', '>= 1.4.2', require: false

group :development, :test do
  gem 'byebug', platforms: %i[mri mingw x64_mingw]
  gem 'sqlite3', '~> 1.4.2'
end

group :development do
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'pry-rails'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
  gem 'web-console', '>= 3.3.0'
end

group :test do
  gem 'capybara', '>= 2.15'
  gem 'guard', '~> 2.16.1'
  gem 'guard-minitest', '~> 2.4.6'
  gem 'minitest', '~> 5.14.0'
  gem 'minitest-reporters', '~> 1.4.2'
  gem 'rails-controller-testing', '~> 1.0.4'
  gem 'selenium-webdriver', '~> 3.142.7'
  gem 'webdrivers', '~> 4.2.0'
end

group :production do
  gem 'pg', '~> 1.2.2'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]

## Local variables:
## compile-command: "bundle install"
## End:
