# Des oeuvres d'art

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
    val size = 10
    for (y in 1..size) {
        for (x in 0 until size) {
            print("*")
        }
        println()
    }
}
```

``` kotlin
fun main(args: Array<String>) {
    val size = 10
    for (y in 0 until size) {
        for (x in 0 until size) {
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
    val size = 7
    for (y in 1..size) {
        for (x in 1..y) {
            print("*")
        }
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

``` kotlin
fun main(args: Array<String>) {
    val numberOfTooth = 3
    val size = 5
    for (n in 1..numberOfTooth) {
        for (y in 1..size) {
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

``` kotlin
fun printLine(size: Int, len: Int) {
    for (x in 1..size-len) {
        print(" ")
    }
    for (x in 1 until 2*len) {
        print("*")
    }
    println()
}

fun main(args: Array<String>) {
    val size = 5
    for (y in 1..size) {
        printLine(size, y)
    }
    for (y in size-1 downTo 1) {
        printLine(size, y)
    }
}
```


## Le sapin de Noêl

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
````

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
````

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
