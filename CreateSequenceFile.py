#! /usr/bin/python

# CreateSequenceFile.py: Version 1

import sys

def Usage():
	print "CreateSequenceFile FilePrefix StartFileNum FileNum FileEndfix"
	exit(1)

def CreateSequenceFile(FilePrefix, StartFileNum, FileNum, FileEndfix):
	for i in range(StartFileNum, StartFileNum + FileNum):
		realfilename = FilePrefix + str(i) + "." + FileEndfix
		filehandle = open(realfilename, "w+")
		filehandle.close()

def main():
	if len(sys.argv) != 4 :
		Usage()

	filename = sys.argv[1]
	startfilenum = int(sys.argv[2])
	filenum = int(sys.argv[3])
	if len(sys.argv) == 5 :
		fileendfix = sys.argv[4]

	CreateSequenceFile(filename, startfilenum, filenum, fileendfix)

if __name__ == "__main__":
	main()
