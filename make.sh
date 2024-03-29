# Creates a DSK directly from the BASIC source code
 
#!/bin/bash
IDSK=$CPCT_PATH/tools/iDSK-0.13/bin/iDSK
SOURCE=An_Adventure.bas
TARGET=Ancient_Adventure

# Create DSK
$IDSK ${TARGET}.dsk -n

# Remove comments
grep -v "^1 '" $SOURCE > ${TARGET}.bas

# CONVERT TO MSDOS
unix2dos ${TARGET}.bas

# ADD TO DSK
$IDSK ${TARGET}.dsk -i ${TARGET}.bas -t 0
