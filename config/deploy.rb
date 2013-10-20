set :user, 'bart'
set :application, 'bartolsthoorn'

# Deploy in ~ and via cache
set :use_sudo, false
default_run_options[:pty] = true
ssh_options[:forward_agent] = true
set :deploy_via, :remote_cache

set :repository, 'git@github.com:bartolsthoorn/bartolsthoorn-portfolio.git'

set :default_environment, {  
  'LANG' => 'en_US.UTF-8'  
}

server '109.74.192.211', :app, :web, :db, :primary => true

set :deploy_to, '/home/bart/apps/bartolsthoorn'
