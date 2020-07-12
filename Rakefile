require 'rake'
require 'rspec/core/rake_task'
require_relative 'server.rb'

RSpec::Core::RakeTask.new(:spec) 

task :unblock_all_blocked_keys do
  Index.keyBase.unblockAllBlockedKeys
end

task :delete_unused_keys do
  Index.keyBase.deleteAllUnusedKeys
end

task :start do
  %x[rackup -p 9292 -s thin]
end

task :default  => :spec