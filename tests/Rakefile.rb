#on the CLI use the command "rake spec" ...to invoke this rake file , which will in turn invoke your tests in the spec directory with the options mentioned in the rakefile
#


require 'rake'
require 'rspec/core/rake_task'
 
RSpec::Core::RakeTask.new(:spec) do |t|
t.pattern = Dir.glob('spec/*_spec.rb')
t.rspec_opts = '--format documentation --out rspec.txt'
t.rspec_opts = '--format html --out rspec_results.html'
# t.rspec_opts << ' more options'
#t.rcov = true

end
task :default => :spec