# Use this file to easily define all of your cron jobs.
#
# It's helpful, but not entirely necessary to understand cron before proceeding.
# http://en.wikipedia.org/wiki/Cron

# Example:
#
set :output, "./.bin/cron_log.log"

every 1.minute do
  rake "unblock_all_blocked_keys"
end

every 5.minute do
  rake "delete_unused_keys"
end