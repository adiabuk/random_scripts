#!/bin/bash -x

allow=`echo $SSH_CLIENT|awk {'print $1'}`
[[ "$1" == "allow" ]] || allow=192.168.0.1


cat > /etc/apache2/sites-enabled/allow << EOF
<Macro Allow>
    allow from $allow
</Macro>
EOF

service apache2 restart

