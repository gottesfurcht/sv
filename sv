#!/usr/bin/env python3

from os.path import dirname, join, realpath
import re
import configparser
from pysword.modules import SwordModules
from argparse import ArgumentParser

parser = ArgumentParser()
parser.add_argument('book', nargs=1)
parser.add_argument('chapter', nargs=1, type=int)
parser.add_argument('verse', nargs=1, type=int)
parser.add_argument('bibles', nargs='*')
args = parser.parse_args()

bibles = args.bibles
book = args.book[0]
chapter = args.chapter[0]
verse = args.verse[0]
modules = SwordModules()
found_modules = modules.parse_modules()

# only use the ini if no bibles on the cli
if not bibles:
    config = configparser.ConfigParser()
    config_path = join(dirname(realpath(__file__)), 'sv.ini')
    config.read(config_path)
    bibles = config['default']['bibles'].split()

longest_bible_name = max(bibles, key=len)

for bible in bibles:
    text = modules.get_bible_from_module(bible).get(books=[book], chapters=[chapter], verses=[verse]).strip()
    stripped_text = re.sub('<[^<]+?>', '', text)
    if len(bibles) == 1:
        print(stripped_text)
    else:
        format_string = '{:>' + str(len(longest_bible_name)) + '}: {}'
        print(format_string.format(bible, stripped_text))
