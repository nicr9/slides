from jinja2 import Template
from os import getcwd
from os.path import join as path_join
from sys import argv
from yaml import load

with open(path_join(getcwd(), "./scripts/assets/homepage.html"), 'r') as inp, open(argv[1], 'r') as data:
    t = Template(inp.read())
    payload = load(data)
    print(t.render(**payload))

