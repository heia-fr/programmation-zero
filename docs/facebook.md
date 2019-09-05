# Facebook sticker

<center>
<img src="../images/facebook-logo.jpg">
</center>

Vous recevez une pile de stickers «Facebook» (auto-collants) et une paire de ciseaux.
Avec les ciseaux, vous découpez les lettres des stickers et avec ces lettres vous pouvez
composer de nouveaux mots ou des phrases. On peut par exemple écrire «efface» avec 2
stickers ou «baobab» avec 3 stickers.

Ecrivez un programme qui calcule le nombre de stickers nécessaire pour écrire un mot
ou une phrase donnée.

!!! question "Question"
    Que pourrait retourner la fonction s'il n'y a pas de solution ?

Pour ce problème, on utilisera de préférence une structure de donnée de type «map» (ou «hashmap»).
Cette structure permet d'associer une **valeur** à une **clé** donnée. Dans le cas qui nous
intéresse, nous allons utiliser cette structure pour compter les occurrences des différentes
lettres dans le sticker et dans le texte.


``` kotlin
HashMap<Char, Int>
```

Ensuite on pend toutes les lettres du texte et on regarde si on trouve cette même lettre dans
le sticker. Si c'est le cas, on calcule le nombre de stickers nécessaire pour cette lettre.
Pour terminer, on prend la valeur maximale pour toutes les lettres et ça nous donne la réponse.

Voici une première solution :

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
        result = maxOf(
            result,
            (i.value + sm.get(i.key)!! - 1) / sm.get(i.key)!!)
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

Ce programme calcule le nombre de stickers «Facebook» nécessaire pour écrire le
texte «Coffee Kebab». En exécutant ce programme, on obtient la réponse suivante: 

```
You need 2 stickers.
```

Mais cette réponse est fausse, car il faut en fait 3 stickers!

!!! question "Question"
    Trouvez le «bug» dans le programme ci-dessus

Le «bug» provient du fait que le programmeur a fait du «copier-coller» et
a oublié de modifier le code copié.

!!! tip "Conseil"
    Evitez de faire du «copier-coller» en écrivant du code.

Une autre source d'erreur est le mauvais choix des noms des variables. En
effet, ce n'est pas facile de comprendre ce que signifient `sm`et `tm`.

Voici une nouvelle version qui corrige ces erreurs:

``` kotlin
fun textToMap(text: String): HashMap<Char, Int> {
    val result = HashMap<Char, Int>()
    for (c in text.toLowerCase()) {
        if (c.isLetter()) {
            result[c] = result.getOrDefault(c, 0) + 1
        }
    }
    return result
}

fun solve(sticker: String, text: String): Int {
    val stickerCharMap = textToMap(sticker)
    val textCharMap = textToMap(text)
    var result = 0
    for (i in textCharMap.entries) {
        if (!stickerCharMap.containsKey(i.key)) {
            return 0
        }
        result = maxOf(
            result,
            (i.value + stickerCharMap.get(i.key)!! - 1) / stickerCharMap.get(i.key)!!)
    }
    return result
}

fun main(args: Array<String>) {
    val n = solve("facebook", "coffee kebab")
    if (n == 0) {
        println("Impossible.")
    } else {
        println("You need $n stickers.")
    }
}
```

Cette version est bien meilleure. Il n'y a plus de code dupliqué et le nom des variables est bien mieux choisi.

Une étape supplémentaire serait d'**encapsuler** les fonctionnalités d'un sticker dans une classe:

``` kotlin
class Sticker(text: String) {
    val stickerCharMap: HashMap<Char, Int>

    companion object {
        fun textToMap(text: String): HashMap<Char, Int> {
            val result = HashMap<Char, Int>()
            for (c in text.toLowerCase()) {
                if (c.isLetter()) {
                    result[c] = result.getOrDefault(c, 0) + 1
                }
            }
            return result
        }
    }

    init {
        this.stickerCharMap = textToMap(text)
    }

    fun solve(text: String): Int {
        val textCharMap: HashMap<Char, Int> = textToMap(text)
        var result = 0
        for (i in textCharMap.entries) {
            if (!this.stickerCharMap.containsKey(i.key)) {
                return 0
            }
            result = maxOf(
                result,
                (i.value + stickerCharMap.get(i.key)!! - 1) / stickerCharMap.get(i.key)!!)
        }
        return result
    }

}

fun main(args: Array<String>) {
    val sticker = Sticker("facebook")
    val n = sticker.solve("coffee kebab")
    if (n == 0) {
        println("Impossible.")
    } else {
        println("You need $n stickers.")
    }
}
```
