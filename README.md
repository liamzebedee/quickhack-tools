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

`find . -name '*.js.map' -mtime -1 | grep -v node_modules | xargs rm` deletes all of the accidentally generated .js.map files from a TypeScript compile. (remember the quotes on the `-name` param, it will glob expand otherwise)

`stat -f %A file.txt` - show octal permissions of file (good for SSH)

`ssh -fN -L 7082:localhost:7080 ubuntu@blah.blah.blah.blah` - quickly expose blah.blah.blah.blah:7080 to your local pc

### Proxying http://localhost to https://localhost
This is simple on Unix systems using [mitmproxy](https://mitmproxy.org/):

```bash
mitmdump -p 443 --mode reverse:http://localhost:3000/
```

### Bash
#### Checking if a command is installed
```
if ! [ -x "$(command -v gsed)" ]; then
    echo 'Error: gsed is not installed.' >&2
    exit 1
fi
```

#### Updating a variable in a file
Say you have a file `migrations/2_deploy_contracts.js`, and somewhere in the file is the line below:

```js
const UniswapFactoryAddress = '0x2dF4d51f6549D8E29a77C5E981F441376F15fE15' // UniswapFactory contract address
```

We want to replace the **value** of the variable (the hex string) with another value. This is actually quite simple in sed. 

```sh
# use gsed on macOS
sed -i -e "/UniswapFactoryAddress/s/0x[a-fA-F0-9]\{0,40\}/$FACTORY/" ../../migrations/2_deploy_contracts.js
```

The string you see:
 1. Matches a line which contains `UniswapFactoryAddress`
 2. Replaces (`s` command) the part of the line matching the hexadecimal pattern `0x[a-fA-F0-9]\{0,40\}`. Note in sed regex, you must escape `{`
 3. With the variable contained in $FACTORY

Using the `-e` flag means it updates the file, in-place!
