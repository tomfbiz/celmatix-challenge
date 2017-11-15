source "https://rubygems.org"
ruby "2.3.1"

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end

gem "pg", "~> 0.18"
gem "puma", "~> 3.7"
gem "rails", "~> 5.1.4"
gem "sass-rails", "~> 5.0"
gem "uglifier", ">= 1.3.0"
gem "webpacker"

gem "clearance", "~> 1.16.1"
gem "coffee-rails", "~> 4.2"
gem "figaro", "~> 1.1.1"
gem "jbuilder", "~> 2.7"

group :development, :test do
  gem "factory_bot_rails"
  gem "pry-byebug", "~> 3.5.0"
  gem "rspec-rails", "~> 3.6.1"
  gem "shoulda-matchers", "~> 3.1"
end

group :development do
  gem "capybara", "~> 2.15.4"
  gem "listen", ">= 3.0.5", "< 3.2"
  gem "rubocop"
  gem "spring"
  gem "spring-watcher-listen", "~> 2.0.0"
  gem "web-console", ">= 3.3.0"
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem "tzinfo-data", platforms: [:mingw, :mswin, :x64_mingw, :jruby]
