ENV["RACK_ENV"] = "test"
require 'bundler'
Bundler.require(:default, :test)
require File.expand_path('../../config/environment.rb', __FILE__)
require 'capybara/dsl'

DatabaseCleaner.strategy = :truncation
Capybara.app = SetList
Capybara.save_path = "tmp/capybara"

RSpec.configure do |c|
  c.before(:all) do #cleans at beginning
    DatabaseCleaner.clean
  end
  c.after(:each) do
    DatabaseCleaner.clean #after each test cleans
  end
  c.include Capybara::DSL
end
