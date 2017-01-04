Two buddies ssh into the same server. They are on terminals `/dev/pts/0` and `/dev/pts/1`.

`head /dev/pts/0 > /dev/pts/1` sends one terminal's output to another.

`echo \`ls /\` > /dev/pts/1` 

`pstree -s $$`
