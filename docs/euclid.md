# Le PGCD

<center>
<img src="../images/euclid.jpg" width="200">
</center>

Le calcul du PGCD (Plus grand commun diviseur) de deux nombres entiers non nul consiste à trouver le plus grand nombre entier qui divise ces deux nombres. Par exemple, le PGCD de 54 et 24 est 6. En effet, les diviseurs de 54 sont 1, 2, 3, **6**, 9, 18, 27 et 54, et les diviseurs de 24 sont 1, 2, 3, 4, **6**, 8, 12 et 24. Le plus grand nombre qui se trouve dans les deux listes est 6

La première idée qui nous vient est d'essayer avec tous les nombres entre 1 et min(x, y) et de se souvenir du plus grand de ces nombres qui divise x et y. Pour rappel, si `i` divise `x`, alors `x % i == 0`.

Voici un programme qui calcule le PGCD selon cette méthode:

``` kotlin
fun gcd(x: Int, y: Int): Int {
    var i = 1
    var max = 1
    while (i <= x && i <= y) {
        if (x % i == 0 && y % i == 0) {
            max = i
        }
        i++
    }
    return max
}

fun main(args: Array<String>) {
    println(gcd(54, 24))
}
```

Vers 300 avant notre ère, le mathématicien grec [Euclide](https://fr.wikipedia.org/wiki/Euclide) découvre une meilleure manière de calculer le PGCD: Il suffit de soustraire le plus petit des deux nombres à l'autre, et de répéter l'opération jusqu'à ce que les deux nombres sont égaux:

``` kotlin
fun gcd(x: Int, y: Int): Int {
    var a: Int = x
    var b: Int = y
    while (a != b) {
        if (a > b) {
            a -= b
        } else {
            b -= a
        }
    }
    return a
}

fun main(args: Array<String>) {
    println(gcd(54, 24))
}
```

On peut assi résoudre avec une version récursive:

```kotlin
fun gcd(x: Int, y: Int): Int {
    if (x == y) {
        return x;
    } else if (x > y) {
        return gcd(x-y, y);
    } else {
        return gcd(x, y - x);
    }
}
```

On peut rendre le programme un peu plus rapide en traitant de manière spéciale les nombres pairs:

``` kotlin
fun gcd(x: Int, y: Int): Int {
    var a: Int = x
    var b: Int = y
    var d: Int = 1

    while (a % 2 == 0 && b % 2 == 0) {
        a /= 2
        b /= 2
        d *= 2
    }
    while (a != b) {
        if (a % 2 == 0) {
            a /= 2;
        } else if (b % 2 == 0) {
            b /= 2;
        } else if (a > b) {
            a = (a - b) / 2
        } else {
            b = (b - a) / 2
        }
    }
    return a*d
}
```

Plus tard, Euclide trouva une manière encore plus efficace pour calculer le PGCD. Au lieu de soustraire le plus petit du plus grand, ce nouvel algorithme utilise le modulo:

``` kotlin
fun gcd(x: Int, y: Int): Int {
    var a: Int = x
    var b: Int = y
    while (b != 0) {
        val t: Int = a
        a = b
        b = t % b
    }
    return a
}
```
!!! note "Exercice"
    Ecrivez une version récursive du programme précédent

    ??? success "Solution"

        ``` kotlin
        fun gcd(x: Int, y: Int): Int {
            if (y == 0) {
                return x
            } else {
                return gcd(y, x % y)
            }
        }
        ```
!!! note "Exercice"
    Comment testez-vous ce programme (quelles sont les valeurs de x et de y que vous utilisez pour démontrer que votre programme fonctionne) ? Que se passe-t-il si une des valeurs est négative ou même zéro ?