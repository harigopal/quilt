require_relative 'lib/scarf/version'

Gem::Specification.new do |s|
  s.name = 'scarf'
  s.version = Scarf::VERSION
  s.licenses = ['MIT']
  s.summary = 'A Ruby library for generating initial avatars and identicons.'
  s.description = "A Ruby library for generating initial avatars and identicons, forked from swdyh/quilt\nhttps://github.com/harigopal/quilt"
  s.authors = %w(harigopal swdyh)
  s.email = 'mail@harigopal.in'
  s.files = Dir['lib/*.rb', 'lib/scarf/*.rb']
  s.homepage = 'https://github.com/harigopal/scarf'
  s.require_paths = ['lib']
  s.test_files = ['test/test_helper.rb']
  s.required_ruby_version = '>= 2.3.0'

  s.add_development_dependency 'rake', '~> 12.0'
  s.add_development_dependency 'test-unit', '~> 3.1'
  s.add_development_dependency 'rspec', '~> 3.5'
end
