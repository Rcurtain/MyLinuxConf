#! /usr/bin/python

# CreateSequenceFile.py: Version 1

import sys

def Usage():
	print "CreateSequenceFile FilePrefix StartFileNum FileNum"
	exit(1)

def Run():
	if len(sys.argv) != 4 :
		Usage()
	filename = sys.argv[1];
	startfilenum = int(sys.argv[2])
	filenum = int(sys.argv[3])

	for i in range(startfilenum, startfilenum + filenum):
		realfilename = filename + str(i)
		filehandle = open(realfilename, "w+")
		filehandle.close()
	
if __name__ == "__main__":
	Run()
