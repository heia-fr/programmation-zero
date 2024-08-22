---
title: Les palindromes
---
  
<center>
<img src="../images/sugus.jpg" width="400">
</center>

``` kotlin
fun isPalindrome (s: String): Boolean {
	for (i in 0 until s.length / 2) {
		if (s[i] != s[s.length - i -1]) {
			return false
		}
	}
	return true
}

fun main(args: Array<String>) {
	println(isPalindrome("sugus"))
	println(isPalindrome("hello"))
	println(isPalindrome("gaga"))
	println(isPalindrome("x"))
	println(isPalindrome(""))
}
```

```
true
false
false
true
true
```

version récursive:

``` kotlin
fun isPalindrome (s: String): Boolean {
	if (s.length <= 1) {
		return true
	}
	return (s.first() == s.last()) && isPalindrome(s.substring(1 until s.length-1))
}
```

supprimer les espaces et les caractères inconnus

``` kotlin
fun String.sanitize(): String {
	return this.toLowerCase().filter{c -> c.isLetter()}
}
	
fun main(args: Array<String>) {
	println(isPalindrome2("elu par cette crapule"))
	println(isPalindrome2("elu par cette crapule".sanitize()))
}
```

```
false
true
```

Le plus long mot du dictionnaire français qui est un palindrome:

``` kotlin
import java.io.File

const val wordlist = "data/french.txt"

fun String.sanitize(): String {
	return this.toLowerCase().filter{c -> c.isLetter()}
}

fun String.isPalindrome(): Boolean {
	if (this.length <= 1) {
		return true
	}
	return (this.first() == this.last()) && (this.substring(1 until this.length-1).isPalindrome())
}

fun main(args: Array<String>) {	
	var result: ArrayList<String> = ArrayList()
	var maxLen: Int = -1
	File(wordlist).forEachLine {
		x ->
		if (x.sanitize().isPalindrome()) {
			if (x.length > maxLen) {
				result = ArrayList()
				maxLen = x.length
			}
			if (x.length == maxLen) {
				result.add(x)
			}
		}
	}
	println(result)
}
```

```
[essayasse, ressasser]
```