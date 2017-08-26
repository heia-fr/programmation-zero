# Le PGDC

<center>
<img src="../images/euclid.jpg" width="200">
</center>

``` kotlin
fun gcd(x: Int, y: Int): Int {
	var a: Int = x
	var b: Int = y
    while (a != b) {
        if (a > b) {
            a -= b
        } else {
            b -= a
        }
	}
    return a
}

fun main(args: Array<String>) {
	println(gcd(146, 72))
}
```

```
2
```

Version récursive

```kotlin
fun gcd(x: Int, y: Int): Int {
    if (x == y) {
        return x;
    } else if (x > y) {
        return gcd(x-y, y);
    } else {
    		return gcd(x, y - x);
    }
}
```

``` kotlin
fun gcd2(x: Int, y: Int): Int {
	var a: Int = x
	var b: Int = y
    var d: Int = 1

    while (a % 2 == 0 && b % 2 == 0) {
        a /= 2
        b /= 2
        d *= 2
    }
    while (a != b) {
        if (a % 2 == 0) {
            a /= 2;
        } else if (b % 2 == 0) {
            b /= 2;
        } else if (a > b) {
            a = (a - b) / 2
        } else {
            b = (b - a) / 2
        }
	}
    return a*d
}
```

``` kotlin
fun gcd(x: Int, y: Int): Int {
	var a: Int = x
	var b: Int = y
	while (b != 0) {
		val t: Int = a
		a = b
		b = t % b
	}
	return a
}
```

``` kotlin
fun gcd(x: Int, y: Int): Int {
	if (y == 0) {
		return x
	} else {
		return gcd(y, x % y)
	}
}
```
