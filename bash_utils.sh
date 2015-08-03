RED='\033[0;31m'
GREEN='\033[0;32m'
NOCOLOR='\033[0m'
# VERBOSE=False
# VERBOSE_CMD=False
function info() {
        if [ "$VERBOSE" == "True" ]; then
                printf "$@"
        fi
}

function exec_cmd() {
	OUTPUT=$($CMDLINE $@)
	echo "$OUTPUT"
        ERR_STR=$(echo $OUTPUT | grep -i 'error')
        if [ "$ERR_STR" == "" ]; then
                return 0
        else
                echo $ERR_STR
                return 1
        fi
}

function exec_cmd_check() {
        CINFO=$(echo "executing $@ " | sed 's/\%/\%\%/g')
        [ "$VERBOSE_CMD" == "True" ] && info "$CINFO"
        RESULT=$(exec_cmd $@)
        ERR=$?
        if [ $ERR -eq 0 ]; then
                info "${GREEN}SUCCESS${NOCOLOR}\n"
                return 0
        else
                info "${RED}FAIL${NOCOLOR} (%s)\n" "$RESULT"
                return 1
        fi
}

function read_param() {
	varname=$1
	if [ $# -gt 2 ]; then
		eval "$varname"=$3
		# declare -g "$varname"=$3
		return 0
	else
		echo "$2 needs an extra parameter"
		return 1
	fi
}

function echo_err() {
	echo "$@" 1>&2;
}

function exit_on_error() {
	if [ $? -ne 0 ]; then
		echo_err $@
		exit 1
	fi
}

function is_true() {
        R=$(echo $1 | tr '[a-z]' '[A-Z]')
        if [ "$R" == "TRUE" ]; then
                return 0
        fi
        return 1
}

# while [ $# -gt 0 ]; do
#	case $1 in
#		-f|--file)	
#				read_param FILENAME $@
#				exit_on_error
#				shift;;
#		*)
#				echo_err "parameter $1 unknown"
#				;;
#	esac
#	shift
#done
#
# if is_true $CREATE_VMS;; then
#	echo "si"
# fi

