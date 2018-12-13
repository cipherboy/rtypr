#!/bin/bash


function rtypr() {
    # Input event device to simulate events on.
    local input_device=""

    function __detect_input_device() {
        for index in `seq 0 100`; do
            device_path="/dev/input/event$index"

            if [ ! -e "$device_path" ]; then
                return 1
            fi

            if evemu-describe "$device_path" | grep -q -i 'keyboard'; then
                input_device="$device_path"
                return 0
            fi
        done

        return 1
    }

    # Pause between modifier and the modified key (e.g., between shift and
    # 2 == '@').
    local modifier_pause="0.01"

    # Pause between key down and key up.
    local bounce_pause="0.005"

    # Pause between characters.
    local character_pause="0.02"

    # Pause between segments.
    local segment_pause="0.1"

    # Pause before typing begins.
    local pretype_pause="5"

    # Which shift key to use
    local shift_key="LEFTSHIFT"

    # Text to type.
    local text=()

    function __key_down() {
        evemu-event "$input_device" --type EV_KEY --code "$1" --value 1 --sync
    }

    function __key_up() {
        evemu-event "$input_device" --type EV_KEY --code "$1" --value 0 --sync
    }

    function __key_press() {
        __key_down "$1"
        sleep "$bounce_pause"
        __key_up "$1"
    }

    function __key_shifted_press() {
        sleep "$modifier_pause"
        __key_down "KEY_$shift_key"
        sleep "$modifier_pause"
        __key_press "$1"
        sleep "$modifier_pause"
        __key_up "KEY_$shift_key"
        sleep "$modifier_pause"
    }

    function __char_to_keys() {
        if [ "x$1" == "x " ]; then
            __key_press "KEY_SPACE"
        elif [ "x$1" == "x
" ]; then
            __key_press "KEY_ENTER"
        # The rest of this function is generated by rtypr.py...
        # ...except for the else clause at the end.
        # Letters
        elif [ "x$1" == "xa" ]; then
            __key_press "KEY_A"
        elif [ "x$1" == "xA" ]; then
            __key_shifted_press "KEY_A"
        elif [ "x$1" == "xb" ]; then
            __key_press "KEY_B"
        elif [ "x$1" == "xB" ]; then
            __key_shifted_press "KEY_B"
        elif [ "x$1" == "xc" ]; then
            __key_press "KEY_C"
        elif [ "x$1" == "xC" ]; then
            __key_shifted_press "KEY_C"
        elif [ "x$1" == "xd" ]; then
            __key_press "KEY_D"
        elif [ "x$1" == "xD" ]; then
            __key_shifted_press "KEY_D"
        elif [ "x$1" == "xe" ]; then
            __key_press "KEY_E"
        elif [ "x$1" == "xE" ]; then
            __key_shifted_press "KEY_E"
        elif [ "x$1" == "xf" ]; then
            __key_press "KEY_F"
        elif [ "x$1" == "xF" ]; then
            __key_shifted_press "KEY_F"
        elif [ "x$1" == "xg" ]; then
            __key_press "KEY_G"
        elif [ "x$1" == "xG" ]; then
            __key_shifted_press "KEY_G"
        elif [ "x$1" == "xh" ]; then
            __key_press "KEY_H"
        elif [ "x$1" == "xH" ]; then
            __key_shifted_press "KEY_H"
        elif [ "x$1" == "xi" ]; then
            __key_press "KEY_I"
        elif [ "x$1" == "xI" ]; then
            __key_shifted_press "KEY_I"
        elif [ "x$1" == "xj" ]; then
            __key_press "KEY_J"
        elif [ "x$1" == "xJ" ]; then
            __key_shifted_press "KEY_J"
        elif [ "x$1" == "xk" ]; then
            __key_press "KEY_K"
        elif [ "x$1" == "xK" ]; then
            __key_shifted_press "KEY_K"
        elif [ "x$1" == "xl" ]; then
            __key_press "KEY_L"
        elif [ "x$1" == "xL" ]; then
            __key_shifted_press "KEY_L"
        elif [ "x$1" == "xm" ]; then
            __key_press "KEY_M"
        elif [ "x$1" == "xM" ]; then
            __key_shifted_press "KEY_M"
        elif [ "x$1" == "xn" ]; then
            __key_press "KEY_N"
        elif [ "x$1" == "xN" ]; then
            __key_shifted_press "KEY_N"
        elif [ "x$1" == "xo" ]; then
            __key_press "KEY_O"
        elif [ "x$1" == "xO" ]; then
            __key_shifted_press "KEY_O"
        elif [ "x$1" == "xp" ]; then
            __key_press "KEY_P"
        elif [ "x$1" == "xP" ]; then
            __key_shifted_press "KEY_P"
        elif [ "x$1" == "xq" ]; then
            __key_press "KEY_Q"
        elif [ "x$1" == "xQ" ]; then
            __key_shifted_press "KEY_Q"
        elif [ "x$1" == "xr" ]; then
            __key_press "KEY_R"
        elif [ "x$1" == "xR" ]; then
            __key_shifted_press "KEY_R"
        elif [ "x$1" == "xs" ]; then
            __key_press "KEY_S"
        elif [ "x$1" == "xS" ]; then
            __key_shifted_press "KEY_S"
        elif [ "x$1" == "xt" ]; then
            __key_press "KEY_T"
        elif [ "x$1" == "xT" ]; then
            __key_shifted_press "KEY_T"
        elif [ "x$1" == "xu" ]; then
            __key_press "KEY_U"
        elif [ "x$1" == "xU" ]; then
            __key_shifted_press "KEY_U"
        elif [ "x$1" == "xv" ]; then
            __key_press "KEY_V"
        elif [ "x$1" == "xV" ]; then
            __key_shifted_press "KEY_V"
        elif [ "x$1" == "xw" ]; then
            __key_press "KEY_W"
        elif [ "x$1" == "xW" ]; then
            __key_shifted_press "KEY_W"
        elif [ "x$1" == "xx" ]; then
            __key_press "KEY_X"
        elif [ "x$1" == "xX" ]; then
            __key_shifted_press "KEY_X"
        elif [ "x$1" == "xy" ]; then
            __key_press "KEY_Y"
        elif [ "x$1" == "xY" ]; then
            __key_shifted_press "KEY_Y"
        elif [ "x$1" == "xz" ]; then
            __key_press "KEY_Z"
        elif [ "x$1" == "xZ" ]; then
            __key_shifted_press "KEY_Z"

        # Number keys
        elif [ "x$1" == "x1" ]; then
            __key_press "KEY_1"
        elif [ "x$1" == "x!" ]; then
            __key_shifted_press "KEY_1"
        elif [ "x$1" == "x2" ]; then
            __key_press "KEY_2"
        elif [ "x$1" == "x@" ]; then
            __key_shifted_press "KEY_2"
        elif [ "x$1" == "x3" ]; then
            __key_press "KEY_3"
        elif [ "x$1" == "x#" ]; then
            __key_shifted_press "KEY_3"
        elif [ "x$1" == "x4" ]; then
            __key_press "KEY_4"
        elif [ "x$1" == "x$" ]; then
            __key_shifted_press "KEY_4"
        elif [ "x$1" == "x5" ]; then
            __key_press "KEY_5"
        elif [ "x$1" == "x%" ]; then
            __key_shifted_press "KEY_5"
        elif [ "x$1" == "x6" ]; then
            __key_press "KEY_6"
        elif [ "x$1" == "x^" ]; then
            __key_shifted_press "KEY_6"
        elif [ "x$1" == "x7" ]; then
            __key_press "KEY_7"
        elif [ "x$1" == "x&" ]; then
            __key_shifted_press "KEY_7"
        elif [ "x$1" == "x8" ]; then
            __key_press "KEY_8"
        elif [ "x$1" == "x*" ]; then
            __key_shifted_press "KEY_8"
        elif [ "x$1" == "x9" ]; then
            __key_press "KEY_9"
        elif [ "x$1" == "x(" ]; then
            __key_shifted_press "KEY_9"
        elif [ "x$1" == "x0" ]; then
            __key_press "KEY_0"
        elif [ "x$1" == "x)" ]; then
            __key_shifted_press "KEY_0"

        # Special characters
        elif [ "x$1" == "x\`" ]; then
            __key_press "KEY_GRAVE"
        elif [ "x$1" == "x~" ]; then
            __key_shifted_press "KEY_GRAVE"
        elif [ "x$1" == "x-" ]; then
            __key_press "KEY_MINUS"
        elif [ "x$1" == "x_" ]; then
            __key_shifted_press "KEY_MINUS"
        elif [ "x$1" == "x=" ]; then
            __key_press "KEY_EQUAL"
        elif [ "x$1" == "x+" ]; then
            __key_shifted_press "KEY_EQUAL"
        elif [ "x$1" == "x[" ]; then
            __key_press "KEY_LEFTBRACE"
        elif [ "x$1" == "x{" ]; then
            __key_shifted_press "KEY_LEFTBRACE"
        elif [ "x$1" == "x]" ]; then
            __key_press "KEY_RIGHTBRACE"
        elif [ "x$1" == "x}" ]; then
            __key_shifted_press "KEY_RIGHTBRACE"
        elif [ "x$1" == "x\\" ]; then
            __key_press "KEY_BACKSLASH"
        elif [ "x$1" == "x|" ]; then
            __key_shifted_press "KEY_BACKSLASH"
        elif [ "x$1" == "x;" ]; then
            __key_press "KEY_SEMICOLON"
        elif [ "x$1" == "x:" ]; then
            __key_shifted_press "KEY_SEMICOLON"
        elif [ "x$1" == "x'" ]; then
            __key_press "KEY_APOSTROPHE"
        elif [ "x$1" == 'x"' ]; then
            __key_shifted_press "KEY_APOSTROPHE"
        elif [ "x$1" == "x," ]; then
            __key_press "KEY_COMMA"
        elif [ "x$1" == "x<" ]; then
            __key_shifted_press "KEY_COMMA"
        elif [ "x$1" == "x." ]; then
            __key_press "KEY_DOT"
        elif [ "x$1" == "x>" ]; then
            __key_shifted_press "KEY_DOT"
        elif [ "x$1" == "x/" ]; then
            __key_press "KEY_SLASH"
        elif [ "x$1" == "x?" ]; then
            __key_shifted_press "KEY_SLASH"
        else
            echo "Unknown key for character: [$1]"
        fi

        sleep "$character_pause"
    }

    function __str_to_keys() {
        local str="$1"
        for char in $(seq 1 ${#str}); do
            local key="${str:$char-1:1}"
            __char_to_keys "$key"
        done
    }

    function __from_file() {
        local path="$1"
        local contents=""
        if [ "x$path" != "x-" ]; then
            contents="$(cat "$path")"
        else
            contents="$(cat)"
        fi

        sleep "$pretype_pause"
        __str_to_keys "$contents"
    }

    function __from_command_line() {
        local segment_count="${#text}"

        sleep "$pretype_pause"
        for segment_index in $(seq 0 "$segment_count"); do
            local segment="${text[$segment_index]}"

            __str_to_keys "$segment"

            if [ "$segment_index" != "$segment_count" ]; then
                sleep "$segment_pause"
            fi
        done
    }

    function __help() {
        echo "Usage: rtypr [options] [--] [<text>...]"
        echo ""
        echo "rtypr is an interface over evemu to type text. Note that this"
        echo "program frequently requires root access to operate."
        echo "Alternatively, grant the current user access to the \`input\`"
        echo "group."
        echo ""
        echo "Options:"
        echo ""
        echo "--bounce-pause, -b <sleep>: Time to sleep between pressing a"
        echo "                            key and releasing it."
        echo "                            Currently: $bounce_pause"
        echo ""
        echo "--character-pause, -c <sleep>: Time to sleep between each key"
        echo "                               event."
        echo "                               Currently: $character_pause"
        echo ""
        echo "--file, -f: Read text to retype from a file."
        echo ""
        echo "--help, -h: Show this help text."
        echo ""
        echo "--input-device, -i <path>: Device to send keyboard events to."
        echo "                           Currently: $input_device"
        echo ""
        echo "--modifier-pause, -m <sleep>: Time to sleep between hitting"
        echo "                              shift and the modified key."
        echo "                              Currently: $modifier_pause"
        echo ""
        echo "--pretype-pause, -p <sleep>: Time to sleep between starting"
        echo "                             rtype and the first event."
        echo "                             Currently: $pretype_pause"
        echo ""
        echo "--segment-pause, -s <sleep>: Time to sleep between each text"
        echo "                             segment."
        echo "                             Currently: $segment_pause"
        echo ""
        echo "--shift-key, -k <key>: Name of the shift key to use."
        echo "                       Currently: $shift_key"
        echo ""
        echo "--stdin, -: Read text to retype from stdin."
        echo ""
        echo "Note that when no input is given, this help message is printed."
    }

    function __main() {
        local seen_options_end="false"
        local show_help="false"
        local file_path=""

        for arg_index in $(seq 1 "$#"); do
            local arg="$1"
            shift

            if [ "x$arg" == "x" ]; then
                continue
            elif [ "x$arg" == "x--bounce-pause" ] ||
                    [ "x$arg" == "x-bounce-pause" ] ||
                    [ "x$arg" == "x--bounce_pause" ] ||
                    [ "x$arg" == "x-bounce_pause" ] ||
                    [ "x$arg" == "x-b" ]; then
                bounce_pause="$1"
                shift
            elif [ "x$arg" == "x--character-pause" ] ||
                    [ "x$arg" == "x-character-pause" ] ||
                    [ "x$arg" == "x--character_pause" ] ||
                    [ "x$arg" == "x-character_pause" ] ||
                    [ "x$arg" == "x-c" ]; then
                character_pause="$1"
                shift
            elif [ "x$arg" == "x--file" ] ||
                    [ "x$arg" == "x-file" ] ||
                    [ "x$arg" == "x-f" ]; then
                file_path="$1"
                shift
            elif [ "x$arg" == "x--help" ] || [ "x$arg" == "x-help" ] ||
                    [ "x$arg" == "x-h" ]; then
                show_help="true"
            elif [ "x$arg" == "x--input-device" ] ||
                    [ "x$arg" == "x-input-device" ] ||
                    [ "x$arg" == "x--input_device" ] ||
                    [ "x$arg" == "x-input_device" ] ||
                    [ "x$arg" == "x-i" ]; then
                input_device="$1"
                shift
            elif [ "x$arg" == "x--modifier-pause" ] ||
                    [ "x$arg" == "x-modifier-pause" ] ||
                    [ "x$arg" == "x--modifier_pause" ] ||
                    [ "x$arg" == "x-modifier_pause" ] ||
                    [ "x$arg" == "x-m" ]; then
                modifier_pause="$1"
                shift
            elif [ "x$arg" == "x--pretype-pause" ] ||
                    [ "x$arg" == "x-pretype-pause" ] ||
                    [ "x$arg" == "x--pretype_pause" ] ||
                    [ "x$arg" == "x-pretype_pause" ] ||
                    [ "x$arg" == "x-p" ]; then
                pretype_pause="$1"
                shift
            elif [ "x$arg" == "x--segment-pause" ] ||
                    [ "x$arg" == "x-segment-pause" ] ||
                    [ "x$arg" == "x--segment_pause" ] ||
                    [ "x$arg" == "x-segment_pause" ] ||
                    [ "x$arg" == "x-s" ]; then
                segment_pause="$1"
                shift
            elif [ "x$arg" == "x--shift-key" ] ||
                    [ "x$arg" == "x-shift-key" ] ||
                    [ "x$arg" == "x--shift_key" ] ||
                    [ "x$arg" == "x-shift_key" ] ||
                    [ "x$arg" == "x-k" ]; then
                shift_key="$1"
                shift
            elif [ "x$arg" == "x--stdin" ] ||
                    [ "x$arg" == "x-stdin" ] ||
                    [ "x$arg" == "x-" ]; then
                file_path="-"
            elif [ "x$arg" == "x--" ]; then
                break
            else
                text+=("$arg")
            fi
        done

        # Process any remaining arguments as text...
        for arg in "$@"; do
            text+=("$arg")
        done

        # If we have no input, show the help.
        if [ "${#text}" == "0" ] && [ "x$file_path" == "x" ]; then
            show_help="true"
        fi

        if [ "$show_help" == "true" ]; then
            __help
            return 0
        fi

        if [ "x$file_path" != "x" ]; then
            __from_file "$file_path"
        else
            __from_command_line
        fi

        sleep 0.1
    }

    __detect_input_device
    __main "$@"
}

rtypr "$@"