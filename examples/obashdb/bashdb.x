# kshdb - Korn Shell Debugger main file
# adapted from 'Learning the Korn Shell' by Bill Rosenblatt (O'Reilly)
# by Cigy Cyriac (cigy@felix.tulblr.unisys.com)
# Main driver: constructs full script (with preamble) and runs it

echo 'Bourne-Again Shell Debugger version 0.1'

_pname=${0##*/}

[ $# -eq 0 ] && {
	echo "${_pname}: usage: ${_pname} <script_file>"
	exit 1
}

_guineapig=$1

[ -r $_guineapig ] || {
	echo "${_pname}: cannot read $_guineapig." >&2
	exit 1
}
shift

_tmpdir=/tmp
_libdir=.
_dbgfile=$_tmpdir/bashdb$$		#temp file for script being debugged

cat $_libdir/bashdb.pre $_guineapig > $_dbgfile
exec $BASH -x $_dbgfile $_guineapig $_tmpdir $_libdir "$@"
# end of bashdb
