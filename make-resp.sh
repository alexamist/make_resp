#!/bin/bash

#whats necessary? out from gaussian

#usage ./make-resp.sh  gout (s/ _esp.out)  ndx

#variables
gout="$1"
ndx="$2"

enter="If this step is ok, press [Enter] key to continue..."
end="If it's all ok, press [Enter] to finish. Good Job!"

#Colors
RED='\033[0;31m'
NC='\033[0m'
BLUE='\033[0;34m'
GREEN='\033[0;32m'
MAG='\033[0;95m'

#pause
function pause(){
   read -p "$*"
}


###

#antechamber-----------------------------------------------------------------
echo -e "${RED}ANTECHAMBER${NC}"

antechamber -i ${gout}_esp.out -fi gout -o ${gout}.mol2 -fo mol2 -c resp -eq 2 -s 2 -pf y -rn ${ndx}

pause $(echo -e ${BLUE}$enter${NC})

rm esout
rm punch
rm qout
rm QOUT

parmchk -i ${gout}.mol2 -f mol2 -o ${gout}.frcmod

antechamber -i ${gout}.mol2 -fi mol2 -o ${gout}.pdb -fo pdb -rn ${ndx}

#sed -i '/CONECT/d' ${gout}.pdb

pause $(echo -e ${GREEN}$end${NC})
