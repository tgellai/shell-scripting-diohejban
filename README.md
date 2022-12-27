# SHELL SCRIPTING DIÓHÉJBAN

## I. INTERPRETEREK

A bash scriptek összefűzött parancsokat tartalmaznak. A script fájl futtatásakor az abban lévő parancsokat egy INTERPRETER hajtja végre. Több féle INTERPRETER is létezik ezért minden script első sorában meg kell adni, hogy a rendszer melyiket használja a script futtatásakor.


*Az INTERPRETEREK az alábbi útvonalakon találhatók:*

| Path | Leírás |
|:-|:-|
| /bin/ | rootból linkelve |
| /usr/bin/ | eredeti path |

*A shell scriptek első sora mutatja meg melyik INTERPRETERT használja a rendszer a script értelmezéséhez.*

| Code | Leírás |
|:-|:-|
| #!/bin/bash | Bash script esetében |
| #!/bin/python	| Python esetében |

## II. VÁLTOZÓK

| Példa | Leírás |
|:-|:-|
| MY_SHELL | Változó deklarálása. |
| MY_SHELL="bash" | Változó inicializálása. |
| $MY_SHELL	| Változó meghívása 1. |
| ${MY_SHELL} | Változó meghívása 2. |
*Összefűzűsnél a 2. hívást kell használni!*

## III. PARANCS VÁLTOZÓBAN

| Lehetőségek: | Példa: |
| :- | :- |
| 1. opció | SERVER_NAME1=$(hostname) |
| 2. opció (régebbi) | SERVER_NAME2=\`hostname\` |

## IV. VÁLTOZÓK NÉVKONVENCIÓJA

*Valid változónevek:*

| Leírás: | Példa: |
| :- | :- |
| Nagybetűs egybeírva | FIRST3LETTERS="ABC" |
| Nagybetűs alulvonással elválasztva | FIRST_THREE_LETTERS="ABC" |
| ChamelCase / PascalCase | firstThreeLetters / FirstThreeLetters="ABC" |

*Invalid változónevek:*

|Leírás: | Példa: |
| :- | :- |
| Nem kezdődhet számmal | 3LETTERS="ABC" |
| Tilos a kötőjeles elválasztás | first-three-letters="ABC" |
| Tilos a spec. karakter | first@Three@Letters="ABC" |

## V. OPERÁTOROK

### Fájl operátorok

| Code: | Leírás: |
|:-|:-|
| `-d FILENAME` | True ha a file egy **könyvtár** (*directory*)|
| `-e FILENAME` | True ha **létezik** (*exists*) |
| `-f FILENAME` | True ha a file egy **file** (*és nem könyvtár*) |
| `-r FILENAME` | True ha **létezik** és általunk olvasható (*readable*) |
| `-s FILENAME` | True ha létezik és **nem üres** (*not empty*) |
| `-w FILENAME` | True ha létezik és általunk **írható** (*writeable*) |
| `-x FILENAME` | True ha létezik és általunk **futtatható** (*execute*) |

***
### String operátorok

| Code: | Leírás: |
|:-|:-|
|`-z STRING` | True ha a string **üres.** |
|`-n STRING` | True ha a string **nem üres.** |
|`STRING1=STRING2` | True ha a **stringek egyeznek.** |
|`STRING1!=STRING2` |	True ha a **stringek nem egyeznek.** |

***
### Aritmetikai operátorok

| Code: | Leírás: |
|:-|:-|
| `X -eq Y` | (X == Y) True ha X **egyenlő** Y -nal. |
| `X -ne Y` | (X != Y) True ha X **nem egyenlő** Y -nal. |
| `X -lt Y` | (X < Y) True ha X **kisebb**, mint Y. |
| `X -le Y` | (X <= Y) True ha X **kisebb vagy egyenlő**, mint Y. |
| `X -gt Y` | (X > Y) True ha X **nagyobb**, mint Y. |
| `X -ge Y` | (X >= Y) True ha X **nagyobb vagy egyenlő**, mint Y. |

## VI. AZ IF STATEMENT
### IF

```
if [ feltetel-igaz ]
then
	parancs 1
	parancs 2
	parancs n
