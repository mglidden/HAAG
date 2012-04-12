set :application, 'haag' 
set :repository,  'git@github.com:masong/HAAG.git'

set :scm, 'git' 
set :user, 'solvis'
#set :scm_passphrase, ""

set :deploy_via, :remote_cache

# role :web, "your web-server here"                          # Your HTTP server, Apache/etc
# role :app, "your app-server here"                          # This may be the same as your `Web` server
# role :db,  "your primary db-server here", :primary => true # This is where Rails migrations will run
# role :db,  "your slave db-server here"

set :keep_releases, 5

# if you're still using the script/reaper helper you will need
# these http://github.com/rails/irs_process_scripts

# If you are using Passenger mod_rails uncomment this:
# namespace :deploy do
#   task :start do ; end
#   task :stop do ; end
#   task :restart, :roles => :app, :except => { :no_release => true } do
#     run "#{try_sudo} touch #{File.join(current_path,'tmp','restart.txt')}"
#   end
# end


# This should really go in staging.rb:
set :branch, 'master'
server 'integration.solvis.net.br', :app, :web, :db, :god, :delayed_job, :gateway, :primary => true
set :deploy_to, "/home/#{user}/rails-deploy/haag"
set :rails_env, 'staging'
