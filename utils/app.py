#!/usr/bin/env python

import argparse
import os
import re
import sys

def process(file_contents):
    # TODO use an actual lexer/parser, not this (only partly working)
    # monstrosity.
    regex = r"@ifdef\s+\"(?P<define_name>[a-zA-Z_]+[a-zA-Z0-9_]*)\"\s+(?P<quotes1>\"\"\"|\")(?P<defined_value>.*?)(?P=quotes1)\s+(?:(?P<quotes2>\"\"\"|\")(?P<undefined_value>.*?)(?P=quotes2)\s+)?@endif"
    matches = re.finditer(regex, file_contents, re.DOTALL)
    processed_contents = file_contents

    for match in matches:
        section = match.group(0)
        define_name = match.group('define_name')
        defined_value = match.group('defined_value')
        undefined_value = match.group('undefined_value')

        if define_name in os.environ:
            replacement = defined_value
        elif undefined_value is not None:
            replacement = undefined_value
        else:
            replacement = ''

        processed_contents = processed_contents.replace(section, replacement, 1)

    return processed_contents

def run(file_path):
    try:
        with open(file_path, 'r+') as f:
            file_contents = f.read()
            output = process(file_contents)
    except IOError:
        print('Failed to open {}. Aborting'.format(file_path), file=sys.stderr)
        sys.exit(1)

    print(output)

if __name__ == '__main__':
    parser = argparse.ArgumentParser(
        description='abusque preprocessor (app) - \
        preprocess config files with ease'
    )

    parser.add_argument(
        'file_path',
        metavar='<path/to/file>',
        help='Path to file to preprocess'
    )

    args = parser.parse_args()

    run(args.file_path)
