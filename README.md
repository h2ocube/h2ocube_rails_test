# H2ocubeRailsTest

[![Gem Version](https://badge.fury.io/rb/h2ocube_rails_test.png)](http://badge.fury.io/rb/h2ocube_rails_test)

Just a collection for test gems

## Installation

Add this line to your application's Gemfile:

    gem 'h2ocube_rails_test', group: [:development, :test]

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install h2ocube_rails_test

## Usage

    $ rake spec
    $ rake rubocop
    $ rake test # => run spec and rubocop

  Other commands see below

## Include

* rspec-rails https://github.com/rspec/rspec-rails
* factory_girl_rails https://github.com/thoughtbot/factory_girl_rails
* rubocop https://github.com/bbatsov/rubocop
* capybara http://jnicklas.github.io/capybara
* timecop https://github.com/travisjeffery/timecop
* database_cleaner https://github.com/bmabey/database_cleaner

## spec_helper.rb example

    ENV['RAILS_ENV'] ||= 'test'
    require File.expand_path('../../config/environment', __FILE__)
    require 'rspec/rails'
    require 'rspec/autorun'
    require 'database_cleaner'

    Dir[Rails.root.join('spec/support/*.rb')].each { |f| require f }

    ActiveRecord::Migration.maintain_test_schema!

    RSpec.configure do |config|
      config.include FactoryGirl::Syntax::Methods

      config.mock_with :rspec

      config.infer_base_class_for_anonymous_controllers = false
      config.render_views

      config.before(:suite) do
        DatabaseCleaner.clean_with(:truncation)
        Rails.cache.clear
      end
      config.before(:each) do
        ActionMailer::Base.deliveries = []
        DatabaseCleaner.start
      end
      config.after(:each) do
        DatabaseCleaner.clean
      end
    end

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
