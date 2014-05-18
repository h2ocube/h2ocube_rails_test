# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

Gem::Specification.new do |spec|
  spec.name          = 'h2ocube_rails_test'
  spec.version       = '0.0.1'
  spec.authors       = ['Ben']
  spec.email         = ['ben@zfben.com']
  spec.description   = %q{Just a collection for test gems}
  spec.summary       = %q{Just a collection for test gems}
  spec.homepage      = 'https://github.com/h2ocube/h2ocube_rails_test'
  spec.license       = 'MIT'

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ['lib']

  spec.add_dependency 'rspec-rails'
  spec.add_dependency 'factory_girl_rails'
  spec.add_dependency 'rubocop'
  spec.add_dependency 'capybara'
  spec.add_dependency 'timecop'
  spec.add_dependency 'database_cleaner'
end
