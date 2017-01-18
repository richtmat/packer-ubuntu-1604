#! /bin/bash
dpkg-scanpackages debs /dev/null | gzip > Packages.gz
