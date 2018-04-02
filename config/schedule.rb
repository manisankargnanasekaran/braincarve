# Use this file to easily define all of your cron jobs.
#
# It's helpful, but not entirely necessary to understand cron before proceeding.
# http://en.wikipedia.org/wiki/Cron

# Example:
#
# set :output, "/path/to/my/cron_log.log"
#
# every 2.hours do
#   command "/usr/bin/some_great_command"
#   runner "MyModel.some_method"
#   rake "some:great:rake:task"
# end
#
set :bundle_command, "/home/ubuntu/.rvm/gems/ruby-2.4.1/bin/bundle exec"
set :environment, "development"
set :output, {:error => "log/cron_error_log.log", :standard => "log/cron_log.log"}

# every 4.days do
#   runner "AnotherModel.prune_old_records"
# end

# Learn more: http://github.com/javan/whenever
# every 1.minute do
#   runner "EmpMonthlySalary.monthly_salary_entry"
# end


every 1.month, :at => 'start of the month at 12:00am' do
  runner "EmpMonthlySalary.monthly_salary_entry"
end

#every :month, :on => '1st', :at => '12:05 am' do