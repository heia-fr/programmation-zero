# Les types de données.

Le dictionnaire Larousse définit ainsi l'informatique:

!!! quote "Informatique:"
    Science du traitement automatique et rationnel de l'information considérée comme le support des connaissances et des communications.

Mais de quel _type_ est cet _information_ ? Les ordinateurs actuels travaillent avec des tensions électriques pour représenter
l'information et la plus petite unité d'information qu'un ordinateur peut traiter est un **bit** (**b**inary dig**it**). Un bit
ne peut avoir que deux valeurs : zéro ou un. Le zéro est souvent représenté par une tension de 0 volt et le 1 par une tension entre
1 et 5 volt selon le type d'ordinateur.

Si on compare avec les nombres que nous -- les humains -- utilisons, le bit correspondrait à notre _chiffre_ (de zéro à 9).
Nous pouvons représenter des _nombres_ plus grand que 9 simplement en utilisant plusieurs _chiffres_. Pour l'ordinateur c'est
la même chose et il peut représenter plus de choses en combinant plusieurs bits.

Avec 2 bits, on peut représenter 4 "choses" différentes : `00`, `01`, `10` et `11`. Avec 4 bits, pn peut représenter 16 choses
différentes. De manière générale, avec $n$ bits, on peut représenter $2^n$ choses différentes.

En informatique, nous utiliserons facilement des groupes de 8 bits (appelés _byte_ ou _octet_) qui peuvent représenter 256 valeurs différentes,
des groupes de 16 bits, de 32 bits ou de 64 bits. On peut parfois même aller à 128 bits, mais avec 64 bits on peut
représenter 18'446'744'073'709'551'616 valeurs différentes et ce n'est déjà pas mal... (Note : avec 128 bits, on peut représenter 340'282'366'920'938'463'463'374'607'431'768'211'456 valeurs différentes)

Les _bytes_ sont utilisés pour représenter les caractères simples (le lettres de l'alphabet) ou les petits nombres entre 0 et 255.
On peut aussi les utiliser pour des nombres signés et on peut alors représenter les nombres entre -128 et 127.
Les ordinateurs modernes travaillent naurellement avec des nombres de 64 bits et on n'utilisera des nombres sur 8, 16 ou 32 bits
uniquement pour économiser de la mémoire.




Byte	8	-128	127
Short	16	-32768	32767
Int	32	-2,147,483,648 (-231)	2,147,483,647 (231 - 1)
Long	64	-9,223,372,036,854,775,808 (-263)	9,223,372,036,854,775,807 (263 - 1)

Type	Size (bits)	Significant bits	Exponent bits	Decimal digits
Float	32	24	8	6-7
Double	64	53	11	15-16

Characters (16-bit Unicode)

Booleans

Arrays

Strings

Classes