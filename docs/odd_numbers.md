# Les nombres impairs

!!! quote "Paul Verlaine (Art poétique)"
    De la musique avant toute chose,  
    Et pour cela préfère l'Impair  
    Plus vague et plus soluble dans l'air,  
    Sans rien en lui qui pèse ou qui pose.

On aimerait écrire un programme qui affiche les nombres entiers impairs entre 1 et 100.

Une première approche consiste à énumérer tous les nombres entre 1 et 100 et de ne les afficher que si ils sont impairs.
Mais comment vérifier si un nombre est pair ou impair?

La méthode standard pour tester si un nombre est pair ou impair est de calculer le **reste** de la division du nombre par 2.
Si le reste de la division par deux est égal à zéro, alors le nombre est pair; si le reste est 1, alors le nombre est impair.
En Kotlin, comme pour la plupart des langages de programmation, le reste d'une division entière se fait avec l'opération *modulo*
représenté par le symbole `%`.

Voici donc un programme simple qui énumère les nombres entiers entre 1 et 100 et ne l'affiche que si ils sont impairs:

``` kotlin
fun main(args: Array<String>) {
    for (i in 1 until 100) {
        if (i % 2 == 1) { // si i est impair
            println(i)
        }
    }
}
```

L'instruction `for` permet de parcourir les éléments d'une liste. Ici nous avons besoin de la liste des nombres entre 1 et 100 et 
en Kotlin, nous représentons ceci avec `i in 1 until 100`. Cette construction donne effectivement les nombres entre 0 et 99 car
la limite supérieure (100) n'est pas comprise dans la liste. Si on voulait avoir une liste y compris 100, on aurait écrit `i in 1..100`.
Comme 100 n'est pas impair, il ne sera pas affiché et dans notre cas précis, ça ne ferait pas de différence.

Pour ne faire quelque chose que lorsqu'une condition est remplie (ici la condition c'est que le nombre soit impair), on utilise
l'instruction `if`. Dans le jargon informatique, on parle d'une *instruction conditionnelle*. Les instructions qui seront
faites si la condition est remplie sont délimitées par les accolades `{` et `}`. 

Ce programme fonctionne, mais ce n'est ni le plus simple ni le plus efficace. Une meilleure solution serait de
générer les nombres de 1 à 100 avec un incrément de 2. En Kotlin, on peut définir l'incrément (saut) avec le mot clé `step`.

Voici cette deuxième version :

!!! success ""
    ``` kotlin
    fun main(args: Array<String>) {
        for (i in 1 until 100 step 2) {
            println(i)
        }
    }
    ```

C'est la version que nous préférons.

On aurait aussi pu énumérer les nombres entre 0 et 50 (50 non compris) et afficher chaque nombre en le multipliant par 2 et en additionnant 1:

``` kotlin
fun main(args: Array<String>) {
    for (i in 0 until 50) {
        println(i * 2 + 1)
    }
}
```

Cette solution est efficace, mais pas meilleure, ni plus simple que la version précédente. 

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

!!! note "Exercice"
    Modifiez le programme pour qu'il affiche les nombres entre 1 et 100 qui sont divisibles par 3.

!!! note "Exercice"
    Modifiez le programme pour qu'il affiche les nombres entre 1 et 100 qui sont divisibles par 3 ou par 5.