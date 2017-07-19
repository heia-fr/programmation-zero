# Hello World

La [tradition](https://fr.wikipedia.org/wiki/Hello_world) veut que le premier programme que l'on écrit soit un programme qui affiche «Hello World» à l'écran.

Voici ce que ça donne en Kotlin:

``` kotlin
fun main(args: Array<String>) {
    println("Hello World")
}
```

Dans ce programme `fun` indique que vous écrivez une **fonction**. La fonction est
la structure dans Kotlin qui permet de regrouper une séquence d'instructions.
Dans d'autres
langages de programmation, on utilise parfois le terme de «procédure» ou de
«méthode» à la place de «fonction»[^1].

En plus de regrouper des instructions, une
fonction permet de donner un **nom** à ce groupe d'instructions. Dans l'exemple
ci-dessus, le nom donné à est `main`. Nous verrons plus tard que nous pouvons
donner plus ou moins le nom qu'on veut à une fonction, mais `main` a une
signification particulière dans un programme Kottlin; elle indique que les instructions de cette fonction sont celles qui devront être exécutées lors du
lancement du programme. Tous les programmes que nous écrirons auront une fonction `main`.

La partie entre parenthèses indique les **arguments** de la fonction. Ces arguments — ou paramètres — sont utilisables par les instructions de la fonction et
permettent d'en influencer le comportement. Nous donnerons plus d'explication
dans les prochains chapitres, mais sachez juste que pour la fonction `main`, 
Kotlin s'attend à avoir une liste d'arguments et on écrit `args: Array<String>`
entre les parenthèses.

A la fin de la première ligne, on trouve le symbole `{`. Nous avons vu qu'une
fonction permet de regrouper des instructions et ce symbole indique le début
de cette collection d'instruction. A la fin on trouve le symbole `}` qui indique
la fin de cette collection d'instructions.

La deuxième ligne: `println("Hello World")` est celle qui affiche effectivement
le texte à l'écran. `println` est une instruction qui affiche quelque chose à l'écran. Pour être plus précis, `println` est une *fonction* qui regroupe les instructions qui permettent d'afficher quelque chose à l'écran et nous pouvons *appeler* cette fonction simplement en écrivant son nom, suivi des *arguments* entre parenthèses. Ici l'argument est `"Hello World"` et c'est le texte que nous
donnons à la fonction `println` pour qu'elle l'affiche à l'écran. 

!!! note "Exercice"
    Modifiez le programme pour qu'il affiche «Bonjour le Monde» au lieu de «Hello World». Compilez et exécutez votre programme dans l'environnement de développement «IntelliJ IDEA Community Edition».

[^1]:
    Certains langages de programmation font une différence entre une
    fonction et une procédure. Une fonction retourne un résultat alors
    qu'une procédure ne retourne rien.