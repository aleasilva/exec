source 'https://rubygems.org'
ruby '2.2.1'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.2.1'

#group :asset do

  # Use CoffeeScript for .coffee assets and views
  #->gem 'coffee-rails', '~> 4.1.0'

  # Use Uglifier as compressor for JavaScript assets
  #->gem 'uglifier', '>= 1.3.0'

  #Twitter
  gem 'twitter-bootstrap-rails', :git => 'git://github.com/seyhunak/twitter-bootstrap-rails.git'
  #->gem 'bootstrap-sass'

  # Use jquery as the JavaScript library
  gem 'jquery-rails', '4.0.4'
  gem 'jquery-ui-rails'

  # Use SCSS for stylesheets
  #gem 'sass-rails', '~> 5.0'
  #gem 'less'

  # See https://github.com/rails/execjs#readme for more supported runtimes
  # Ruby Racer nao estava funcionando no windows 8.1 a instalacao pedi pyton.
  #gem 'therubyracer'
  #gem 'less-rails' #Sprockets (what Rails 3.1 uses for its asset pipeline) supports LESS

  #gem 'jquery-turbolinks'
  #gem 'jquery-ui-themes'

  # Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
  #gem 'turbolinks'

  # Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
  #gem 'jbuilder', '~> 1.2'

#end

#Grid de dados do sistema
#gem 'wice_grid', '3.4.11'
gem "wice_grid", '3.6.0.pre4'
#gem 'font-awesome-sass',  '~> 4.3'

#validação de usuário
gem 'devise', '4.7.1'

#controle de acesso
gem 'cancan'

#tratamento de valores monetarios
gem 'brazilian-rails'

group :doc do
  # bundle exec rake doc:rails generates the API under doc/api.
  gem 'sdoc', require: false
end

group :development do
  gem 'byebug'
  gem 'better_errors'
  gem 'binding_of_caller'
  #gem 'meta_request'
  # Use sqlite3 as the database for Active Record
  gem 'sqlite3'

end

group :production do
  #Logs para o heroku
  gem 'rails_12factor'

  #Postgree
  gem 'pg'
end

# Use ActiveModel has_secure_password
# gem 'bcrypt-ruby', '~> 3.0.0'

# Use unicorn as the app server
# gem 'unicorn'

# Use Capistrano for deployment
# gem 'capistrano', group: :development

# Use debugger
# gem 'debugger', group: [:development, :test]
