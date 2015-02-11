#! /bin/sh

# CreateNameTags.sh: Version 1
# generate tag file for lookupfile plugin
echo -e "!_TAG_FILE_SORTED\t2\t/2=foldcase/" > name.tags
find `pwd` -type f \( -name "*.[ch]"  -o -name "*.[ch]pp" \) -printf "%f\t%p\t1\n"|sort -f >>name.tags
