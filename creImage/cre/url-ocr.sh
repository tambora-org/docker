#!/bin/bash

#http://fz.ub.uni-freiburg.de/show/pics/18ff/1863/06/frz.1863-06-03.02.jpg


wget http://fz.ub.uni-freiburg.de/show/pics/18ff/1863/06/frz.1863-06-03.02.jpg


tesseract --help-extra
tesseract --list-langs
tesseract ./frz.1863-06-03.02.jpg ./tess.info --psm 0
tesseract ./frz.1863-06-03.02.jpg ./tess.hocr -l Fraktur --psm 1 hocr


tesseract ./frz.1863-06-03.02.jpg ./tess.deu.txt -l deu --psm 1
tesseract ./frz.1863-06-03.02.jpg ./tess.latin.txt -l Latin --psm 1
#best:
tesseract ./frz.1863-06-03.02.jpg ./tess.frak.txt -l Fraktur --psm 1








