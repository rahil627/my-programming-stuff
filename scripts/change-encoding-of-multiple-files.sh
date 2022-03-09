
# convert encoding of multiple files in the current directory
# #!/bin/bash

FROM_ENCODING="value_here" # set this
TO_ENCODING="UTF-8//TRANSLIT" # UTF-8 is the standard encoding, //TRANSLIT tries to transliterate to a similar character, otherwise can remove it

CONVERT=" iconv  -f   $FROM_ENCODING  -t   $TO_ENCODING"

for  file  in  *.txt; do
     $CONVERT   "$file"   -o  "${file%.txt}-utf8" # safer than overwriting
done
exit 0
