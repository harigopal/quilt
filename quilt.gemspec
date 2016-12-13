Gem::Specification.new do |s|
  s.name = 'quilt'
  s.version = '0.1.0'
  s.licenses = ['MIT']
  s.summary = 'A Ruby library for generating identicons.'
  s.description = "A Ruby library for generating identicons, forked from swdyh/quilt\nhttps://github.com/harigopal/quilt"
  s.authors = %w(swdyh harigopal)
  s.email = 'mail@harigopal.in'
  s.files = %w(lib/quilt.rb)
  s.homepage = 'https://github.com/harigopal/quilt'
  s.require_paths = ['lib']
  s.test_files = ['test/test_helper.rb']
  s.required_ruby_version = '>= 2.3.0'
  s.add_development_dependency 'rake'
  s.add_development_dependency 'test-unit'
end
