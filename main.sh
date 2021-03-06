#!/bin/bash

PRG=$(basename $0)

function Usage {
    echo -e "Usage: \t$PRG [Option]";
    echo -e "\t-h | --help\tDisplay this message"
    echo -e "\t-f | --file\tfile input"
}

function map {
    case $flip in
	'c') utf="अ"; continue;;
	'f') utf="ा"; continue;;
	'O') utf="इ"; continue;;
	'l') utf="ि"; continue;;
#	'') utf="ई"; continue;;
	'L') utf="ी"; continue;;	
	'p') utf="उ"; continue;;
	"'") utf="ु"; continue;;
#	'') utf="ऊ"; continue;;
	'"') utf="ू"; continue;;
#	'ag') utf="ऋ"; continue;;
	'P') utf="ए"; continue;;
	']') utf="े"; continue;;
#	'i') utf="ऐ"; continue;;
	'}') utf="ै"; continue;;
#	'') utf="ओ"; continue;;
#	'') utf="औ"; continue;;
	's') utf="क"; continue;;
	'S') utf="क्"; continue;;
	'v') utf="ख"; continue;;
	'V') utf="ख्"; continue;;
	'u') utf="ग"; continue;;
	'U') utf="ग्"; continue;;
	'3') utf="घ"; continue;;
	'ª') utf="ङ"; continue;;
	'r') utf="च"; continue;;
	'R') utf="च्"; continue;;
	'5') utf="छ"; continue;;
#	'r') utf="छ्"; continue;;
	'h') utf="ज"; continue;;
	'H') utf="ज्"; continue;;
	'`') utf="ञ"; continue;;
	'~') utf="ञ्"; continue;;
	'6') utf="ट"; continue;;
	'7') utf="ठ"; continue;;
	'8') utf="ड"; continue;;
	'9') utf="ढ"; continue;;
	'0') utf="ण्"; continue;;
	't') utf="त"; continue;;
	'T') utf="त्"; continue;;
	'y') utf="थ"; continue;;
	'Y') utf="थ्"; continue;;
	'b') utf="द"; continue;;
	'w') utf="ध"; continue;;
	'W') utf="ध्"; continue;;
	'g') utf="न"; continue;;
	'G') utf="न्"; continue;;
	'k') utf="प"; continue;;
	'K') utf="प्"; continue;;
#	'>') utf="फ"; continue;;
	'a') utf="ब"; continue;;
	'A') utf="ब्"; continue;;
	'e') utf="भ"; continue;;
	'E') utf="भ्"; continue;;
	'd') utf="म"; continue;;
	'D') utf="म्"; continue;;
	'o') utf="य"; continue;;

	'/') utf="र"; continue;;
	'{') utf="र्"; continue;;
	'|') utf="्र"; continue;;
	'?'|'¿') utf="रु"; continue;;
	

	'n') utf="ल"; continue;;
	'N') utf="ल्"; continue;;
	'j') utf="व"; continue;;
	'J') utf="व्"; continue;;
	'z') utf="श"; continue;;
	'Z') utf="श्"; continue;;
#	'>') utf="ष"; continue;;
	'i') utf="ष्"; continue;;
	';') utf="स"; continue;;
	':') utf="स्"; continue;;
	'x') utf="ह"; continue;;
	'X') utf="ह्"; continue;;

	'1') utf="ज्ञ"; continue;;	
	'q') utf="त्र"; continue;;
	'I') utf="क्ष्"; continue;;
	'§') utf="ट्ट"; continue;;
	'Ý') utf="ट्ठ"; continue;;

	'!') utf="१"; continue;;
	'@') utf="२"; continue;;
	'#') utf="३"; continue;;
	'$') utf="४"; continue;;
	'%') utf="५"; continue;;
	'^') utf="६"; continue;;
	'&') utf="७"; continue;;
	'*') utf="८"; continue;;
	'(') utf="९"; continue;;
	')') utf="०"; continue;;


	'\') utf="्"; continue;;
	'÷') utf="/"; continue;;

	'Ù') utf=";"; continue;;
	'.') utf="।"; continue;;
	
	'±') utf="+"; continue;;
	'=') utf="."; continue;;
	'+') utf="ं"; continue;;	
	'F'|'') utf="ँ"; continue;;
	'®') utf="र"; continue;;
	''|'Ú') utf="'"; continue;;
	''|'') utf="-"; continue;;
	*) utf=$flip;;
    esac	
}

# checking arguments
if [ $# -eq 0 ]; then
    Usage;
    exit 1;
fi

if [ $1 == '-f' ]; then
    text=$(cat $2);
else
    text="$@" # $@ can't be used for counting
fi

IFS="" #don't ignore spaces
len=${#text}
for ((i=0; i < len; i++)); do    
    flip=${text:$i:1}
    out=$out$utf
    map
done

echo $out | sed -f rules.pattern