fi
```

A feltételben ha változó van nem csak az értéket, hanem a változót is aposztróf ("...") közé kell tenni.


### ELSE

```
if [ feltetel-igaz ]
then
	parancs n
else
	parancs n
fi
```

### ELIF

```
if [ feltetel-igaz ]
then
	parancs n
elif [ feltetel-igaz ]
then
	parancs n
else
	parancs n
fi
```

## VII. FOR LOOP

###Ciklusban létrehozott érték

***ÁLTALÁNOS:***
```
for ITERATOR_NAME in item1 itemN
do
	parancs 1
	parancs 2
	parancs N
done
```

***PÉLDA:***

```
for SZIN in piros zold kek
do
	echo $SZIN
done
```

***A PÉLDA KIMENETE:***
```
piros
zold
kek
```
***
### Globális változóban létrehozott érték
***ÁLTALÁNOS:***
```
VAR_NAME = "item1 item2 item3"
for ITERATOR_NAME in $VAR_NAME
do
	parancs 1
	parancs 2
	parancs N
done

```
***PÉLDA:***

```
SZINEK="piros zold kek"
for SZIN in $SZINEK
do
	echo $SZIN
done

```
***A PÉLDA KIMENETE:***
```
piros
zold
kek
```

***
### Átnevező script

***ÁLTALÁNOS:***
```
ATNEVEZENDOK=$(ls *jpg)
MAI_DATUM=$(date +%F)

for ITERATOR in $ATNEVEZENDOK
do
	echo "eredeti név: ${ITERATOR} új név: ${MAI_DATUM}-${ITERATOR}"
	mv ${ITERATOR} ${MAI_DATUM}-${ITERATOR}
done

```

## VIII. "POSITIONAL PARAMETERS"

A paraméter a függvény deklarációjában szereplő változó. Pl.: $0 $1 $2

Az argumentum ennek a változónak a tényleges értéke, amelyet a függvénynek átadunk.

Minden script futtatásakor a script neve után szóközzel elválasztva paramétereket adhatunk meg.

**Példa:** `./script.sh parameter1 parameter2 parameter3`

A script belsejében ezek a paraméterek az alábbiak szerint használhatók.

| Par. # | Megívás | Példa szerint |
|:-|:-|:-|
| Par. 0. | ```$0``` | "script.sh" |
| Par. 1. | ```$1``` | "parameter1" |
| Par. 2. | ```$2``` | "parameter1" |
| Par. 3. | ```$3``` | "parameter1" |

###Példa: User archiváló script
Ha van egy elméleti user archiválást végző scriptünk, amelynél paraméterként átadhatjuk a scriptnek mely usert archiválja, akkor a script futtatásához kiadandó utasítás így nézne ki:
`./archive_user.sh elvis`

| Par. # | Megívás | Példa szerint |
|:-|:-|:-|
| Par. 0. | ```$0``` | "archive_user.sh" |
| Par. 1. | ```$1``` | "elvis" |

### Paramétert változóba

A scriptnek paraméterként átadott adatot érdemes a script belsejében változóban tárolni a könnyebb olvashatóság végett.
Az előbbi példánál maradva érdemes a user archiváló scriptnek átadott felhasználónevet egy USER változóban tárolni a következő módon: ```USER=$1``` Ha nem így teszünk, akkor a ```$1``` argumentum nem biztos, hogy egyértelmű lesz a script olvasásakor.

### "Multiple parameters"

Hogyan módosítsuk a scriptet ha több usert szeretnénk archiválni

`archive_user.sh jack joe`

Minden paraméterre a ```$@``` -al tudunk hivatkozni, tehát a scriptünk törzsét be kell illesztenünk egy for loop ciklusba, ahol a ```USER``` változó a cikusunk iterátora és a ```$@``` -on vagyis az összes paraméteren loopol végig.

```
for USER in $@
do
	korábbi script törzs
done
```

### Változó beolvasása

A scriptben ez szerepel:
```
read -p "Ez a szöveg jelenik meg mint utasítás h mit írjon be a user" VARIABLE_NAME
```

A konzolon ez lesz kiírva:
```
Ez a szöveg jelenik meg mint utasítás h mit írjon be a user
```
Ez után be tudunk írni egy szöveget, ami a ```VARIABLE_NAME``` -be lesz elmentve.
