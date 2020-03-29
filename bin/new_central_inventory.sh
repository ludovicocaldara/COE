# as root
L_orainv=/ORA/dbs01/oracle/oraInventory
if [ ! -f /etc/oraInst.loc ] ; then
	cat <<EOF > /etc/oraInst.loc
inventory_loc=$L_orainv
inst_group=oinstall
EOF
fi

chown oracle:oinstall /etc/oraInst.loc

[ -d $L_orainv ] || mkdir -p $L_orainv && chown oracle:oinstall $L_orainv

