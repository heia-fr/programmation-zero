# L'arrondi à 5 centimes  

<center>
<img src="../images/CH_CHF0.05.png" width="200">
</center>

!!! summary "Objectifs pédagogiques"
	* Concevoir une solution.
	* Employer des opérateurs arithmétiques.
	* Utiliser Math.round().

En Suisse, nous n'avons pas de monnaie plus petite qu'une pièce de 5 centimes. Si on veut écrire des programmes qui travaillent avec des
valeurs financières, il peut donc s'avérer utile **d'arrondir** une valeur avec une précision de 5 centimes.

Avec Kotlin (ou Java), nous avons une fonction qui arrondit un nombre à l'entier le plus proche. Cette fonction s'appelle `Math.round`. Par exemple, `Math.round(3.4)` donne `3`.
Comment pouvons-nous utiliser cette fonction pour résoudre notre problème d'arrondi à 5 centimes&nbsp;?

Une solution consiste à convertir le montant donné en nombre de pièces de 5 centimes, d'arrondir à l'entier le plus proche, et de concertir à nouveau en francs. Comment alors
convertir un montant $x$ en nombre de pièces de 5 centimes ? Autrement dit, combien y a-t-t'il de pièces de 5 centimes dans 1 franc ? 1 franc = 100 centimes, donc dans 1 francs, équivaut à $\frac{100}{5} = 20$ pièces de 5 centimes. Pour convertir $x$ francs en nombre de pièces de 5 centimes il suffit donc de multiplier $x$ par $20$.

L'algorithme d'arrondi à 5 centimes d'un vontant x est donc le suivant:

* Multiplier x par 20 pour avoir le nombre de pièces de 5 centimes
* Arrondir le résultat à l'entier le plus proche
* Diviser le résultat par 20 pour retourner à une valeur en francs

``` kotlin
fun round5(x: Double): Double {
    return Math.round(x * 20) / 20.0
}

fun main(args: Array<String>) {
    println(round5(42.72))
    println(round5(42.74))
    println(round5(42.76))
    println(round5(42.78))
}
```

```
42.7
42.75
42.75
42.8
```

## Tests

Votre programme semble fonctionner, mais en êtes-vous bien sûr ? Une bonne pratique en génie logiciel[^1] est de bien tester son programme.
Dans l'exemple de l'arrondi à 5 centimes, comment vérifier que le programme fonctionne comme demandé&nbsp;?

A votre avis, quel devrait être l'arrondi à 5 centimes de 4.75 ? Vérifiez que votre programme donne le résultat attendu. Et
quel devrait être l'arrondi à 5 centimes de -4.75 (nombre négatif)&nbsp;? Vérifiez à nouveau. Si votre programme ne donne pas le résultat attendu, est-ce votre programme qui est faux
ou la valueur attendue qui est fausse&nbsp;?

!!! note "Exercice"
    Ecrivez une fonction qui arrondit à 5 francs.

[^1]: «Le génie logiciel est une science de génie industriel qui étudie les méthodes de travail et les bonnes pratiques des ingénieurs qui développent des logiciels.» (Wikipedia)