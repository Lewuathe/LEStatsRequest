# -*- coding: utf-8 -*-

import os
import sys

if __name__ == "__main__":
    # your code
    for i in range(1,16):
        if i < 10:
            num = "0" + str(i)
        else:
            num = str(i)
#        print "static NSString *const ATTRIB_CAT" + num + "        = @\"cat" + num + "\";" 
        print "\t_currentValue.cat" + num + " = GET_ATTRIB(ATTRIB_CAT" + num + ");"
