# `rtypr`

`rtypr` is an interface over evemu to type text


## Dependencies

This script relies on `evemu-device` and `evemu-event` being present in PATH.
Additionally, it generally assumes root access and/or an account with
appropriate permissions (group: `input`).

Other common utilities used are `grep` and `sleep`.

If Unicode support is enabled, `iconv`, `xxd`, and `sed` will be expected.


## Usage

To call `rtypr` while reading from stdin:

    rtypr --stdin

To call `rtypr` with text to retype:

    rtypr "Hello World!"

Note that multiple textual arguments are treated as different "segments"; this
allows for a segment pause time between each if other events are required.


    rtypr --segment-pause 5 <username> <password>

That way, `rtypr` can type the username, you can switch to the password field,
and `rtypr` will type the password as well. However, note that this leaks the
password via the command line arguments. I'd suggest using a file and/or stdin
to give `rtypr` the password.

Currently `rtypr` doesn't support multiple files and stdin is treated as one
segment.


## Help Text

When calling `rtypr` with the `--help` option before `--`, the current delays
and files will be printed if any specified. The defaults are shown below:

    Usage: rtypr [options] [--] [<text>...]

    rtypr is an interface over evemu to type text. Note that this
    program frequently requires root access to operate.
    Alternatively, grant the current user access to the `input`
    group.

    Options:

    --bounce-pause, -b <sleep>: Time to sleep between pressing a
                                key and releasing it.
                                Currently: 0.005

    --character-pause, -c <sleep>: Time to sleep between each key
                                   event.
                                   Currently: 0.02

    --file, -f: Read text to retype from a file.

    --help, -h: Show this help text.

    --input-device, -i <path>: Device to send keyboard events to.
                               Currently: /dev/input/event3

    --modifier-pause, -m <sleep>: Time to sleep between hitting
                                  shift and the modified key.
                                  Currently: 0.01

    --pretype-pause, -p <sleep>: Time to sleep between starting
                                 rtype and the first event.
                                 Currently: 5

    --segment-pause, -s <sleep>: Time to sleep between each text
                                 segment.
                                 Currently: 0.1

    --shift-key, -k <key>: Name of the shift key to use.
                           Currently: LEFTSHIFT

    --stdin, -: Read text to retype from stdin.

    Note that when no input is given, this help message is printed.


## Overview

`rtypr` is a single bash script, `rtypr.sh` in this repo. The included python
script, `generate_keycodes.py`, generates the series of `elif` statements to
convert characters to keycodes. This code could be reused by others if
desired, to convert characters to keycodes if desired. Each character is an
element of the `keys` array and is a 3-tuple of `(character, name, shifted)`,
where `name` is the name of the key without the `KEY_` prefix, and shifted
is a boolean of whether or not the shift key modifier is required.
