#!/usr/bin/python3

import os

def p(_str, indents=0):
    indentation = " " * indents
    print(indentation + _str)

def p1(_str):
    p(_str, 4)

def p2(_str):
    p(_str, 8)

def p3(_str):
    p(_str, 12)


def main():
    keys = []
    alphabet = "abcdefghijklmnopqrstuvwxyz"
    for letter in alphabet:
        keys.append((letter, letter.upper(), False))
        keys.append((letter.upper(), letter.upper(), True))

    numbers = "1234567890"
    shifted_numbers = "!@#$%^&*()"
    for i in range(0, len(numbers)):
        num = numbers[i]
        shifted = shifted_numbers[i]

        keys.append((num, num, False))
        keys.append((shifted, num, True))

    special = "`-=[]\;',./"
    shifted_special = "~_+{}|:\"<>?"
    names_special = [
        "GRAVE",
        "MINUS",
        "EQUAL",
        "LEFTBRACE",
        "RIGHTBRACE",
        "BACKSLASH",
        "SEMICOLON",
        "APOSTROPHE",
        "COMMA",
        "DOT",
        "SLASH"
    ]
    assert len(special) == len(names_special)

    for i in range(0, len(special)):
        text = special[i]
        shifted = shifted_special[i]
        name = names_special[i]

        keys.append((text, name, False))
        keys.append((shifted, name, True))


    for key in keys:
        display=key[0]
        key_code=key[1]
        shifted=key[2]

        p2('elif [ "x$1" == "x' + display + '" ]; then')
        if shifted:
            p3("__key_shifted_press \"KEY_" + key_code + "\"")
        else:
            p3("__key_press \"KEY_" + key_code + "\"")


if __name__ == "__main__":
    main()
