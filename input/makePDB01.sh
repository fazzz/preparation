#!/bin/sh

if [ ! -d PDB01 ]; then
    mkdir PDB01
fi

cd PDB01

wget http://files.rcsb.org/download/150l.pdb.gz

gunzip 150l.pdb.gz

wget http://files.rcsb.org/download/2lzm.pdb.gz

gunzip 2lzm.pdb.gz

awk '$1 ~ /ATOM/ && $5 == "A" { print $0} ' 150l.pdb > t4l_open_org.pdb

awk '$1 ~ /ATOM/ && $5 == "A" { print $0} ' 2lzm.pdb > t4l_close_org.pdb

#>150l:A
#MNIFEILRIDEGLRLKIYKDTEGYYTIGIGHLLTKSPSLNAAKSELDKAIGRNCNGVITKDEAEKLFNQDVDAAVRGILRNAKLKPVYDSLDAVRRCALINMVFQMGETGVAGFTNSLRMLQQKRWDEAAVNLAKSRWYNQTPNRAKRVITTFRTGTWDAYKNL

#>2lzm:A
#MNIFEMLRIDEGLRLKIYKDTEGYYTIGIGHLLTKSPSLNAAKSELDKAIGRNCNGVITKDEAEKLFNQDVDAAVRGILRNAKLKPVYDSLDAVRRCALINMVFQMGETGVAGFTNSLRMLQQKRWDEAAVNLAKSRWYNQTPNRAKRVITTFRTGTWDAYKNL

cat <<EOF > seq_2lzm_to_150l.txt
mnifeIlrideglrlkiykdtegyytigighlltkspslnaakseldkaigrncngvitkdeaeklfnqdvdaavrgilrnaklkpvydsldavrrcalinmvfqmgetgvagftnslrmlqqkrwdeaavnlaksrwynqtpnrakrvittfrtgtwdayknl
EOF

/usr/local/bin/scwrl4/Scwrl4 -s seq_2lzm_to_150l.txt -i t4l_close_org.pdb -o t4l_close.pdb

cat <<EOF > seq.txt
mnifeilrideglrlkiykdtegyytigighlltkspslnaakseldkaigrncngvitkdeaeklfnqdvdaavrgilrnaklkpvydsldavrrcalinmvfqmgetgvagftnslrmlqqkrwdeaavnlaksRwynqtpnrakrvittfrtgtwdayknl
EOF

/usr/local/bin/scwrl4/Scwrl4 -s seq.txt -i t4l_open_org.pdb -o t4l_open.pdb

