# In .ssh/authorized_keys
# Set the command for when the client connects
# command="~/autotunnel-server.sh $SSH_ORIGINAL_COMMAND > ~/client.log 2>&1" ssh-rsa AAAAB3...== USER@HOST


echo `TZ=Australia/Sydney date`
echo Connecting from $1
port=$1

sshparams="-o UserKnownHostsFile=/dev/null -oStrictHostKeyChecking=no -oServerAliveInterval=240"

# Kill previous local tunnels
lsof -ti:8889 | xargs kill -9
lsof -ti:9000 | xargs kill -9

# Then setup new local tunnels
ssh $sshparams -X -f lzedward@localhost -p $port -L *:8889:localhost:8887 -N

# Keep connection open
# We need this so we can pass the remote port through in the 
read
exit
