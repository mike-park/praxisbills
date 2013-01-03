source 'http://rubygems.org'

gem 'rake'
gem 'rails', "3.1.1.rc2"

# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails', "  ~> 3.1.0"
  gem 'coffee-rails', "~> 3.1.0"
  gem 'uglifier'
end

gem 'jquery-rails'

# these add generators that help
gem 'haml-rails'

# form helpers
gem 'formtastic'
# 2.0 compatible
gem "formtastic_datepicker_inputs", :git => "git://github.com/adyard/formtastic_datepicker_inputs.git"

# attribute display helper
gem "attrtastic"

# auto-completion
gem 'rails3-jquery-autocomplete'

# database
gem 'sqlite3'

# pagination
gem 'will_paginate'

# navigation help
gem "simple-navigation"

group :development, :test do
  gem 'rspec-rails', '> 2.4.1'
  
  # ensure we get latest syntax
  gem 'factory_girl_rails', '>= 1.1.beta4', :require => false
  gem 'awesome_print'
#  gem 'ruby-debug19', :require => 'ruby-debug'

  gem "capybara"
  gem "launchy"
  gem 'database_cleaner'
end

group :development do
  # used by rails_panel (a chrome extension for debugging rails apps)
  # https://github.com/dejan/rails_panel
  gem 'meta_request', '0.2.1'
end
