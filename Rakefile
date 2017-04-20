require 'rake/testtask'
require 'rspec/core/rake_task'

Rake::TestTask.new do |t|
  t.libs << 'test'
  t.test_files = FileList['test/*_test.rb']
  t.verbose = true
end

RSpec::Core::RakeTask.new(:spec) do |t|
  t.rspec_opts = '--color'
end

task default: [:test, :spec]
