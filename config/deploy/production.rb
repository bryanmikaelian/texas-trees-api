server '54.88.233.170', user: 'ubuntu', roles: %w{app web db}, other_property: :other_value

set :stage, :production
set :rails_env, 'production'
set :unicorn_pid, -> { File.join(current_path, "tmp", "pids", "unicorn.texas-trees.pid") }
set :unicorn_rack_env, 'production'
