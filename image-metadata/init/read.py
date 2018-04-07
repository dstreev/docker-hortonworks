#!/usr/bin/env python

import sys
one_image=""
#file_num=0
from subprocess import Popen, PIPE
for line in sys.stdin:
    if line.strip() != "BBBBBB":
      one_image=one_image+line
    else:
      #print "=================="
      #print "Done with file num %d" % file_num
      #print "=================="
      #file = open ("/tmp/%d.txt" % file_num , "w")
      #file.close()
      #file_num=file_num+1
      p1 = Popen(["/usr/bin/exiftool", "-"], stdout=PIPE, stdin=PIPE)
      #p1.communicate(one_image)
      stdout=p1.communicate(one_image)
      print stdout
      