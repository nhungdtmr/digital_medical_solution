source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby "2.5.1"

gem "bootsnap", ">= 1.1.0", require: false
gem "bootstrap-kaminari-views"
gem "bootstrap-sass", "~> 3.4.0"
gem "font-awesome-rails"
gem "jbuilder", "~> 2.5"
gem "jquery-rails", "~> 4.3.3"
gem 'sqlite3'
# gem "mysql2", ">= 0.4.4", "< 0.6.0"
gem "puma", "~> 4.3"
gem "rails", "~> 5.2.3"
gem "rails-i18n"
gem "sass-rails", "~> 5.0"
gem "jquery-turbolinks"
gem "config", "~> 1.7", ">= 1.7.1"
gem "cancancan", "~> 2.3"
gem "kaminari"
gem "ckeditor", "~> 4.3"
gem "carrierwave"
gem "mini_magick"
gem "rails-controller-testing"
gem "acts_as_votable"
gem "acts_as_follower", github: "tcocca/acts_as_follower", branch: "master"
gem "omniauth-google-oauth2"
gem "figaro"
gem "closure_tree"
gem "rails_emoji_picker"
gem "social-share-button"
gem "public_activity"

group :development, :test do
  gem "byebug", platforms: [:mri, :mingw, :x64_mingw]
  gem "rspec-rails"
  gem "factory_bot_rails"
  gem "devise", "~> 4.2"
end

group :development do
  gem "listen", ">= 3.0.5", "< 3.2"
  gem "spring"
  gem "spring-watcher-listen", "~> 2.0.0"
  gem "web-console", ">= 3.3.0"
end

group :test do
  gem "capybara"
  gem "chromedriver-helper"
  gem "selenium-webdriver"
  gem "shoulda-matchers"
  gem "database_cleaner"
  gem "ffaker"
end

gem "tzinfo-data", platforms: [:mingw, :mswin, :x64_mingw, :jruby]
