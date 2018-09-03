# Les Nombres premiers

<center>
<img src="../images/Eratosthene.01.png" width="200">
</center>

!!! quote "Entrée Wikipedia pour Ératosthène"
    Disciple d'Ariston de Chios, 
    [Ératosthène](https://fr.wikipedia.org/wiki/%C3%89ratosth%C3%A8ne)
    fut nommé à la tête de la bibliothèque
    d'Alexandrie vers -245 à la demande de Ptolémée III, pharaon d'Égypte, et fut
    précepteur de son fils Ptolémée IV. Selon Suidas, il se laissa mourir de faim,
    parce que, devenu aveugle, il ne pouvait plus admirer les étoiles.

## Le crible d'Ératosthène

<center>
<img src="../images/New_Animation_Sieve_of_Eratosthenes.gif" width="400">
</center>

``` kotlin
fun printPrimes(n: Int) {
    val isPrimeArray: Array<Boolean> = Array(n, { true })
	isPrimeArray[0] = false
	isPrimeArray[1] = false
    for (i: Int in 2 until n) {
        for (j: Int in i*2 until n step i) { // j=i*2,i*3, i*4, ...
            isPrimeArray[j] = false
        }
    }
	
	// loop through array and print primes
    for (i: Int in 2 until n)
        if (isPrimeArray[i])
            println(i)

}

fun main(args: Array<String>) {
    printPrimes(100))
}
```

```
[2, 3, 5, 7, 11, 13, 17, 19, 23, 29, 31, 37, 41, 43, 47, 53, 59, 61, 67, 71, 73, 79, 83, 89, 97]
```

## Quelques optimisations

Première optimisation pour reduire le nombre d'itérations

??? success "Code"

    ``` kotlin
    fun primes(n: Int) {
        val isPrimeArray: Array<Boolean> = Array(n, { true })
    	isPrimeArray[0] = false
    	isPrimeArray[1] = false
        for (i: Int in 2 until n) {
    		if (isPrimeArray[i]) { // inner loop only if i is prime
    		    println(i) // directly print i since it is prime
    	        for (j: Int in i * 2 until n step i) {
    	            isPrimeArray[j] = false
    	        }
    		}	
        }
    }
    ```

Et encore: on s'arrête à \(\sqrt{n}\)

??? success "Code"

    ``` kotlin
    fun primes(n: Int) {
        val isPrimeArray: Array<Boolean> = Array(n, { true })
    	isPrimeArray[0] = false
    	isPrimeArray[1] = false
        for (i: Int in 2 until Math.sqrt(n.toDouble()).toInt()) {
    		if (isPrimeArray[i]) { 
    		    println(i)
    	        for (j: Int in i * 2 until n step i) {
    	            isPrimeArray[j] = false
    	        }
    		}	
        }
    }
    ```

## Variante

Construction itérative de la solution:

??? success "Code"

    ``` kotlin
    fun primes(n: Int): List<Int> {
        val sieve: Array<Boolean> = Array(n, { true })
    	val result: ArrayList<Int> = ArrayList()
    	sieve[0] = false
    	sieve[1] = false
        for (i: Int in 2 until n) {
    		if (sieve[i]) {
    			result.add(i)
    	        for (j: Int in i * 2 until n step i) {
    	            sieve[j] = false
    	        }
    		}	
        }
    	return result
    }
    ```
