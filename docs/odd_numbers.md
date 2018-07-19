# Les nombres impairs

!!! quote "Paul Verlaine (Art poétique)"
    De la musique avant toute chose,  
    Et pour cela préfère l'Impair  
    Plus vague et plus soluble dans l'air,  
    Sans rien en lui qui pèse ou qui pose.

!!! summary "Objectifs pédagogiques"
    * Les variables
    * L'artithmétique Modulo
    * Les boucle
    * Les instructions conditionnelles

On aimerait écrire un programme qui affiche les nombres entiers impairs entre 1 et 99.

Une première approche consiste à énumérer tous les nombres entre 1 et 99 et de ne les afficher que si ils sont impairs.
Mais comment vérifier si un nombre est pair ou impair?

La méthode standard pour tester si un nombre est pair ou impair est de calculer le **reste** de la division du nombre par 2.
Si le reste de la division par deux est égal à zéro, alors le nombre est pair; si le reste est 1, alors le nombre est impair.
En Kotlin, comme pour la plupart des langages de programmation, le reste d'une division entière se fait avec l'opération *modulo*
représenté par le symbole `%`.

Voici donc un programme simple qui énumère les nombres entiers entre 1 et 100 et ne l'affiche que si ils sont impairs:

``` kotlin
fun main(args: Array<String>) {
    for (i: Int in 1..99) {
        if (i % 2 == 1) { // si i est impair
            println(i)
        }
    }
}
```

L'instruction `for` permet de parcourir les éléments d'une liste. Ici nous avons besoin de la liste des nombres entre 1 et 99 et 
en Kotlin, nous représentons ceci avec `i in 1..99`. On aurait aussi pu écrire `i in 1 until 100` qui signifie de 1 à 100, 100 non compris.

Pour ne faire quelque chose que lorsqu'une condition est remplie (ici la condition c'est que le nombre soit impair), on utilise
l'instruction `if`. Dans le jargon informatique, on parle d'une *instruction conditionnelle*. Les instructions qui seront
exécutées si la condition est remplie sont délimitées par les accolades `{` et `}`.

Ce programme fonctionne, mais ce n'est ni le plus simple ni le plus efficace. Une meilleure solution serait de
générer les nombres de 1 à 99 avec un incrément de 2. En Kotlin, on peut définir l'incrément (saut) avec le mot clé `step`.

Voici cette deuxième version :

!!! success ""
    ``` kotlin
    fun main(args: Array<String>) {
        for (i:Int in 1..99 step 2) {
            println(i)
        }
    }
    ```

C'est la version que nous préférons.

On aurait aussi pu énumérer les nombres entre 0 et 50 (50 non compris) et afficher chaque nombre en le multipliant par 2 et en additionnant 1:

``` kotlin
fun main(args: Array<String>) {
    for (i:Int in 0..49) {
        println(i * 2 + 1)
    }
}
```

Cette solution est efficace, mais pas meilleure, ni plus simple que la version précédente.

!!! note "Exercice"
    Modifiez le programme pour qu'il affiche les nombres entre 1 et 100 qui sont divisibles par 3.

    ??? success "Solution"
        ``` kotlin
        fun main(args: Array<String>) {
            for (i: Int in 3 until 100 step 3) {
                println(i)
            }
        }
        ```

!!! note "Exercice"
    Modifiez le programme pour qu'il affiche les nombres entre 1 et 100 qui sont divisibles par 3 ou par 5.

    ??? success "Solution"
        ``` kotlin
        fun main(args: Array<String>) {
            var m3: Int = 6 // next multiple of 3
            var m5: Int = 5 // next multiple of 5
            var x: Int = 3
            while (x <= 100) {
                println(x)
                if (m3 == m5) {
                    x = m3
                    m3 = m3 + 3
                    m5 = m5 + 5
                } else {
                    if (m3 < m5) {
                        x = m3
                        m3 = m3 + 3
                    } else {
                        x = m5
                        m5 = m5 + 5
                    }
                }
            }
        }
        ```

!!! note "Exercice"
    Ecrivez une programme qui affiche les puissances de 2 inférieures ou égales à 100.

    ??? success "Solution"
        ``` kotlin
        fun main(args: Array<String>) {
            var x: Int = 1
            while (x <= 100) {
                println(x)
                x = x * 2
            }
        }
        ```

!!! tip "Avancé"
    Voici une solution élégante qui utilise les concepts de «stream» et d'«expression lambda».

    ``` kotlin
    fun main(args: Array<String>) {
        generateSequence(1) { it + 2 }
                .takeWhile { n -> n < 100 }
                .forEach { n -> println(n) }
    }

    Ces concepts seront expliqués en détail à la fin du premier semestre.
    ```
