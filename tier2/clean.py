#!/usr/bin/env python

import sys

input = sys.argv[1]
output = sys.argv[2]

with open(input, 'rb') as f:
    text = f.read()
    text = text.replace(chr(0), '')
    text = text.replace(chr(11), '')

with open(output, 'wb') as f:
    f.write(text)

    
