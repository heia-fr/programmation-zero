# Les nombres à l'envers

!!! quote "Citation"
    Pour voir le monde à l'endroit, il faut le regarder à l'envers.

!!! summary "Objectifs pédagogiques"
    * La démarche algorithmique.
    * Les opérateurs arithmétiques.
    * La dénomination de variables de type "long".
    * Les boucles.
    
  
``` kotlin
fun reverse (x: Long): Long {
	var t: Long = x
	var r: Long = 0
	while (t != 0L) {
		r = r * 10L + t % 10L
		t = t / 10L
	}
	return r
}

fun main(args: Array<String>) {
	println(reverse(512))
	println(reverse(100))
	println(reverse(0))
}
```

```
215
1
0
```
