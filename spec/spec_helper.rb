# This file is copied to spec/ when you run 'rails generate rspec:install'
ENV["RAILS_ENV"] ||= 'test'
require File.expand_path("../../config/environment", __FILE__)
require 'rspec/rails'
require 'database_cleaner'
Dir[Rails.root.join("spec/support/**/*.rb")].each { |f| require f }

# Checks for pending migrations before tests are run.
# If you are not using ActiveRecord, you can remove this line.
ActiveRecord::Migration.maintain_test_schema!

RSpec.configure do |config|
  config.include FactoryGirl::Syntax::Methods
  config.fixture_path = "#{::Rails.root}/spec/fixtures"
  config.use_transactional_fixtures = true
  config.infer_base_class_for_anonymous_controllers = false
  config.order = "random"
  config.infer_spec_type_from_file_location!
  config.expose_current_running_example_as :example

#added by Alex
  DatabaseCleaner.strategy = :truncation

  config.before(:all) do
    @crookshanks = User.create(:email => "crookshanks@cats.com", :password => "password", :password_confirmation => "password")
    @invalid_user = User.new(:email => nil, :password => "password", :password_confirmation => "password")
  end

  config.after(:all) do
    DatabaseCleaner.clean
  end
end


