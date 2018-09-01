# Les Nombres premiers

<center>
<img src="../images/Eratosthene.01.png" width="200">
</center>

<center>
<img src="../images/Sieve_of_Eratosthenes_animation.gif" width="400">
</center>

``` kotlin
fun primes(n: Int): List<Int> {
    val sieve: Array<Boolean> = Array(n, { true })
	sieve[0] = false
	sieve[1] = false
    for (i: Int in 2 until n) {
        for (j: Int in i * 2 until n step i) {
            sieve[j] = false
        }
    }
	return sieve.withIndex().filter { i -> i.value }.map { i -> i.index }
}

fun main(args: Array<String>) {
    println(primes(100))
}
```

```
[2, 3, 5, 7, 11, 13, 17, 19, 23, 29, 31, 37, 41, 43, 47, 53, 59, 61, 67, 71, 73, 79, 83, 89, 97]
```

Petite optimisation

``` kotlin
fun primes(n: Int): List<Int> {
    val sieve: Array<Boolean> = Array(n, { true })
	sieve[0] = false
	sieve[1] = false
    for (i: Int in 2 until n) {
		if (sieve[i]) { // only do the second loop if i is prime
	        for (j: Int in i * 2 until n step i) {
	            sieve[j] = false
	        }
		}	
    }
	return sieve.withIndex().filter { i -> i.value }.map { i -> i.index }
}
```

On s'arrête à \(\sqrt{n}\)

``` kotlin
fun primes(n: Int): List<Int> {
    val sieve: Array<Boolean> = Array(n, { true })
	sieve[0] = false
	sieve[1] = false
    for (i: Int in 2 until Math.sqrt(n.toDouble()).toInt()) {
		if (sieve[i]) { // only do the second loop if i is prime
	        for (j: Int in i * 2 until n step i) {
	            sieve[j] = false
	        }
		}	
    }
	return sieve.withIndex().filter { i -> i.value }.map { i -> i.index }
}
```

Construction itérative de la solution:

``` kotlin
fun primes(n: Int): List<Int> {
    val sieve: Array<Boolean> = Array(n, { true })
	val result: ArrayList<Int> = ArrayList()
	sieve[0] = false
	sieve[1] = false
    for (i: Int in 2 until n) {
		if (sieve[i]) { // only do the second loop if i is prime
			result.add(i)
	        for (j: Int in i * 2 until n step i) {
	            sieve[j] = false
	        }
		}	
    }
	return result
}
```