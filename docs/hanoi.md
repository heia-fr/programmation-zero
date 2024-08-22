---
title: Les tours de Hanoï
---

<center>
<img src="../images/Tower_of_Hanoi_4.gif" width="400">
</center>  

[tour de Hanoï](https://fr.wikipedia.org/wiki/Tours_de_Hano%C3%AF)

``` kotlin
fun moveDisc(from: Char, to: Char) {
    println ("Move disc from $from to $to")
}

fun moveTower(from: Char, to: Char, using: Char, height: Int) {
    if (height > 0) {
        moveTower(from, using, to, height - 1)
        moveDisc(from, to)
        moveTower(using, to, from, height - 1)
    }
}

fun main(args: Array<String>) {
	moveTower('A', 'C', 'B', 4)
}
```

```
Move disc from A to B
Move disc from A to C
Move disc from B to C
Move disc from A to B
Move disc from C to A
Move disc from C to B
Move disc from A to B
Move disc from A to C
Move disc from B to C
Move disc from B to A
Move disc from C to A
Move disc from B to C
Move disc from A to B
Move disc from A to C
Move disc from B to C
```
