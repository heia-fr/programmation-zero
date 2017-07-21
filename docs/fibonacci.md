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
    val fibStream: Sequence<Int> =
            generateSequence(Pair(0, 1)) { Pair(it.second, it.first + it.second) }
                    .map { it.first }
    ```

!!! note "Exercice"
    En utilisant la variable _fibStream_ et en vous insipirant du code similaire pour
    les nombres impairs, écrivez une fonction qui affiche tous les nombres de Fibonacci
    plus petit qu'un nombre passer en paramètre.