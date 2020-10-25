# allow for local mode modules
node_dir=$HOME/.config/node_modules
PATH="$node_dir/bin:$PATH"
export npm_config_prefix=$node_dir

export PATH="$HOME/.cargo/bin:$PATH"
