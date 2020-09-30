#!/usr/bin/python3
import sys
import os
if __name__=="__main__":
	inputOp=sys.argv
	print(inputOp)
	if 'debug' in inputOp:
		option='debug'
	elif 'fast' in inputOp :
		option='fast'
	else :
		option='opt'
	command = 'scons build/X86_MESI_Two_Level/gem5.'+option+' -j 20'
	print(command)
	os.system(command)

