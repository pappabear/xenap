source 'https://rubygems.org'

ruby '2.2.4'
gem 'rails',        '4.2.5'
gem 'sass-rails',   '5.0.2'
gem 'uglifier',     '2.5.3'
gem 'coffee-rails', '4.1.0'
gem 'jquery-rails', '4.0.3'
gem 'turbolinks',   '2.3.0'
gem 'jbuilder',     '2.2.3'
gem 'sdoc',         '0.4.0', group: :doc
gem 'mysql2'
gem 'jquery-turbolinks'

# NOTE: Kaminari has to be loaded before Elasticsearch::Model so the callbacks are executed
gem 'kaminari'
gem 'elasticsearch', git: 'git://github.com/elasticsearch/elasticsearch-ruby.git'
gem 'elasticsearch-model', git: 'git://github.com/elasticsearch/elasticsearch-rails.git'
gem 'elasticsearch-rails', git: 'git://github.com/elasticsearch/elasticsearch-rails.git'

gem 'bootstrap-sass'  #,                  # adds Bootstrap
gem 'bcrypt',               '3.1.7'       # for encryption
gem 'faker'

gem 'puma'


group :development, :test do
  gem 'byebug',      '3.4.0'
  gem 'web-console', '2.0.0.beta3'
  gem 'spring',      '1.1.3'
end

group :test do
  gem 'minitest-reporters', '1.0.5'
  gem 'mini_backtrace',     '0.1.3'
  gem 'guard-minitest',     '2.3.1'
end

group :production do
  gem 'rails_12factor', '0.0.2'
end

