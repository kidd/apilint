require "bundler/gem_tasks"
require 'rspec/core/rake_task'

desc "Run Apilint specs."
RSpec::Core::RakeTask.new do |task|
  task.rspec_opts = ['--color', '--format', 'doc']
end

task :default => [:spec]
