# Les bases

``` kotlin
fun inBase2(number: Int): String {
    var n: Int = number
    if (n == 0) {
        return "0"
    }
    var result: String = ""
    while (n != 0) {
        val digit: Int = n % 2
        n /= 2
        result = digit.toString() + result
    }
    return result
}

fun main(args: Array<String>) {
    println(inBase2(42))
}
```

```
101010
```

$$42 = 2^{5} + 2^{3} + 2^{1} = 32 + 8 + 2$$

``` kotlin
fun inBase10(x: String): Int {
    var res: Int = 0
    for (c: Char in x) {
        res = res * 2
        if (c == '1') {
            res++
        }
    }
	return res
}

fun main(args: Array<String>) {
    println(inBase10("110011"))
}
```


```
51
```

$$2^{5} + 2^{4} + 2^{1} + 2^{0} = 32 + 16 + 2 + 1 = 51$$