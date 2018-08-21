# Les nombres à l'envers

<center>
    <img src="../images/reverse.jpg" width="400">
</center>

!!! quote "Citation"
    Pour voir le monde à l'endroit, il faut le regarder à l'envers.

!!! summary "Objectifs pédagogiques"

    * La démarche algorithmique.
    * Les opérateurs arithmétiques.
    * La dénomination de variables de type "long".
    * Les boucles.

Le problème consiste ici à «retourner» un nombre. Par exemple 42 deviendra 24, 512 deviendra 215, 1234 deviendra 4321 et 7 restera 7.

Réfléchissez comment résoudre ce problème, esquissez un algorithme sur papier, puis codez votre solution en Kotlin.

Indiquez aussi comment vous allez tester votre programme pour vous assurez qu'il fonctionne avec toutes les valeurs.

??? success "Solution"

    ``` kotlin
    fun reverse (x: Long): Long {
        var t: Long = x
        var r: Long = 0
        while (t != 0L) {
            r = r * 10L + t % 10L
            t = t / 10L
        }
        return r
    }

    fun main(args: Array<String>) {
        println(reverse(512))
        println(reverse(100))
        println(reverse(0))
    }
    ```

    ```
    215
    1
    0
    ```

!!! note "Exercice"

    Que devrait donner `reverse (-42)` ? Est-ce bien le cas ? Pourquoi ?

    Expliquez comment fonctionne l'opérateur `%` avec les nombres négatifs. Notez que ce comportement peut varier d'un langage de programmation à un autre.

    Testez avec ce petit programme:

    ``` kotlin
    for (i: Int in -5 .. 5) {
        println("$i % 3 = ${i % 3}")
        println("$i % -3 = ${i % -3}")
    }
    ```

    Lisez plus sur la problématique de l'opérateur `%` sur [wikipedia](https://en.wikipedia.org/wiki/Modulo_operation).
