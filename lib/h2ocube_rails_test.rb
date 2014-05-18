%w(rspec-rails factory_girl_rails rubocop capybara timecop database_cleaner).each{ |gem| require gem }

module H2ocubeRailsTest
  class Railtie < Rails::Railtie
    railtie_name :h2ocube_rails_test
    rake_tasks do
      desc 'run rubocop'
      task :rubocop do
        system 'bundle exec rubocop -R'
      end

      desc 'run spec and rubocop'
      task test: %i(spec rubocop)
    end
  end
end
