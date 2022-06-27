all: refresh

add-remote:
	git remote add update_ssh_config https://github.com/linux-kdevops/update_ssh_config.git

# Use this if you have access
add-remote-dev:
	git remote add update_ssh_config git@github.com:linux-kdevops/update_ssh_config.git

add-commits:
	git subtree add --prefix=update_ssh_config update_ssh_config master

refresh:
	git fetch update_ssh_config
	git subtree pull --prefix=update_ssh_config update_ssh_config master
