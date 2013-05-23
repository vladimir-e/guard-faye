# encoding: utf-8

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
  # gem is a Gem::Specification... see http://docs.rubygems.org/read/chapter/20 for more options
  gem.name = "guard-faye"
  gem.homepage = "http://github.com/d4rk5eed/guard-faye"
  gem.license = "MIT"
  gem.summary = %Q{ Guard plugin for faye }
  gem.description = %Q{ This plugin automatically starts and restart Faye message server under Guard }
  gem.email = "y.zemlyanukhin@mdterra.org"
  gem.authors = ["Yaroslav Zemlyanukhin"]
  # dependencies defined in Gemfile
  gem.add_dependency 'sys-proctable'
  gem.files = Dir.glob("lib/**/*.rb")
end
Jeweler::RubygemsDotOrgTasks.new

require 'rdoc/task'
Rake::RDocTask.new do |rdoc|
  version = File.exist?('VERSION') ? File.read('VERSION') : ""

  rdoc.rdoc_dir = 'rdoc'
  rdoc.title = "guard-faye #{version}"
  rdoc.rdoc_files.include('README*')
  rdoc.rdoc_files.include('lib/**/*.rb')
end
