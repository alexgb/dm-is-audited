require 'rubygems'
require 'bundler'
begin
  Bundler.setup(:default, :development)
rescue Bundler::BundlerError => e
  $stderr.puts e.message
  $stderr.puts "Run `bundle install` to install missing gems"
  exit e.status_code
end
require 'rake'

require 'jeweler'
Jeweler::Tasks.new do |gem|
  gem.name = "dm-is-audited"
  gem.homepage = "http://github.com/alexgb/dm-is-audited"
  gem.license = "MIT"
  gem.summary = %Q{model level auditing for DataMapper}
  gem.description = %Q{Plugin for DataMapper to allow for simple auditing of models. This plugin does not implement auditing itself, but creates a block context in which you can implement your own auditing procedures.}
  gem.email = "alex.gibbons [a] gmail [dot] com"
  gem.authors = ["Alex Gibbons"]
  gem.add_dependency 'dm-core'
end
Jeweler::RubygemsDotOrgTasks.new

require 'rake/testtask'
Rake::TestTask.new(:test) do |test|
  test.libs << 'lib' << 'test'
  test.pattern = 'test/**/test_*.rb'
  test.verbose = true
end

require 'rcov/rcovtask'
Rcov::RcovTask.new do |test|
  test.libs << 'test'
  test.pattern = 'test/**/test_*.rb'
  test.verbose = true
end

task :default => :test

require 'rake/rdoctask'
Rake::RDocTask.new do |rdoc|
  version = File.exist?('VERSION') ? File.read('VERSION') : ""

  rdoc.rdoc_dir = 'rdoc'
  rdoc.title = "dm-is-audited #{version}"
  rdoc.rdoc_files.include('README*')
  rdoc.rdoc_files.include('lib/**/*.rb')
end
