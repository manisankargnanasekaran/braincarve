rm -R /braincarve/tmp
RAILS_ENV=test bundle install
# RAILS_ENV=test bundle exec rake db:environment:set RAILS_ENV=test
RAILS_ENV=test bundle exec rake db:drop db:create db:migrate db:seed
RAILS_ENV=test bundle exec rake assets:precompile
RAILS_ENV=test puma -C config/puma.rb