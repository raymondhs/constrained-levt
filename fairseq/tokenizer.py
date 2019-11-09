# Copyright (c) Facebook, Inc. and its affiliates.
#
# This source code is licensed under the MIT license found in the
# LICENSE file in the root directory of this source tree.

import re

SPACE_NORMALIZER = re.compile(r"\s+")


def tokenize_line(line):
    line = SPACE_NORMALIZER.sub(" ", line)
    line = line.strip()
    if all(['|' in w for w in line.split()]):
        toks = [t.split('|') for t in line.split()]
        # remove factors
        return ['|'.join(t[:-1]) for t in toks]
    return line.split()

def get_factors(line):
    line = SPACE_NORMALIZER.sub(" ", line)
    line = line.strip()
    toks = [t.split('|') for t in line.split()]
    return [int(t[-1]) for t in toks]
