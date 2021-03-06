source "https://rubygems.org"

gem "rails", "4.1.6"
gem 'haml-rails'
gem "uglifier", ">= 1.3.0"
gem "coffee-rails", "~> 4.0.0"
gem "jquery-rails"
gem "turbolinks"
gem "sass-rails", "4.0.2"
gem "sprockets", "2.11.0"
gem "pg"
gem "devise"
gem "jquery-turbolinks"
gem "react-rails", "~> 1.0.0.pre", github: "reactjs/react-rails"
gem "bootstrap-sass"
gem "font-awesome-rails"
gem "rack-cors", require: "rack/cors"
gem "kaminari"
gem "active_model_serializers", "~> 0.9.0"
gem "newrelic_rpm"
gem "figaro"
gem "pg_search"
gem "ancestry"
gem "friendly_id", "~> 5.0.3"
gem "faker"
gem "pundit", github: "elabs/pundit"
gem "rest-client"
gem "seed-fu", "~> 2.3"
gem "enumerize"
gem "bootstrap_form"
gem "activerecord-postgis-adapter"
gem "geocoder"
gem "i18n-js"
gem "localeapp"
group :production, :staging do
  gem "rails_12factor"
  gem "rack-cache", require: "rack/cache"
  gem "dalli", "~> 2.7.1"
  gem "memcachier"
  gem "kgio"
  gem "rollbar"
  gem "thin"
  gem "rack-timeout"
end

group :test, :development do
  gem "rspec-rails", "~> 3.0.0"
  gem "rspec-collection_matchers"
  gem "factory_girl_rails", ">= 4.2.0"
  gem "bullet"
  gem "ruby-progressbar"
  gem "pry-rails"
end

group :test do
  gem "database_cleaner", ">= 1.0.0.RC1"
  gem "capybara"
  gem "poltergeist"
  gem "shoulda-matchers", require: false
  gem "rubocop"
end

group :development do
  gem "quiet_assets", ">= 1.0.2"
  gem "better_errors", ">= 0.7.2"
  gem "sprockets_better_errors"
  gem "binding_of_caller", ">= 0.7.1", platforms: [:mri_19, :rbx]
  gem "spring-commands-rspec"
  gem "listen"
  gem "guard-bundler"
  gem "rack-livereload"
  gem "guard-rspec", require: false, github: "guard/guard-rspec"
  gem "activerecord-import"
  gem "metric_fu", ">= 4.11.0"
  gem "mailcatcher"
  gem "spring"
end
