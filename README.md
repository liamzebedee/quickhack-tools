# quickhack-tools
Tools for quick hacks

`rsync -a code/ root@server:/code/`

`screen -S name` and Ctrl+A D. `screen -r name`

`PORT=80 nohup node . &`

`sudo ln -s /etc/nginx/sites-available/liamz.co /etc/nginx/sites-enabled/liamz.co`

`netstat -tulpn | grep :80`

`ln -s /etc/nginx/sites-available/liamz.co nginxconf`

`scp your_username@remotehost.edu:foobar.txt /local/dir`

`at /dev/urandom | base64 | head -c 15 && echo`

`git grep -C 3 TODO`

`htop` for viewing and killing processes easily in Unix systems

`git clone --depth=1 <remote_repo_url>` clone git repos quicker (to only depth 1 of commit history)

`rsync -az CODE_REPO/ yourserver.com:./CODE_REPO && ssh -t yourserver.com 'sudo PORT=80 node ./bot'` - easy simple deploy script with no install

`lsof -ti:8889 | xargs kill -9` to kill the process binding to port 8889 - ie "Port already in use"

`sudo !!` repeats previous command

`find . -name "*.sol" -exec mv  {} old \;` moves all files that match a pattern in a recursive fashion into `old/`
