source 'http://rubygems.dev'

gem 'rake'
gem 'rails', :git => "git://github.com/rails/rails.git", :branch => "3-1-stable"

# these add generators that help
gem "haml", :git => "git://github.com/nex3/haml.git"
gem 'haml-rails'
gem 'jquery-rails', :git => "git://github.com/rails/jquery-rails.git"

# sass & css frameworks(s)
gem "tilt", :git => "git://github.com/rtomayko/tilt.git"
gem 'sass'
gem 'sass-rails' #, :git => 'https://github.com/rails/sass-rails.git'

# asset pipeline stuff
gem "coffee-script" #, :git => "git://github.com/jashkenas/coffee-script.git"
gem "uglifier", :git => "git://github.com/lautis/uglifier.git"
#gem "pjax_rails", :git => "git://github.com/rails/pjax_rails.git"
gem "coffee-filter", :git => "git://github.com/paulnicholson/coffee-filter.git"

# form helpers
gem 'formtastic'
gem "formtastic_datepicker_inputs"

# attribute display helper
gem "attrtastic"

# auto-completion
gem 'rails3-jquery-autocomplete'

# database
gem 'sqlite3'

# pagination
gem 'will_paginate', :git => "git://github.com/xspond/will_paginate.git", :branch => "rails3-1"

# navigation help
gem "simple-navigation"

group :development, :test do
  gem 'rspec-rails', '> 2.4.1'
  
  # ensure we get latest syntax
  gem 'factory_girl_rails', '>= 1.1.beta4', :require => false
  gem 'spork', '~> 0.9.0.rc2'
  gem "autotest", "~> 4.4.6"
  gem "autotest-rails-pure", "~> 4.1.2"
  gem "autotest-fsevent", "~> 0.2.4"
  gem "autotest-growl", "~> 0.2.9"

  
  gem 'annotate'
  gem 'awesome_print'
  gem 'ruby-debug19', :require => 'ruby-debug'

  gem "capybara"
  gem "launchy"
  gem 'database_cleaner'
end
