# Les sommes de contrôlle  

``` kotlin
fun checksum(x: Long): Int {
	var t: Long = x
	var result: Int = 0
	while (t != 0L) {
		result = (result + (t % 10).toInt()) % 10
		t = t / 10L
	}
	return result
}

fun main(args: Array<String>) {
	println (checksum(999))
	println (checksum(512))
	println (checksum(651288))
}
```

```
7
8
0
```

version recursive

``` kotlin
fun checksum(x: Long): Int {
	if (x == 0L) {
		return 0;
	}
	return ((x % 10).toInt() + checksum(x / 10L)) % 10
}
```

Ajouter un chiffre pour que le checksum soit 0.

``` kotlin
fun zerosum(x: Long): Long {
    return x * 10L + (10 - checksum(x))%10
}
```

```
9993
5122
6512880
```
