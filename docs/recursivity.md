# La récursivité

!!! quote "Stephen Hawking"
    To understand recursion, one must
    first understand recursion
    
La récursivité est une des techniques de programmation les plus employés et populaires.
Elle apparait quand on met en relation une entité avec elle-même, par exemple la 
[suite de Fibonacci](fibonacci.md) est définis en fonction d’ elle-même :

$$
\begin{aligned}
Fib_0 &=& 0 \\\\
Fib_1 &=& 1 \\\\
\forall n > 1, Fib_n &=& Fib_{n-1} + Fib_{n-2}
\end{aligned}
$$

On retrouve la récursivité dans des domaines très différents comme les sciences
du vivant, les mathématiques, l'informatique et la linguistique.
Certain acronyme de produit connu sont définis récursivement, par exemple
la signification de [GNU](https://www.gnu.org/) : "GNU's not Unix".

En informatique et plus spécialement en programmation, la récursivité est
une technique qui permet de résoudre et d'exprimer certains problèmes plus
simplement que de manière impérative. Par exemple, la factorielle d'un nombre est
mathématiquement définie comme suit :

$$
\begin{aligned}
Fac_0 &=& 1 \\\\
Fac_n &=& n * Fac_{n-1}
\end{aligned}
$$

!!! note "Exercice"
    Écrivez une fonction récursive qui calcule la factorielle d'un nombre et comparez-la avec l'implémentation impérative que vous avez [réalisé avant](fibonacci.md).
    
    [Solution](https://gitlab.com/HEIA-FR/programmation-zero/snippets/1668721)

## Le cas de base

Lorsque l'on écrit une fonction (ou un algorithme) récursive, il faut tout d'abord
réfléchir au cas trivial. Autrement dit, à quel moment la fonction doit s'arrêter.

Dans le cas de la factorielle d'un nombre, le cas de base est `n == 0`. À ce moment-là,
on n'effectue plus l'appel de fonction et on retourne la valeur `1`.

!!! note "Exercice"
    Identifiez précisément les cas de bases pour les fonctions récursives suivantes :
    
    * Factorielle
    * Suite de Fibonacci
    * [Suite de Syracuse](https://fr.wikipedia.org/wiki/Conjecture_de_Syracuse)
    * Tester si un nombre est pair
    * Tester si un nombre est impair
    
    [Solution](https://gitlab.com/HEIA-FR/programmation-zero/snippets/1668850)

Identifier le ou les cas de bases est un point clé dans la conception d'une fonction ou
d'un algorithme récursif.

## Décomposer le problème

Une fois que le ou les cas de bases sont identifiés, il faut essayer d'identifier les sous-problèmes
lier à la fonction. Par exemple, pour la factorielle, on décompose le calcul `n * fac(n-1)` en deux parties :

* Ce qui est calculé maintenant : `n * ...`
* Ce qui est délégué à un autre appel récursif : `... fac(n - 1)`

L'idée est de résoudre une partie du problème et de déléguer le reste du calcul à quelqu'un d'autre.

## Exercice

!!! note "Exercice"
    Proposer des signatures pour les fonctions récursives suivantes :
    
    * Factorielle
    * Suite de Fibonacci
    * [Suite de Syracuse](https://fr.wikipedia.org/wiki/Conjecture_de_Syracuse)
    * Tester si un nombre est pair
    * Tester si un nombre est impair
    
    [Solution](https://gitlab.com/HEIA-FR/programmation-zero/snippets/1668844)
    
!!! tip "Astuce : `TODO()`"
    Lorsque l'on écrit un programme, il arrive que l'on souhaite concevoir une fonction
    qui effectue certaines opérations, mais que l'on veuille l'implémenter plus tard.
    On écrit donc la signature de la fonction, mais sans l'implémenter, on écrit donc
    du code "bidon" pour que le programme compile :
    
    ```kotlin
    fun fac(n : Int) : Int {
        // TODO implement this function
        return 1
    }
    ```
    
    Avec Kotlin il est possible d'utiliser la fonction `TODO()` ce qui évite d'écrire
    du code inutile :
    
    ```kotlin
    fun fac(n : Int) : Int {
        TODO("Implement factorial")
    }
    ```

!!! note "Exercice"
    La suite de Syracuse est énoncée comme suit : 
    "On part d'un nombre entier plus grand que zéro ;  s'il est pair, on le divise par
    2 ; s'il est impair on le multiplie par 3 et on ajoute 1." Dès que la suite rencontre
    le nombre 1, elle va tourner sur elle-même avec la séquence `1,2,4`.
    
    Écrivez une fonction qui afficher la suite de Syracuse d'un nombre indéfiniment.
    
    [Solution](https://gitlab.com/HEIA-FR/programmation-zero/snippets/1668853)
    
!!! note "Exercice"
    Implémenter les fonctions suivantes en utilisant la technique de la récursivité :
    
    * Factorielle
    * Suite de Fibonacci
    * Tester si un nombre est pair
    * Tester si un nombre est impair
    
    [Solution](https://gitlab.com/HEIA-FR/programmation-zero/snippets/1668853)
