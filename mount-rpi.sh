# Mounts the RPI filesystem using SSH to a directory 'proto'
# For macOS
# Because OSXFuse and sshfs are shit on Mac.

# ./mount-rpi.sh connect

# Unmounting:
# ./mount-rpi.sh unmount

unmount() {
	umount proto;
	ps ax | grep sshfs | cut -d' ' -f1 | xargs kill -9;
}
connect() {
	unmount;
	sshfs -o auto_cache,defer_permissions,noappledouble,reconnect,ServerAliveInterval=15,ServerAliveCountMax=3 pi@raspberrypi.local:proto proto;
}

$@
