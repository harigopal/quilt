require_relative 'lib/scarf/version'

Gem::Specification.new do |s|
  s.authors = ['Hari Gopal', 'swdyh']
  s.files = Dir['lib/*.rb', 'lib/scarf/*.rb']
  s.name = 'scarf'
  s.require_paths = ['lib']
  s.summary = 'A Ruby library for generating initial avatars and identicons.'
  s.version = Scarf::VERSION

  s.email = 'mail@harigopal.in'
  s.homepage = 'https://github.com/harigopal/scarf'
  s.license = 'MIT'

  s.description = 'A Ruby library for generating initial avatars and identicons.'
  s.test_files = ['test/test_helper.rb']

  s.required_ruby_version = '>= 2.3.0'

  s.add_development_dependency 'rake', '~> 12.0'
  s.add_development_dependency 'test-unit', '~> 3.1'
  s.add_development_dependency 'rspec', '~> 3.5'
end
