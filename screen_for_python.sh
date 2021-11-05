#!/bin/sh
set -e

usage() { echo "Usage: $0 [-p <string>] [-p <string>] [-s <string>]" 1>&2; exit 1; }


while getopts p:n:s: o
do	case "$o" in
	p)	path="$OPTARG";;
	n)	screen_name="$OPTARG";;
    s)  script_name="$OPTARG";;
	[?]) echo "Error unkonwn option $o" & usage;;
	esac
done

command=$(cat << EOF
cd "${path}"
. venv/bin/activate
python "${script_name}"
EOF
)

screen -dmS "${screen_name}" /bin/bash -c "$command"
