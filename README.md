# batchresize


The problem
---
Resize manually in photoshop: it was far too long<br />
Resize with imagemagic: still to long. It only use a single core of my machine

So I created this script who will run is 8 times faster on a 8 core CPU

Warning
---
This script replace the original picture. An alert is display before processing:<br />
![Warning](https://raw.github.com/martin-magakian/batchresize/master/README_src/warning.png)

How to use
---

- Resize current directory to retina display (2880x1800)

    $ batchresize.sh retina

- Resize current directory *recursively* to nonretina display (1440x900)

    $ batchresize.sh -R nonretina

- Resize current directory to mini size, very lightweight (800x600)

    $ batchresize.sh mini


Dependency
---
- Need image magic

on debian/ubuntu:<br />
$ apt-get install imagemagic

on mac os x with brew:<br />
$ brew install imagemagic


Licence
===========
MIT License (MIT)
