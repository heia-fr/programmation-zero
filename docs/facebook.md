# Facebook sticker

<center>
<img src="../images/facebook-logo.jpg">
</center>

``` kotlin
fun solve(sticker: String, text: String): Int {
    val sm = HashMap<Char, Int>()
    val tm = HashMap<Char, Int>()
    for (c in sticker.toLowerCase()) {
        if (c >= 'a' && c <= 'z') {
            sm.set(c, sm.getOrDefault(c, 0) + 1)
        }
    }
    for (c in text.toLowerCase()) {
        if (c >= 'a' && c <= 'z') {
            tm.set(c, sm.getOrDefault(c, 0) + 1)
        }
    }
    var result = 0
    for (i in tm.entries) {
        if (!sm.containsKey(i.key)) {
            return 0
        }
        result = maxOf(result, (i.value + sm.get(i.key)!! - 1) / sm.get(i.key)!!)
    }
    return result
}

fun main(args: Array<String>) {
    val n = solve ("facebook", "coffee kebab")
    if (n == 0) {
        println("Impossible.")
    } else {
        println("You need $n stickers.")
    }
}
```

```
You need 2 stickers.
```
