#!/bin/bash

function ensure {
    def="$1"
    real="$2"

    if [[ $real == "" ]]
    then
	echo -n "$def"
    else
	echo -n "$real"
    fi
}
function valParam {
    key="$1"
    taglc="aemu$(echo "$1"|sed 's/-/_/g')"
    tag="${taglc^^}"
    defval="$2"

    val="${!tag}"
    if [[ $defval != "" ]]
    then
	val="$(ensure "$defval" "$val")"
    fi
    
    if [[ $val  != "" ]]
    then
	echo -n " $key $val"
    fi
}
function boolParam {
    key="$1"
    taglc="aemu$(echo "$1"|sed 's/-/_/g')"
    tag="${taglc^^}"
       
    val="${!tag}"
    if [[ $val  != "" ]]
    then
	echo -n " $key"
    fi
}

# default parameters
OPTS="-no-snapshot -no-window -accel off -engine qemu2 -noaudio -no-boot-anim -force-32bit"

# optional parameters

# -avd AEMU_AVD
OPTS="$OPTS$(valParam -avd "$AEMU_DEFAULT_AVD")"
# -memory AEMU_MEMORY
OPTS="$OPTS$(valParam -memory 512)"
# -port AEMU_PORT
OPTS="$OPTS$(valParam -port)"
# -logcat AEMU_LOGCAT
OPTS="$OPTS$(valParam -logcat)"
# -http-proxy AEMU_HTTP_PROXY
OPTS="$OPTS$(valParam -http-proxy)"
# -dns-server AEMU_DNS_SERVER
OPTS="$OPTS$(valParam -dns-server)"
# -timezone AEMU_TIMEZONE
OPTS="$OPTS$(valParam -timezone)"
# -shell-serial AEMU_SHELL_SERIAL
OPTS="$OPTS$(valParam -shell-serial)"
# -netspeed AEMU_NETSPEED
OPTS="$OPTS$(valParam -netspeed)"
# -netdelay AEMU_NETDELAY
OPTS="$OPTS$(valParam -netdelay)"
# -report-console AEMU_REPORT_CONSOLE
OPTS="$OPTS$(valParam -report-console)"
# -camera-front AEMU_CAMERA_FRONT
OPTS="$OPTS$(valParam -camera-front)"
# -camera-back AEMU_CAMERA_BACK
OPTS="$OPTS$(valParam -camera-back)"
# -selinux AEMU_SELINUX
OPTS="$OPTS$(valParam -selinux)"
# -debug AEMU_DEBUG
OPTS="$OPTS$(valParam -debug)"
# -gps AEMU_GPS
OPTS="$OPTS$(valParam -gps)"
# -radio AEMU_RADIO
OPTS="$OPTS$(valParam -radio)"

# -verbose AEMU_VERBOSE
OPTS="$OPTS$(boolParam -verbose)"
# -writable-system AEMU_WRITABLE_SYSTEM
OPTS="$OPTS$(boolParam -writeble-system)"
# -nocache AEMU_NOCACHE
OPTS="$OPTS$(boolParam -nocache)"
# -show-kernel AEMU_SHOW_KERNEL
OPTS="$OPTS$(boolParam -show-kernel)"
# -nojni AEMU_NOJNI
OPTS="$OPTS$(boolParam -nojni)"

# -prop needs special care
OPTS="$OPTS $AEMU_PROPS"

echo "executing emulator $OPTS"
exec emulator64-x86 $OPTS
