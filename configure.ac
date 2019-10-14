dnl This is the original set of macros what the configure script is genereted from.
dnl You can modify this script instead of 'configure'; Then you need to run autoconf for changes to affect the final configure script.

AC_PREREQ([2.69])
AC_INIT([Shiraz GLUG website],[0.1])
AC_CONFIG_SRCDIR(config.yaml)

# This script accepts one argument : --with-hugo
AC_ARG_WITH(hugo, AS_HELP_STRING([--with-hugo], [Specify the path to extended version of hugo]),
	[],[with_hugo=check])

# Test if there is 'hugo' actually
AS_IF([test "x$with_hugo" = "xcheck"],
	[AC_PATH_PROG(HUGO,hugo)],
	[AS_IF(test "x$with_hugo" = "xno",
		[AC_MSG_FAILURE([This package can't do without hugo. Don't use --without-hugo])],
		[HUGO=$with_hugo])])
		
# Tests if this version of hugo is extended
AS_CASE(`$HUGO version`,[Hugo?Static?Site?Generator*extended*],[],
	[AC_MSG_FAILURE([This version of hugo is not valid, or is not the extended version])])

# Is here 'ss' or 'netstat' ?
AC_PATH_PROG(PortScanner,ss)

AS_IF([test -n "$PortScanner"], [PortScanner="$PortScanner -anOH"],
	[AC_PATH_PROG(PortScanner,netstat)
	AS_IF([test -n "$PortScanner"],
		[PortScanner="$PortScanner -an"],
		[AC_MSG_FAILURE([Nor ss neither netstat was found])])])

AC_MSG_CHECKING([to find a free local port])
PortsStats=`$PortScanner`
# checks to find a free port in range 1313-64000 based on sockets statistics.
for port in `seq 1313 64000`; do
	if echo $PortsStats | grep "[[ :]]$port " > /dev/null; then :;
	else
		PORT=$port
		break;
	fi;
done
		
AS_IF([test -n "$PORT"],AC_MSG_RESULT($PORT),AC_MSG_FAILURE([No free port was found]))

# Checks for 'sed'
AC_PROG_SED

dnl mark any variable fot substitution by AC_SUBST(variable)
AC_SUBST(HUGO)
AC_SUBST(PORT)

AC_CONFIG_FILES([Makefile])
AC_OUTPUT
