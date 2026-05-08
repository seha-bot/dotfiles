#!/usr/bin/env python
import re
import os

paclist = []

re_name = re.compile(r'Name\s*:\s*(\S+)')
re_size = re.compile(r'Installed Size\s*:\s*(.*)')

with os.popen("pacman -Qi","r") as p:
    for line in p.readlines():
        match_name = re_name.match(line)
        match_size = re_size.match(line)
        if match_name :
                package_name = match_name.groups(1)[0]
        if match_size :
                package_size = match_size.groups(1)[0]
                paclist.append((int(round(float(package_size.split(' ')[0]))), package_size, package_name))

paclist.sort()
for pac in paclist:
    print(f"{pac[1]} {pac[2]}")
