require 'spork'

# setup with help from:
# http://www.arailsdemo.com/posts/35

Spork.prefork do
  ENV["RAILS_ENV"] ||= 'test'
  require File.expand_path("../../config/environment", __FILE__)
  require 'rspec/rails'

  # preloading for preformance
  require 'rspec/expectations'
  require 'rspec/core/expecting/with_rspec'
  require 'active_support/secure_random'
  require 'mime/types'

  # Requires supporting ruby files with custom matchers and macros, etc,
  # in spec/support/ and its subdirectories.
  Dir[Rails.root.join("spec/support/**/*.rb")].each {|f| require f}

  RSpec.configure do |config|
    config.mock_with :rspec

    # Remove this line if you're not using ActiveRecord or ActiveRecord fixtures
    config.fixture_path = "#{::Rails.root}/spec/fixtures"

    # If you're not using ActiveRecord, or you'd prefer not to run each of your
    # examples within a transaction, remove the following line or assign false
    # instead of true.
    config.use_transactional_fixtures = true

    # when using capybara, transaction auto rollback after posts, so we
    # need to disable them. this should only be true with the selenium driver
    # but i find it true with rack-test when
    # environments/test.rb => config.cache_classes = false
    unless Rails.application.config.cache_classes
      config.use_transactional_fixtures = false
      config.before :each do
        DatabaseCleaner.strategy = :truncation
        DatabaseCleaner.start
      end
      config.after do
        DatabaseCleaner.clean
      end
    end
  end

  # useful way to figure out time spent in requires
  # module Kernel
  #   def require_with_trace(*args)
  #     start = Time.now.to_f
  #     @indent ||= 0
  #     @indent += 2
  #     require_without_trace(*args)
  #     @indent -= 2
  #     Kernel::puts "#{' '*@indent}#{((Time.now.to_f - start)*1000).to_i} #{args[0]}"
  #   end
  #   alias_method_chain :require, :trace
  # end
end

Spork.each_run do
  require 'factory_girl_rails'
end

Spork.each_run do
  ActiveSupport::Dependencies.clear
  ActiveRecord::Base.instantiate_observers
end if Spork.using_spork?
