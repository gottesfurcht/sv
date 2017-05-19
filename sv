#!/usr/bin/env python3

import re
import sys
from pysword.modules import SwordModules
from argparse import ArgumentParser

parser = ArgumentParser()
parser.add_argument('book', nargs=1)
parser.add_argument('chapter', nargs=1, type=int)
parser.add_argument('verse', nargs=1, type=int)

args = parser.parse_args()
book = args.book[0]
chapter = args.chapter[0]
verse = args.verse[0]
modules = SwordModules()
found_modules = modules.parse_modules()
bibles = ['GerLut1912', 'ABPGRK', 'TRA', 'TR', 'WHNU']
verses = []

for bible in bibles:
    text = modules.get_bible_from_module(bible).get(books=[book], chapters=[chapter], verses=[verse]).strip()
    print("{:>12}: {}".format(bible, re.sub('<[^<]+?>', '', text)))
    verses.append(text)
