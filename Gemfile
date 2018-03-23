source "https://rubygems.org"

gem "rails", "5.1.4"
gem "config"
gem "bcrypt", "3.1.11"
gem "bootstrap-sass", "3.3.7"
gem "puma", "3.9.1"
gem "sass-rails", "5.0.6"
gem "uglifier", "3.2.0"
gem "coffee-rails", "4.2.2"
gem "jquery-rails", "4.3.1"
gem "turbolinks", "5.0.1"
gem "jbuilder", "2.7.0"

group :development, :test do
  gem "sqlite3", "1.3.13"
  gem "byebug"
  gem "database_cleaner"
  gem "brakeman", require: false
  gem "jshint"
  gem "bundler-audit"
  gem "rubocop", "~> 0.35.0", require: false
  gem "rubocop-checkstyle_formatter", require: false
  gem "eslint-rails", git: "https://github.com/octoberstorm/eslint-rails", require: false
  gem "scss_lint_reporter_checkstyle", require: false
  gem "scss_lint", "~> 0.54.0", require: false
  gem "rails_best_practices"
  gem "reek"
  gem "railroady"
  gem "autoprefixer-rails"
end

group :development do
  gem "web-console", ">= 3.3.0"
  gem "listen", ">= 3.0.5", "< 3.2"
  gem "spring"
  gem "spring-watcher-listen", "~> 2.0.0"
end

group :test do
  gem "rails-controller-testing", "1.0.2"
  gem "minitest-reporters", "1.1.14"
  gem "guard", "2.13.0"
  gem "guard-minitest", "2.4.4"
  gem "simplecov", require: false
  gem "simplecov-rcov", require: false
  gem "simplecov-json"
  gem "shoulda-matchers"
end

group :production do
  gem "pg", "0.18.4"
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem "tzinfo-data", platforms: [:mingw, :mswin, :x64_mingw, :jruby]
