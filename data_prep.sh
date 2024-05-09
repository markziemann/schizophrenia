#!/bin/bash

# This script fetches the data

# get gdown
GDOWN=$(which gdown | wc -l)
if [ $GDOWN == 0 ] ; then
  echo command 'gdown' not found. Install it with 'pip install gdown'
fi

gdown --folder https://drive.google.com/drive/folders/1BZxWKZEUOeIcgTZ71r29zxX7wnEfpkQZ

for GZF in $(find ASRB_EWAS | grep .gz$) ; do
  NEWNAME=$(echo $GZF | sed 's/.txt.gz/.fmt.txt/')
  zcat $GZF | cut -f-2 > $NEWNAME
done
