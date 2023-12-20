#!/usr/bin/awk -f

BEGIN{
    FIELDWIDTHS = "6 5 1 4 1 3 1 1 4 1 3 8 8 8 6 6 6 4"
    id_old=0
    
    AA["CYS"] = "C"; AA["ASP"] = "D"; AA["SER"] = "S"; AA["GLN"] = "Q";
    AA["LYS"] = "K"; AA["ILE"] = "I"; AA["PRO"] = "P"; AA["THR"] = "T";
    AA["PHE"] = "F"; AA["ASN"] = "N"; AA["GLY"] = "G"; AA["HIS"] = "H";
    AA["LEU"] = "L"; AA["ARG"] = "R"; AA["TRP"] = "W"; AA["ALA"] = "A";
    AA["VAL"] = "V"; AA["GLU"] = "E"; AA["TYR"] = "Y"; AA["MET"] = "M";
}

$1~/ATOM/{
    id=$6

    if (id != id_old) {
	printf("%1s",AA[$4])
	id_old = id
    }
}

END{
    print("\n")
}
