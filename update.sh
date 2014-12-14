bundle install
bundle exec rake db:migrate
bundle exec rake assets:precompile
touch tmp/restart.txt
sudo /etc/init.d/nginx restart
