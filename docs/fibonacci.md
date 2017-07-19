# La suite de Fibonacci

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

