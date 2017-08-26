# L'arrondi à 5 centimes  

<center>
<img src="../images/CH_CHF0.05.png" width="200">
</center>

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

!!! note "Exercice"
    Ecrivez une fonction qui arrondit à 5 francs.
