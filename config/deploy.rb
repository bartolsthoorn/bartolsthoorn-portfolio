load 'deploy' if respond_to?(:namespace) # cap2 differentiator

set :user, 'bartolsthoorn'
set :application, 'default'

set :repository, 'git@github.com:bartolsthoorn/bartolsthoorn-portfolio.git'

set :default_environment, {  
  'LANG' => 'en_US.UTF-8'  
 }


server 'pro-006.openminds.be', :app, :web, :db, :primary => true

begin
  require 'openminds_deploy/defaults'
  require 'openminds_deploy/git'
  require 'openminds_deploy/passenger'
  
rescue LoadError => e
  $stderr.puts <<INSTALL
There was an exception while trying to deploy your application. Most likely you do not have the openminds_deploy gem installed.
You can install the gem like this:
  gem install openminds_deploy
INSTALL
  $stderr.puts "Exception thrown: #{e}"
  exit 1
end