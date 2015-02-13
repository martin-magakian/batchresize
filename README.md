# batchresize


The problem
===========
I used to resize manually in photoshop: it was far too long
Then I used imagemagic from the command: still to long. It only use a single core of my machine
So I creating this small multi-threaded bash script

One a 8 core machine it will get 8 times faster than imagemagic.
![Multithread batch resize](https://raw.github.com/martin-magakian/batchresize/master/README_src/multithread.png)

Warning
===========
This script replace the original picture.
Copy your picture before resizing them or you will lose quality.
An alert is display before processing:
![Warning](https://raw.github.com/martin-magakian/batchresize/master/README_src/warning.png)


How to use
===========

- Resize current directory to retina display (2880x1800)

    $ batchresize.sh retina

- Resize current directory *recursively* to nonretina display (1440x900)

    $ batchresize.sh -R nonretina

- Resize current directory to mini size, very lightweight (800x600)

    $ batchresize.sh mini


Need image magic
===========
on debian/ubuntu:
$ apt-get install imagemagic

on mac os x with brew:
$ brew install imagemagic


Licence
===========
MIT License (MIT)
