---
title: La suite de Fibonacci
---

<center>
    <img src="../images/Fibonacci2.jpg" width="200">
</center>

!!! summary "Objectifs pédagogiques"
    * Diviser le code.
    * Expliquer la différence entre les boucles "while" et "for".


[Leonardo Fibonacci](https://fr.wikipedia.org/wiki/Leonardo_Fibonacci) 
était un mathématicien italien qui vécut de 1175 à 1250. En 1202, Leonardo Fibonacci publie l'ouvrage *Liber abaci*
dans lequel il décrit la croissance d'une population de lapins avec la suite de nombres suivante:

$$0, 1, 1, 2, 3, 5, 8, 13, 21, 34, \dots$$

Cette suite commence par 0 et 1, et ensuite chaque nombre suivant est calculé en additionnant les deux nombres précédents.
Dans la suite ci-dessus, le prochain nombre est: \(21 + 34 = 55\).

On peut formaliser cette suite de la manière suivante:

$$
\begin{aligned}
Fib_0 &=& 0 \\\\
Fib_1 &=& 1 \\\\
\forall n > 1, Fib_n &=& Fib_{n-1} + Fib_{n-2}
\end{aligned}
$$


## Programme simple pour afficher la suite de Fibonacci

Nous aimerions écrire un programme qui affiche les premiers nombres de cette suite de
Fibonacci.

Voici une première version de ce programme:

``` kotlin
fun printFibonacci(max: Int) {
    var fib0: Int = 0
    var fib1: Int = 1
    while (fib0 <= max) {
        println(fib0)
        val t: Int = fib0
        fib0 = fib1
        fib1 = fib1 + t
    }
}

fun main(args: Array<String>) {
    printFibonacci(100)
}
```

Pour cette solution, nous avons décidé de faire 2 fonctions. La fonction `main` reste nécessaire
et c'est elle qui sera appelée en premier dès que nous exécutons le programme, et la fonction
`printFibonacci(max)` qui affiche effectivement les nombres de la suite de Fibonacci qui
sont inférieurs ou égaux à `max`.

On aurait aussi pu tout mettre dans `main` comme nous l'avons fait jusqu'à maintenant, mais
le fait d'utiliser une méthode dédiée pour afficher la suite de Fibonacci offre plusieurs
avantages:

* Nous pouvons facilement afficher plusieurs suites de Fibonacci avec
  des limites différentes; il suffit d'appeler `printFibonacci` avec
  des arguments différents
* Le programme est plus lisible, car nous avons donné un *nom*
  (printFibonacci) à la suite d'instructions qui affiche la suite de
  Fibonacci. Quand on lit le programme principal (main), nous savons ce
  que le programmeur voulait faire sans même avoir à étudier les détails
  de l'implémentation

Cette pratique de diviser un programme en procédures est très importante en programmation,
et ça fait partie des bonnes pratiques à suivre.

De la même manière que l'écrivain divise son livre en chapitres, sections et paragraphes,
le programmeur divise son programme en modules et fonctions. Et quand nous écrivons
une fonction, on laisse parfois des lignes blanches entre deux parties de code pour représenter
les paragraphes.

la fonction `printFibonacci` est définie à l'aide du mot clé `fun `et la partie entre
parenthèses `(max: Int)` indique que cette fonction doit être appelée avec un argument
(ou paramètre) de type entier (`Int`) et cet argument est identifié par le nom `max`.
Dans le *corps* de la fonction (la partie entre les accolades), nous pouvons utiliser
`max` pour faire référence à sa valeur.

Nous voyons aussi que nous avons utilisé `while` et non `for` pour énumérer les
solutions. En effet, l'instruction `for` s'utilise quand on sait combien on a
d'éléments à parcourir, mais quand on ne sait pas, on utilise `while`. L'instruction
`while` permet de répéter des instructions *tant qu'* une condition est vraie.
Dans l'exemple ci-dessus, nous répétons les instructions qui calculent le nombre
suivant de la suite de Fibonacci *tant que* ce nombre est plus petit ou égal à `max`.

Arrêtons-nous un instant sur les 3 lignes suivantes:

``` kotlin
val t: Int = fib0
fib0 = fib1
fib1 += t
```

Pourquoi avons-nous utilisé une nouvelle variable `t`? En fait, nous aimerions écrire
ceci:

!!! bug ""
    ``` kotlin
    fib0 = fib1
    fib1 = fib0 + fib1
    ```

Pourquoi ça ne fonctionne pas comme ça ? Le problème vient lorsqu'on écrit `fib0 = fib1`,
on *remplace* la valeur de `fib0` par celle de `fib1`, donc quand on fait l'instruction
suivante, `fib0` a déjà été replacée par `fib1` et on a perdu son ancienne valeur.
L'effet de `fib1 = fib0 + fib1` revient à faire  `fib1 = fib1 + fib1` ou `fib1 = fib1 * 2`
et ce n'est pas ce que nous voulons.

Nous ne pouvons pas non plus inverser les deux instructions:

!!! bug ""
    ``` kotlin
    fib1 = fib0 + fib1
    fib0 = fib1
    ```

car dans ce cas c'est la valeur de `fib1` qui serait perdue.

Une solution possible consiste à utiliser une *variable temporaire* que nous appelons
souvent `t`. La première ligne `val t: Int = fib0` *sauve* la valeur de `fib0` dans
la variable temporaire `t`, ensuite on peut modifier `fib0` avec l'instruction
`fib0 = fib1` et pour calculer la nouvelle valeur de `fib2`nous utilisons `t`au
lieu de `fib0,` car nous avons besoin de sa valeur avant d'être remplacée par `fib1`:
`fib1 = fib1 + t`.

Notez que `fib1 = fib1 + t` aurait aussi pu s'écrire `fib1 += t`. Il s'agit d'une
syntaxe plus concise qui existe dans beaucoup de langages de programmation
(Kotlin, Java, C, ...).

Une autre particularité est que nous avons déclaré les variables `fib0` et `fib1` avec
le mot clé `var` alors que pour `t` nous avons utilisé `val`. Pourquoi ça ? En Kotlin,
si on déclare une variable avec `val`, ça signifie que sa valeur ne va pas changer
pendant toute sa durée de vie. On dit qu'elle est *immuable*. Le fait d'utiliser des
variables immuables a de nombreux avantages et c'est pourquoi il est recommandé de
déclarer le plus possible des variables avec `val`. Dans notre exemple les variables
`fib0` et `fib1` ne sont pas immuables, car elles changent souvent de valeur et
on ne peut donc pas les déclarer avec `val`.

Nous avons une solution efficace, mais est-ce qu'on arriverait à modifier notre
programme pour ne pas à avoir besoin de cette variable temporaire `t` ?
Ca demande un peu de réflexion, mais il y a en effet un moyen de faire sans avoir
recours à une variable temporaire.

Cette solution consiste à commencer par assigner la nouvelle valeur de
`fib1`: `fib1 = fib0 + fib1`. Comme nous avons encore `fib0`, nous n'avons pas
complètement perdu l'ancienne valeur de `fib1`; en effet, on peut simplement retrouver
l'ancienne valeur de `fib1` en *retranchant* `fib0` à la nouvelle valeur de `fib1`.
La fonction `printFibonacci` peut alors s'écrire comme ça:

``` kotlin
fun printFibonacci(max: Int) {
    var fib0: Int = 0
    var fib1: Int = 1
    while (fib0 <= max) {
        println(fib0)
        fib1 = fib1 + fib0
        fib0 = fib1 - fib0
    }
}
```

## Fonction qui retourne une valeur au lieu de l'afficher

Au lieu d'écrire une fonction qui affiche la suite de Fibonacci, on pourrait
aussi écrire une fonction qui calcule et *retourne* le n-ième nombre de la suite.

Voici une implémentation possible qui affiche les 12 premiers nombres de la suite:

``` kotlin
fun fibonacci(n: Int) : Int {
    var fib0: Int = 0
    var fib1: Int = 1
    for (i in 1..n) {
        fib1 = fib1 + fib0
        fib0 = fib1 - fib0
    }
    return fib0
}

fun main(args: Array<String>) {
    for (i: Int in 0 until 12) {
        println(fibonacci(i))
    }
}
```

!!! question "Question"
    Est-ce que cette version est meilleure ou moins bien que la précédente ?

Cette fois, la fonction `fibonacci` doit retourner une valeur, et nous indiquons
ceci avec le `: Int` qui suit les arguments entre parenthèses. Ceci indique
que la fonction est censée retourner quelque chose et ce quelque chose est de
type entier (`Int`). Dans le corps de la fonction, on doit avoir une instruction `return`
qui, comme son nom l'indique, *retourne* la valeur calculée.

Si on reprend la définition mathématique de la suite de Fibonacci,
on peut l'écrire pratiquement mot pour mot en Kotlin de la manière suivante :

```kotlin
fun fibonacci(n : Int) : Int = 
    if      (n == 0) 0
    else if (n == 1) 1
    else             fibonacci(n - 1) + fibonacci(n - 2)
```

On peut constater que nous n'avons pas la même structure
que pour les fonctions précédentes. Le corps de la fonction n'est pas un _bloc_
mais une expression, ce qui nous évite de devoir utiliser le mot clé _return_.

Notez que nous avons appelé la fonction `fibonacci` à l'intérieur de 
la fonction `fibonacci` elle-même. Cette construction s'appelle la *récursivité*
et c'est on concept très puissant en programmation. Nous y reviendrons plus
en détail dans une leçon suivante.

un bon développeur ne se contente pas de "juste" écrire du code. Il vérifie aussi
que son code soit correct et efficace.

Une bonne manière pour tester son code est d'écrire des _tests unitaires_. Ces
tests unitaires valident qu'une fonction donne bien les bonnes réponses pour les
valeurs correspondantes passées en paramètre. Pour notre fonction `fibonacci`,
nous pouvons par exemple vérifier que `fibonacci(10)` donne bien `55`. Et si
c'est bien le cas, pouvons nous en déduire que le programme est correct ?

!!! quote "Edsger W. Dijkstra - NATO Software Engineering Conference - October 1969"
    Testing shows the presence, not the absence of bugs

Comme l'a écrit Edsger W. Dijkstra, les tests ne permettent pas de prouver
l'absence de bugs, mais en testant plusieurs valeurs, on peut augmenter notre
confiance dans la solution implémentée.


```kotlin
import org.junit.jupiter.api.Test

import org.junit.jupiter.api.Assertions.*

internal class FibonacciKtTest {

    @Test
    fun test_fibonacci() {
        assertEquals(0, fibonacci(0))
        assertEquals(1, fibonacci(1))
        assertEquals(1, fibonacci(2))
        assertEquals(2, fibonacci(3))
        assertEquals(3, fibonacci(4))
        assertEquals(5, fibonacci(5))
        assertEquals(8, fibonacci(6))
        assertEquals(55, fibonacci(10))
    }

}
```

Attention au dépassement de capacité :

```kotlin
        ...
        assertEquals(1134903170, fibonacci(45))
        assertEquals(1836311903, fibonacci(46))
        assertEquals(3672623806, fibonacci(47))
        ...
```

Tester les cas spéciaux :

```kotlin
        ...
        assertEquals(?, fibonacci(-1))
        ...
```

!!! tip "Avancé"
    De la même manière que pour les nombres impairs, on peut aussi définir un «stream»
    de nombre de Fibonacci.

    ```kotlin
    val fibStream: Sequence<Int> =
            generateSequence(Pair(0, 1)) { Pair(it.second, it.first + it.second) }
                    .map { it.first }
    ```

## Exercices

!!! note "Exercice 1"
    Si on vous donne un programme qui définit deux variables `x` et `y`:

    ``` kotlin
    var x: Int = 12
    var y: Int = 7
    ```

    compléter ce programme pour *inverser* les valeurs de x et de y. Commencez
    par utiliser une variable temporaire `t`. Essayez ensuite d'inverser
    les valeurs de x et de y sans avoir besoin de variable temporaire.

    ??? success "Solution"
        ``` kotlin
        fun main(args: Array<String>) {
            var x = 12
            var y = 7
            x = x + y
            y = x - y
            x = x - y
            println(x)
            println(y)
        }
        ```

!!! note "Exercice 2"
    Ecrivez une fonction `fact(n: Int): Int` qui retourne la *factorielle* d'un nombre. La factorielle
    de \(n\), noté \(n!\) est définie comme suit:

    $$
    n! = \prod_{1<=i<=n} i = 1 \times 2 \times 3 \times 4 \times \dots \ \times (n-1) \ \times n
    $$

!!! note "Exercice 3"
    Le nombre d'Euler \(e\) peut être défini de la manière suivante:

    $$
    e = 1 + \frac{1}{1!} + \frac{1}{2!} + \frac{1}{3!} + \frac{1}{4!} + \frac{1}{5!} + \frac{1}{6!} + \dots
    $$

    Ecrivez un programme qui affiche les 100 premières itérations de l'approximation
    de \(e\).

!!! note "Exercice 4"
    Modifier le programme pour afficher les [nombres de Lucas](https://fr.wikipedia.org/wiki/Nombre_de_Lucas)

!!! tip "Exercice 5 (avancé)"
    En utilisant la variable `fibStream` et en vous insipirant du code similaire pour
    les nombres impairs, écrivez une fonction qui affiche tous les nombres de Fibonacci
    plus petit qu'un nombre passé en paramètre.