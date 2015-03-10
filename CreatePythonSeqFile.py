#! /usr/bin/python

# CreatePythonSeqFile.py: Version 1

import sys
import os
from CreateSequenceFile import CreateSequenceFile

def Usage():
	print "CreatePythonSeqFile FilePrefix StartFileNum FileNum"
	exit(1)

def AddPythonTag(FilePrefix, StartFileNum, FileNum, FileEndfix):
	for i in range(StartFileNum, StartFileNum + FileNum):
		realfilename = FilePrefix + str(i) + "." + FileEndfix
		filehandle = open(realfilename, "w+")
		filehandle.write("#! /usr/bin/python\n\n")
		filehandle.write("# ")
		filehandle.write(realfilename)
		filehandle.write(": Version 1\n")
		filehandle.write("")
		filehandle.close()
		os.system("chmod +x " + realfilename)

def main():
	if len(sys.argv) != 4 :
		Usage()
	
	filename = sys.argv[1]
	startfilenum = int(sys.argv[2])
	filenum = int(sys.argv[3])
	CreateSequenceFile(filename, startfilenum, filenum, 'py')
	AddPythonTag(filename, startfilenum, filenum, 'py')

if __name__ == '__main__':
    main()
