# Tu caches un nombre et je le devine

``` kotlin
fun main(args: Array<String>) {
    var lowerLimit = 0
    var upperLimit = 99

    println("Think about a number between ${lowerLimit} and ${upperLimit}.")
    print("I will try to guess it... Press RETURN when ready.")
    readLine()
    loop@
    while (true) {
        val guess = (lowerLimit + upperLimit) / 2
        print("My guess is ${guess}. Enter '=' if found, '-' if it is too high and '+' if it is too low ")
        val reply = readLine()
        when (reply) {
            "=" -> {
                println("Thank you")
                break@loop
            }
            "+" -> lowerLimit = guess + 1
            "-" -> upperLimit = guess - 1
            else -> println("I don't understand.")
        }
    }
}
```

```
Think about a number between 0 and 99.
I will try to guess it... Press RETURN when ready.
My guess is 49. Enter '=' if found, '-' if it is too high and '+' if it is too low -
My guess is 24. Enter '=' if found, '-' if it is too high and '+' if it is too low +
My guess is 36. Enter '=' if found, '-' if it is too high and '+' if it is too low +
My guess is 42. Enter '=' if found, '-' if it is too high and '+' if it is too low =
Thank you
```

!!! note "Exercice"
    Modifier le programme pour afficher le mombre de coups utilisés

!!! note "Exercice"
    Modifier le programme pour détecter les cas où l'utilisateur donne des réponses 
    qui ne permettent pas de trouver une solution. Par exemple:
    
    ```
    Think about a number between 0 and 99.
    I will try to guess it... Press RETURN when ready.
    My guess is 49. Enter '=' if found, '-' if it is too high and '+' if it is too low -
    My guess is 24. Enter '=' if found, '-' if it is too high and '+' if it is too low +
    My guess is 36. Enter '=' if found, '-' if it is too high and '+' if it is too low +
    My guess is 42. Enter '=' if found, '-' if it is too high and '+' if it is too low +
    My guess is 45. Enter '=' if found, '-' if it is too high and '+' if it is too low +
    My guess is 47. Enter '=' if found, '-' if it is too high and '+' if it is too low +
    My guess is 48. Enter '=' if found, '-' if it is too high and '+' if it is too low +
    My guess is 48. Enter '=' if found, '-' if it is too high and '+' if it is too low +
    My guess is 48. Enter '=' if found, '-' if it is too high and '+' if it is too low 
    ```