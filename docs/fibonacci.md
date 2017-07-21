# La suite de Fibonacci

<center>
<img src="../images/Fibonacci2.jpg" width="200">
</center>

[Leonardo Fibonacci](https://fr.wikipedia.org/wiki/Leonardo_Fibonacci) 
était un mathématicien italien qui vécût de 1175 à 1250. En 1202, Leonardo Fibonacci publie l'ouvrage *Liber abaci*
dans lequel il décrit la croissance d'une population de lapins avec la suite de nombres suivante:

$$0, 1, 1, 2, 3, 5, 8, 13, 21, 34, \dots$$

Cette suite commence par 0 et 1, et ensuite chaque nombre suivant est calculé en additionnant les deux nombres précédents.
Dans la suite ci-dessus, le prochain nombre est: \(21 + 34 = 55\).

On peut formaliser cette suite de la manière suivante:

$$ Fib_0 = 0 $$

$$ Fib_1 = 1 $$  

$$ \forall n > 1, Fib_n = Fib_{n-1} + Fib_{n-2} $$

On peut écrire cette définition pratiquement mot pour mot de la manière suivante :
Nous aimerions écrire un programme qui affiche les premiers nombres de cette suite de
Fibonacci.

```kotlin
fun fib(n : Int) : Int = 
    if(n == 0) 0
    else if(n == 1) 1
    else  fib(n - 1) + fib(n - 2)
```

On peut constater que nous n'avons pas la même structure
que pour les fonctions précédentes. Le corps de la fonction n'est pas un _block_
mais une expression, ce qui nous évite de devoir utiliser le mot clé _return_.

!!! tip "Avancé"
    De la même manière que pour les nombres impairs, on peut aussi définir un «stream»
    de nombre de fibonacci.
    
    ```kotlin
    
    ```
Voici une première version de ce programme:

``` kotlin
fun printFibonacci(max: Int) {
    var fib0 = 0
    var fib1 = 1
    while (fib0 <= max) {
        println(fib0)
        val t = fib0
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

  * Nous pouvons facilement afficher plusieurs suites de Fibonacci avec des
    limites différentes; il suffit d'appeler `printFibonacci` avec des arguments
    différents
  * Le programme est plus lisible, car nous avons donné un *nom* (printFibonacci)
    à la suite d'instructions qui affichent la suite de Fibonacci.
    Quand on lit le programme principal (main), nous savons ce que le programmeur
    voulait faire sans même avoir à étudier les détails de l'implémentation
    
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
`while` permet de répéter des instructions *tant qu'*une condition est fausse.
Dans l'exemple ci-dessus, nous répétons les instructions qui calculent le nombre
suivant de la suite de Fibonacci *tant que* ce nombre est plus petit ou égal à `max`.

Arrêtons-nous un instant sur les 3 lignes suivantes:

``` kotlin
val t = fib0
fib0 = fib1
fib1 += t
```

Pourquoi avons-nous utiliser une nouvelle variable `t`? En fait, nous aimerions écrire
ceci:

!!! bug ""
    ``` kotlin
    fib0 = fib1
    fib1 = fib0 + fib1
    ```

Pourquoi ça ne fonctionne pas comme ça ? Le problème vient lorsqu'on écrit `fib0 = fib1`,
on *remplace* la valeur de `fib0` par celle de `fib1`, donc quand on fait l'instruction
suivante, `fib0` à déjà été replacée par `fib1` et on a perdu son ancienne valeur.
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
souvent `t`. La première ligne `val t = fib0` *sauve* la valeur de `fib0` dans 
la variable temporaire `t`, ensuite on peut modifier `fib0` avec l'instruction 
`fib0 = fib1` et pour calculer la nouvelle valeur de `fib2`nous utilisons `t`au
lieu de `fib0,` car vous avons besoin de sa valeur avant d'être remplacée par `fib1`:
`fib1 = fib1 + t`.

Notez que `fib1 = fib1 + t` aurait aussi pu s'écrire `fib1 += t`. Il s'agit d'une
syntaxe plus concise qui existe dans beaucoup de langages de programmation
(Kotlin, Java, C, ...).

Une autre particularité est que nous avons déclaré les variables `fib0` et `fib1` avec
le mot clé `var` alors que pour `t` nous avons utilisé `val`. Pourquoi ça ? En Kotlin,
si on déclare une variable avec `val`, ça signifie que sa valeur ne va pas changer
pendant toute sa durée de vie. On dit qu'elle est *immuable*. Le fait d'utiliser des
variables immuables à ne nombreux avantages et c'est pourquoi il est recommandé de
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
    var fib0 = 0
    var fib1 = 1
    while (fib0 <= max) {
        println(fib0)
        fib1 = fib1 + fib0
        fib0 = fib1 - fib0
    }
}
```