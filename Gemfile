source 'http://rubygems.org'
ruby "2.2.3"

gem 'rails',                '3.2.13'
gem 'jquery-rails',         '2.1.4'
gem 'haml-rails',           '0.3.5'
gem 'thin',                 '1.3.1'
gem 'mysql2',                '0.3.18'
gem 'rack-canonical-host',  '0.0.8'
gem "therubyracer",         '0.12.1'
gem "less-rails",            '2.2.6'
gem "cocoon",                "1.1.2"
gem 'simple_form',           '2.0.4'
gem 'newrelic_rpm'
gem 'ruby_dep', '1.3.1'

group :assets do
  gem 'sass-rails',         '3.2.5'
  gem 'coffee-rails',       '3.2.2'
  gem 'uglifier',           '1.3.0'
  gem 'twitter-bootstrap-rails'
end

group :development do
  gem 'foreman',            '0.60.2'
  gem 'heroku',             '2.33.5'
  gem 'integration', :git => 'git://github.com/mergulhao/integration.git'
end

group :test do
  gem 'fakeweb',            '1.3.0'
  gem 'shoulda-matchers',   '1.1.0'
  gem 'timecop',            '0.3.5'
  gem 'simplecov', '0.6.1', :require => false
  gem 'guard-rspec', '2.1.0'
	gem 'capybara', '2.4.0'
	gem 'database_cleaner',   '0.9.1'
  gem 'cucumber-rails',     '1.3.0', :require => false
end

group :development, :test do
  gem 'rspec-rails',        '2.11.0'
  gem 'factory_girl_rails', '1.7.0'
  gem 'pry-rails',          '0.1.6'
end
