# Des œuvres d'art

!!! summary "Objectifs didactiques"
    * Gérer plusieures boucles imbriqués
    * Structuration du code

Dans la programmation d'algorithmes, souvent il est nécessaire d'utiliser plusieurs boucles imbriquées.
Une façon classique d'exercer cela est d'essayer de produire des petits "œuvres d'art".

## Le carré

```
**********
**********
**********
**********
**********
**********
**********
**********
**********
**********
```

``` kotlin
fun main(args: Array<String>) {
    val sizeSquare = 10
    for (y in 1..sizeSquare) {
        for (x in 1..sizeSquare) {
            print("*")
        }
        println()
    }
}
```

Voici une alternative pour la formulation des boucles de type ```for``` :

``` kotlin
fun main(args: Array<String>) {
    val sizeSquare = 10
    for (y in 0 until sizeSquare) { // itération de 0 à size-1 !
        for (x in 0 until sizeSquare) {
            print("*")
        }
        println()
    }
}
```

## Le triangle

```
*
**
***
****
*****
******
*******
```

``` kotlin
fun main(args: Array<String>) {
    val sizeTriangle = 7
    for (y in 1..sizeTriangle) {
        for (x in 1..y) {
            print("*")
        }
        println()
    }
}
```

Variante en structurant le code avec une fonction supplémentaire:

??? success "Code"

    ``` kotlin
    fun printCharNTimes(c:Char, n:Int) {
        for (x in 1..n) {
            print(c)
        }
    }

    fun main(args: Array<String>) {
        val sizeTriangle = 7
        for (n in 1..sizeTriangle) {
            printCharNTimes('*', n)
            println()
        }
    }
    ```

## Les dents de scie

```
*
**
***
****
*****
*
**
***
****
*****
*
**
***
****
*****
```

??? success "Code"

    ``` kotlin
    fun main(args: Array<String>) {
        val numberOfTooths = 3
        val sizeTooth = 5
        for (n in 1..numberOfTooths) {
            for (y in 1..sizeTooth) {
                for (x in 1..y) {
                    print("*")
                }
                println()
            }
        }
    }
    ```

## Le diamant

```
     *
    ***
   *****
  *******
 *********
***********
 *********
  *******
   *****
    ***
     *
```

??? success "Code"

    ``` kotlin
    fun main(args: Array<String>) {
        val size = 5
        for (y in 1..size) {
            for (x in 1..size-y) {
                print(" ")
            }
            for (x in 1 until 2*y) {
                print("*")
            }
            println()
        }
        for (y in size-1 downTo 1) {
            for (x in 1..size-y) {
                print(" ")
            }
            for (x in 1 until 2*y) {
                print("*")
            }
            println()
        }
    }
    ```

??? success "Code (structuré avec fonctions supplémentaires)"

    ``` kotlin
    fun printDiamondLine(nbrSpaces: Int, nbrStars: Int) {
        printCharNTimes(' ', nbrSpaces)
        printCharNTimes('*', nbrStars)
        println()
    }

    fun main(args: Array<String>) {
        val sizeDiamond = 6
        for (n in 1..sizeDiamond) {
            printDiamondLine(sizeDiamond-y, (2*n)-1)
        }
        for (n in sizeDiamond-1 downTo 1) {
            printDiamondLine(sizeDiamond-y, (2*n)-1)
        }
    }
    ```

## Le sapin de Noël

```
    *
   ***
    *
   ***
  *****
    *
   ***
  *****
 *******
    *
   ***
  *****
 *******
*********
```

??? success "Code"

    ``` kotlin
    fun main(args: Array<String>) {
        val size = 4
        for (n in 1..size) {
            for (y in 1..n+1) {
                for (x in 1..size+1-y) {
                    print(" ")
                }
                for (x in 1 until y*2) {
                    print("*")
                }
                println()
            }
        }
    }
    ```

```
     *
    ***
   *****
    ***
   *****
  *******
   *****
  *******
 *********
  *******
 *********
***********
```

??? success "Code"

    ``` kotlin
    fun main(args: Array<String>) {
        val size = 3
        for (n in 2..size+2) {
            for (y in n-2..n) {
                for (x in 1..size+2-y) {
                    print(" ")
                }
                for (x in 0..y*2) {
                    print("*")
                }
                println()
            }
        }
    }
    ```

## Le damier

```
|||---|||---|||
|||---|||---|||
|||---|||---|||
---|||---|||---
---|||---|||---
---|||---|||---
|||---|||---|||
|||---|||---|||
|||---|||---|||
---|||---|||---
---|||---|||---
---|||---|||---
|||---|||---|||
|||---|||---|||
|||---|||---|||
```

??? success "Code"

    ``` kotlin
    fun main(args: Array<String>) {
        val size = 5
        val square = 3
        for (y in 1..size) {
            for (i in 1..square) {
                for (x in 1..size) {
                    if ((x + y) % 2 == 0) {
                        for (j in 1..square) {
                            print("|")
                        }
                    } else {
                        for (j in 1..square) {
                            print("-")
                        }
                    }
                }
                println()
            }
        }
    }
    ```

```
@@@...@@@...@@@
@@@...@@@...@@@
@@@...@@@...@@@
...@@@...@@@...
...@@@...@@@...
...@@@...@@@...
@@@...@@@...@@@
@@@...@@@...@@@
@@@...@@@...@@@
...@@@...@@@...
...@@@...@@@...
...@@@...@@@...
@@@...@@@...@@@
@@@...@@@...@@@
@@@...@@@...@@@
```

```
///\\\///\\\///
///\\\///\\\///
///\\\///\\\///
\\\///\\\///\\\
\\\///\\\///\\\
\\\///\\\///\\\
///\\\///\\\///
///\\\///\\\///
///\\\///\\\///
\\\///\\\///\\\
\\\///\\\///\\\
\\\///\\\///\\\
///\\\///\\\///
///\\\///\\\///
///\\\///\\\///
```
