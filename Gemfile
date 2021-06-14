# frozen_string_literal: true

source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '3.0.0'

gem 'rails', '~> 6.1.3', '>= 6.1.3.2'
gem 'pg', '~> 1.1'
gem 'puma', '~> 5.0'
gem 'sass-rails', '>= 6'
gem 'webpacker', '~> 5.0'
gem 'bootsnap', '>= 1.4.4', require: false
gem 'nokogiri'
gem 'eezee'
gem 'paper_trail'

gem 'activeadmin'
gem 'devise'
gem 'arctic_admin'


group :development, :test do
  gem 'byebug', platforms: %i[mri mingw x64_mingw]
  gem 'pry-byebug'
  gem 'pry-rails'
  gem 'rubocop'
  gem 'rubocop-performance'
  gem 'rubocop-rails'
  gem 'factory_bot_rails'
  gem 'faker'
end

group :development do
  gem 'web-console', '>= 4.1.0'
  gem 'rack-mini-profiler', '~> 2.0'
  gem 'listen', '~> 3.3'
  gem 'spring'
end

group :test do
  gem 'database_cleaner'
  gem 'rspec-rails'
  gem 'shoulda-matchers', '~> 3.1'
  gem 'simplecov', require: false
  gem 'simplecov-summary'
  gem 'simplecov-console'
  gem 'vcr'
  gem 'webmock'
  gem 'super_diff'
end

gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]
