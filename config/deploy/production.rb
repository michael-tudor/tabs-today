set :stage, :production
set :rails_env, :production
set :deploy_to, '/usr/local/tabs.today'
set :repo_url, 'git@github.com:toderashco/tabs_today.git'
set :branch, 'master'
server 'localhost', user: 'tabs_today_production', roles: %w{web app db}
