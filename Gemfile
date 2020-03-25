source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end


gem 'rails', '~> 5.2.4', '>= 5.2.4.2'
gem 'pg', '~> 0.18'
gem 'puma', '~> 3.0'
gem 'sass-rails', '~> 5.0', '>= 5.0.7'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.2', '>= 4.2.2'
# Not optimal, but necessary due to NVM's path issue
gem 'therubyracer', platforms: :ruby

gem 'jquery-rails', '>= 4.3.3'
gem 'turbolinks', '~> 5'
gem 'jbuilder', '~> 2.5'
gem 'redis', '~> 3.0'

# Use Figaro as the environment variables manager
gem 'figaro'

# Use devise for authentication
gem 'devise', '>= 4.5.0'

# CanCanCan for authorization
gem 'cancancan', '~> 1.10'

# Use bootstrap
gem 'bootstrap', '~> 4.0.0.0'

group :development, :test do
  gem 'byebug', platform: :mri
  gem 'rubocop', '~> 0.47.1', require: false
  gem 'rubocop-rspec', require: false
end

group :development do
  gem 'web-console', '>= 3.7.0'
  gem 'listen', '~> 3.0.5'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
