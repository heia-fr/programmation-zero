# Les nombres à l'envers
  
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
