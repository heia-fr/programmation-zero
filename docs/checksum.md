---
title: Les sommes de contrôle  
---

!!! summary "Objectifs pédagogiques"
    * Expliquer l'utilité des sommes de contrôle.
    * Effectuer des conversions de type.
    * Concevoir et réaliser un programme selon spécification.

Les sommes de contrôles sont utilisés couramment pour vérifier qu'une suite de chiffres est correcte. On l'utilise pour vérifier les numéros des cartes de crédit, les numéros de référence des bulletins de versements, ou dans des protocoles de communication.

Il existe plusieurs type de somme de contrôle et nous commençons avec une simple somme modulo 10 de tous les chiffres d'un nombre :

``` kotlin
fun checksum(x: Long): Int {
    var t: Long = x
    var result: Int = 0
    while (t != 0L) {
        result = (result + (t % 10).toInt()) % 10
        t = t / 10L
    }
    return result
}

fun main(args: Array<String>) {
    println (checksum(999))
    println (checksum(512))
    println (checksum(651288))
}
```

```
7
8
0
```

version recursive

``` kotlin
fun checksum(x: Long): Int {
    if (x == 0L) {
        return 0;
    }
    return ((x % 10).toInt() + checksum(x / 10L)) % 10
}
```

Ajouter un chiffre pour que le checksum soit 0.

``` kotlin
fun zerosum(x: Long): Long {
    return x * 10L + (10 - checksum(x)) % 10
}
```

```
9993
5122
6512880
```

!!! note "Note"
    A la place de `(10 - checksum(x)) % 10` on aurait aussi pu écrire `(9 * checksum(x)) % 10`.
    Vérifiez avec quelques valeurs de `x`.



!!! note "Exercice"
    Modifiez votre programme pour calculer la somme de contrôle selon
    la [formule de Luhn](https://en.wikipedia.org/wiki/Luhn_algorithm)

    ??? success "Solution"
        ``` kotlin
        fun luhn(x: Long): Int {
            var t: Long = x
            var result: Int = 0
            var factor: Int = 2

            while (t != 0L) {
                var d: Int = (t % 10).toInt() * factor
                if (d > 9) d -= 9
                result = (result + d) % 10
                t /= 10L
                factor = 3 - factor
            }
            return result
        }
        ```

        ou en récursif:

        ``` kotlin
        fun luhnRec(x: Long, factor: Int): Int {
            if (x == 0L) {
                return 0;
            }
            var d: Int = (x % 10).toInt() * factor
            if (d > 9) d -= 9
            return (d + luhnRec(x / 10L, 3 - factor)) % 10
        }
        ```

        et on appelle la fonction avec 2 comme deuxième argument:

        ``` kotlin
        println(luhnRec(7992739871L, 2))
        ```
