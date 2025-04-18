#!/bin/sh

EMU="$(echo "$1" | cut -d'/' -f5)"
CONFIG="/mnt/SDCARD/Emus/${EMU}/config.json"
OPT="/mnt/SDCARD/Emus/.emu_setup/opts/${EMU}.opt"

. "$OPT"

case "$CPU_MODE" in
    "smart")
        NEW_MODE="performance"
        NEW_DISPLAY="Perf"
        ;;
    "performance")
        NEW_MODE="overclock"
        NEW_DISPLAY="Overclock"
        ;;
    "overclock")
        NEW_MODE="smart"
		NEW_DISPLAY="Smart"
        ;;
esac

sed -i "s|\"CPU:.*\"|\"CPU: $NEW_DISPLAY\"|g" "$CONFIG"
sed -i "s|CPU_MODE=.*|CPU_MODE=\"$NEW_MODE\"|g" "$OPT"