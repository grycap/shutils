#!/usr/bin/env python
import os
from distutils.core import setup

ldesc = ""
f = open("README","rt")
ldesc = f.read()
f.close()

setup(name='shutils',
      version="0.1",
      description='Common SHell Utils', 
      author='Carlos de Alfonso',
      author_email='caralla@upv.es',
      url='http://www.grycap.upv.es/clues',
      data_files = [
        ('/etc/runall/', [
            'etc/runall/hosts',
            ] ),
        ('/etc/sshblock/', [
            'etc/sshblock/blacklist',
            'etc/sshblock/whitelist',
            ] ),
        ],
      scripts = [ 'runall', 'scpall', 'lockdir', 'sshblock', 'cacheoutput' ],
      long_description=ldesc,
      license = "MIT",
)
