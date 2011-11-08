# Rakefile 
# to help simplify running tests for the forgetful and/or lazy
#
# rake -T to see the target options
#

require 'rake'
require 'rspec/core/rake_task'

DEFAULT_RSPEC_OPTS = ["--format documentation"]

task :local_env do
  ENV['WEBXRAY'] = 'local'
end

desc "Run suite against local goggles"
RSpec::Core::RakeTask.new(:local) do |t|
  t.rspec_opts = DEFAULT_RSPEC_OPTS
end
task :local => :local_env


task :prod_env do
  ENV['WEBXRAY'] = 'production'
end

desc "Run suite against production goggles"
RSpec::Core::RakeTask.new(:prod) do |t|
  t.rspec_opts = DEFAULT_RSPEC_OPTS
end
task :prod => :prod_env


