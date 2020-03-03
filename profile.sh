###########################
#
# Common Oracle Environment
#
###########################


COE_ETC=~/COE
if [ -f ${COE_ETC}/variables.conf ] ; then
	. ${COE_ETC}/variables.conf
	. ${COE_ETC}/aliases.conf
	. ${COE_ETC}/functions.conf

	export PROMPT_COMMAND=ora_prompt

	if [ -z $ORACLE_HOME ] ; then
		if [ $CRS_EXISTS -eq 1 ] ; then
			dbrac GRID > /dev/null
		else
			export ORACLE_BASE=/u01/app/oracle
			export PATH=$DEFAULT_PATH
		fi
	else
		setohenv
	fi

else
	echo "variables not found in $COE_ETC"
	false
fi
