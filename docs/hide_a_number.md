---
title: Je cache un nombre et tu le devines
---

!!! quote "Martin Fowler:"
    Any fool can write code that a computer can understand. Good programmers write code that humans can understand.

On aimerait écrire un programme qui «cache» un nombre dans un intervalle donné et qui nous invite à le deviner. Le programme nous donnera des indications du type
«plus grand» ou «plus petit» pour nous aider à deviner ce nombre.

## Le hasard

Le premier défi consiste à faire en sorte que le nombre caché par le programme soit pris au hasard. En effet, l'ordinateur n'a pas vraiment la notion de hasard et tout ce qu'il fait est le fruit d'une logique rigoureuse. L'ordinateur n'a donc pas de moyen simple de prendre un nombre **vraiment** au hasard, mais il peut en donner l'illusion. On parle alors de nombre [pseudo-aléatoire](https://fr.wikipedia.org/wiki/Pseudo-al%C3%A9atoire). La *qualité* du hasard peut être améliorée en utilisant des données variables telles que l'heure qu'il est, le niveau de bruit d'un microphone, ou la distance parcourue par la souris. Dans le jargon informatique, on parle d'[entropie](https://en.wikipedia.org/wiki/Entropy_(computing)).

Nous n'allons pas aller plus dans les détails de la génération de nombre aléatoire, mais sachez que c'est un thème important de l'informatique et c'est également la cause de plusieurs vulnérabilités en termes de sécurité (par exemple le [Debian Security Advisory DSA-1571-1](https://www.debian.org/security/2008/dsa-1571) ou le [Dual_EC_DRBG](https://en.wikipedia.org/wiki/Dual_EC_DRBG)).

Pour notre problème, nous utiliserons simplement un mécanisme disponible dans la bibliothèque Java[^1]: la classe «[Random](https://docs.oracle.com/javase/8/docs/api/java/util/Random.html)»

Voici comment utiliser «Random»: Le programme ci-dessous génère un nombre aléatoire inférieur à 100 et l'affiche à l'écran:

``` kotlin
import java.util.Random

fun main(args: Array<String>) {
    val rand = Random()
    val secretNumber = rand.nextInt(100)
    println(secretNumber)
}
```

L'instruction `import java.util.Random` indique au programme que nous souhaitons utiliser la bibliothèque `Random` de java et que cette bibliothèque se trouve dans le «package» `java.util`.

L'instruction `val rand = Random()` définit la variable `rand` de type `Random`. Pour être plus précis, la variable `rand` est un objet, instancié à partir de la classe `Random`, mais en continuant cette explication ça nous amènerait à expliquer la programmation orientée objet et ça sort du cadre de ce chapitre. Sachez juste que cette variable `rand` permet de faire des choses liées aux nombres pseudo-aléatoires.

L'instruction suivante `val secretNumber = rand.nextInt(100)` utilise la variable (ou l'objet) `rand` pour générer un nombre pseudo-aléatoire plus grand ou égal à zéro et plus petit que 100. En mathématique on écrirait:

$$0 \leq n < 100$$

Ce nombre est ensuite sauvé dans la variable `secretNumber`.

Vous connaissez déjà la dernière instruction et elle affiche simplement la variable `secretNumber` à l'écran.

On n'a pas vraiment besoin de cette variable `secretNumber` et on aurait aussi pu écrire le programme comme ça:

``` kotlin
import java.util.Random

fun main(args: Array<String>) {
    val rand = Random()
    println(rand.nextInt(100))
}
```

L'intérêt d'utiliser une variable est qu'on peut donner un *nom* à ce nombre, on sait en lisant le code que ce nombre aléatoire est un *nombre secret* et dans le contexte de notre programme on sait que c'est le nombre que l'utilisateur doit deviner. On aurait pu utiliser n'importe quel nom pour cette variable, mais admettez que `secretNumber` est bien plus expressif que quelque chose comme `x` ou `n`.

## Saisie d'un nombre

Nous devons maintenant trouver un moyen pour que l'utilisateur puisse entrer un nombre pour essayer de trouver celui que le programme nous cache. Pour ce faire, nous utilisons la fonction `readLine`.

Voici comment nous utilisons cette fonction :

``` kotlin
import java.util.Random

fun main(args: Array<String>) {
    val rand = Random()
    val secretNumber = rand.nextInt(100)
    println("I'm hiding a number between 0 and 99.")
    print ("try to guess it : ")
    val guess = readLine()
    println("Your guess is $guess.")
}
```

C'est un bon début, et si on exécute ce programme, voici qu'on obtient:

```
I'm hiding a number between 0 and 99.
try to guess it : 42
Your guess is 42.
```

Avant d'aller plus loin, il y a quelque chose de pas élégant dans le programme que nous venons d'écrire. Pour trouver ce que c'est, imaginez que vous souhaitez rendre le programme plus compliqué et cacher un nombre entre 0 et 200. Vous devrez alors modifier le programme à plusieurs endroits. Pour améliorer la situation, il suffit de définir une variable `upperLimit` et de tout faire par rapport à cette variable. Voici une version améliorée du code:

``` kotlin
import java.util.Random

fun main(args: Array<String>) {
    val upperLimit = 100
    val rand = Random()
    val secretNumber = rand.nextInt(upperLimit)
    println("I'm hiding a number between 0 and ${upperLimit - 1}.")
    print ("try to guess it : ")
    val guess = readLine()
    println("Your guess is $guess.")
}
```

## Comparaison

Nous devons maintenant comparer le nombre entré par l'utilisateur avec le nombre secret. Mais bien que l'utilisateur ait entré un nombre, la fonction `readLine` retourne toujours du texte (string) et avant de faire la comparaison, nous devons *convertir* ce texte en nombre. Kotlin permet de faire ça facilement avec la méthode *toInt*. Voici comment on fait ça:

``` kotlin
import java.util.Random

fun main(args: Array<String>) {
    val upperLimit = 100
    val rand = Random()
    val secretNumber = rand.nextInt(upperLimit)
    println("I'm hiding a number between 0 and ${upperLimit - 1}.")
    print ("try to guess it : ")
    val guess = readLine()!!.toInt()
    if (guess < secretNumber) {
        println("Your guess $guess is too low")
    } else if (guess > secretNumber) {
        println("Your guess $guess is too high")
    } else {
        println("Your guess $guess is correct. Congratulations")
    }
}
```

Dans ce code, la ligne `val guess = readLine()!!.toInt()` mérite une explication. Que signifient ces deux points d'exclamation? Kotlin est un langage de programmation qui offre plusieurs mécanismes pour écrire des programmes sûrs et fiables. Dans le programme ci-dessus, nous utilsons la fonction `readLine` pour lire ce que l'utilisateur entre au clavier. Comme indiqué dans la documentation, cette fonction peut retourner la valeur `null` dans certaines conditions:

!!! quote ""
    `fun readLine(): String? (source)`

    **Platform and version requirements: JVM**

    Reads a line of input from the standard input stream.

    **Return** the line read or `null` if the input stream is redirected to a file and the end of file has been reached.

Cette valeur `null` peut être source de nombreuses erreurs. L'opérateur `!!` fait que si `readline()` retourne `null`, alors une *exception* sera levée. La problématique du `null` est assez complexe et sort du cadre de ce chapitre. L'opérateur `!!` n'est pas non plus la manière la plus élégante de résoudre ce problème, mais c'est probablement la plus simple et c'est acceptable dans notre contexte.

## Répétition

Il ne reste plus qu'à répéter la dernière partie du code jusqu'à ce que la bonne réponse soit trouvée:

``` kotlin
import java.util.Random

fun main(args: Array<String>) {
    val upperLimit = 100
    val rand = Random()
    val secretNumber = rand.nextInt(upperLimit)
    println("I'm hiding a number between 0 and ${upperLimit - 1}.")
    print ("try to guess it : ")
    while (true) {
        val guess = readLine()!!.toInt()
        if (guess < secretNumber) {
            println("Your guess $guess is too low")
        } else if (guess > secretNumber) {
            println("Your guess $guess is too high")
        } else {
            println("Your guess $guess is correct. Congratulations")
            break
        }
        print("try again : ")
    }
} 
```

Voici à quoi ressemble une session:

```
I'm hiding a number between 0 and 99.
try to guess it : 42
Your guess 42 is too low
try again : 64
Your guess 64 is too high
try again : 54
Your guess 54 is too low
try again : 60
Your guess 60 is too high
try again : 58
Your guess 58 is too low
try again : 59
Your guess 59 is correct. Congratulation
```

!!! note
    En faisant les bons choix, combien de coups *au maximum* sont nécessaires pour deviner à un nombre entre 0 et 99?

!!! note
    Combien de coups sont nécessaires pour deviner un nombre entre 0 et 1000?

!!! note
    Combien de coups sont nécessaires pour deviner un nombre entre 0 et 2000?

!!! note
    Si j'ai droit à 20 essais quel doit être la limite supérieure du nombre caché pour que je puisse le trouver?

## La croissance exponentielle

La relation entre le nombre de coups et la limite supérieure est une fonction *exponentielle*. Si \(n\) est le nombre de coups permis et \(m\) la limite supérieure du nombre caché, nous pouvons écrire :

$$ m = 2^n $$

La croissance exponentielle est aussi au coeur de l'intrigue du thriller «[Inferno](https://fr.wikipedia.org/wiki/Inferno_(film,_2016))» réalisé par Ron Howard et adapté du roman du même nom de l'Américain Dan Brown.

<center>
<img src="../images/bottle.jpg" width="400">
</center>

Ce film fait référence à la [vidéo](https://youtu.be/x5OYmRyfXBY) dans laquelle le professeur [Al Bartlett](https://fr.wikipedia.org/wiki/Albert_Allen_Bartlett) illustre le concept de croissance exponentielle de la manière suivante

!!! quote ""
    Si une des bactéries croit en doublant leur population, vous commencez avec une bactérie, puis vous en avez 2, puis 4, puis 8, 16, etc.

    Supposons que la population double chaque minute et que ces bactéries vivent dans l'espace limité d'une bouteille.
    Nous commençons l'expérience à 11h00 avec une seule bactérie dans une bouteille vide et nous observons que la bouteille est pleine à midi. A quelle heure est-ce que la bouteille est à moitié pleine?

    Certains seront tentés de dire 11h30, mais la population double chaque minute, donc la bouteille sera à moitié pleine à 11h59

    Si vous étiez une de ces bactéries, à quelle heure est-ce que vous réaliserez que vous allez manquer de place? A 11h59 la bouteille est à moitié pleine, à 11h58 la bouteille est à un quart pleine, à 11h57 et est à 12.5%, ...
    A 11h55 elle n'est pleine qu'à 3%, avec 97% d'espace libre. Combien d'entre vous allez réaliser qu'il y aura un problème?


!!! quote "Albert Allen Bartlett:"
    The greatest shortcoming of the human race is our inability to understand the exponential function.

## Exercices

!!! note "Exercice"
    Modifiez le programme pour qu'il affiche le nombre de coups utilisés pour deviner le secret.

!!! note "Exercice"
    Modifiez le programme pour que ça soit vous qui cachez un nombre et votre programme devra le trouver.

[^1]:
    Kotlin n'a pas de bibliothèque à lui pour générer des nombres pseudo-aléatoires, mais ce n'est pas un problème, car Kotlin a été fait pour facilement utiliser la bibliothèque de Java.