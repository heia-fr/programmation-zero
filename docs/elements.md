# Les éléments chimiques

<center>
<img src="../images/Periodic_table_large.jpg">
</center>

``` kotlin
import java.io.File

const val elementsFile = "data/elements.csv"
const val wordlist = "data/words.txt"

data class Element(val symbol: String, val name: String, val number: Int) {
    override fun toString(): String {
        return "%s(%d/%s)".format(symbol, number, name)
    }
}

fun readElements(): ArrayList<Element> {
    val result = ArrayList<Element>()
    File(elementsFile).forEachLine { x -> val t = x.split(','); result.add(Element(t[2], t[1], t[0].toInt())) }
    return result
}

fun convertRec(text: String, prefix: List<Element>, solutions: ArrayList<String>, elements: List<Element>) {
    if (text == "") {
        solutions.add(prefix.map { e -> e.toString() }.joinToString())
    } else {
        for (i in elements.filter { (symbol) -> text.startsWith(symbol, ignoreCase = true) }) {
            convertRec(text.drop(i.symbol.length), prefix.plus(i), solutions, elements)
        }
    }
}

fun convert(text: String, elements: List<Element>): List<String> {
    val result = ArrayList<String>()
    convertRec(text, ArrayList<Element>(), result, elements)
    return result
}


fun main(args: Array<String>) {
    val elements = readElements()
    var max = 0
    val solution = ArrayList<String>()

    val p = convert("Nicolas", elements)
    for (i in p) {
        println(i)
    }

    File(wordlist).forEachLine {
        x ->
        val t = convert(x, elements)
        if (t.size == 1) {
            if (x.length > max) {
                max = x.length
                solution.clear()
            }
            if (x.length == max) {
                solution.add(x)
            }
        }
    }
    for (w in solution) {
        println("%s -> %s".format(w, convert(w, elements).first()))
    }
}
```

```
N(7/Azote), I(53/Iode), C(6/Carbone), O(8/Oxygène), La(57/Lanthane), S(16/Soufre)
N(7/Azote), I(53/Iode), Co(27/Cobalt), La(57/Lanthane), S(16/Soufre)
Ni(28/Nickel), C(6/Carbone), O(8/Oxygène), La(57/Lanthane), S(16/Soufre)
Ni(28/Nickel), Co(27/Cobalt), La(57/Lanthane), S(16/Soufre)
ornithogeographical -> O(8/Oxygène), Rn(86/Radon), I(53/Iode), ...
saccharofarinaceous -> S(16/Soufre), Ac(89/Actinium), C(6/Carbone), ...
underrepresentation -> U(92/Uranium), Nd(60/Néodyme), Er(68/Erbium), ...
```
