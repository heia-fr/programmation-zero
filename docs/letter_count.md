# Compter les lettres

``` kotlin
import java.io.File

fun main(args: Array<String>) {
	
	var stat: HashMap<Char, Int> = HashMap<Char, Int>()
	
	fun addLine(s: String): Unit {
		for (c in s.toLowerCase()) {
			if (c.isLetter()) {
				stat.set(c, stat.getOrDefault(c, 0) + 1)
			}
		}
	}
	
	File("data/french.txt").forEachLine {
		x -> addLine(x)
	}
	
	for (i in stat.asSequence().sortedByDescending { x -> x.value }) {
		println(i)
	}
}
```

```
e=482804
s=336475
a=319967
i=311653
r=284784
n=244276
t=226481
o=193565
l=130787
u=118335
c=111067
m=83204
p=76975
d=76842
g=51896
b=45283
f=43443
h=37666
z=35389
v=31186
q=16534
y=11235
x=8288
j=5750
k=1673
w=537
```

  
