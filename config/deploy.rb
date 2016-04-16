# config valid only for current version of Capistrano
lock '3.4.0'

set :application, 'solutions'
set :repo_url, 'git@github.com:gsamokovarov/solutions.git'

# Default deploy_to directory is /var/www/my_app_name
set :deploy_to, '/hack/solutions'

# Setup rbenv.
set :rbenv_type, :user
set :rbenv_ruby, File.read('.ruby-version').strip

# Listen on 3000 as the nginx config expects it.
set :puma_bind, %w(tcp://127.0.0.1:3000)

set :linked_dirs, fetch(:linked_dirs, []).concat(%w(tmp/pids tmp/sockets log))

namespace :deploy do
  after :restart, :clear_cache do
    on roles(:web), in: :groups, limit: 3, wait: 10 do
      # Here we can do anything such as:
      # within release_path do
      #   execute :rake, 'cache:clear'
      # end
    end
  end
end
