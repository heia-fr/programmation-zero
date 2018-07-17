# Besoin de plus d'argent ?


``` kotlin
internal class puzzle(private val operands: Array<String>,
                      private val result: String) {

    private fun isValidSolution(mapping: IntArray): Boolean {
        var sum = 0
        for (a in this.operands) {
            val n = verbToInt(a, mapping)
            if (n < 0) return false
            sum += n
        }
        val n = verbToInt(this.result, mapping)
        return if (n < 0) false else sum == n
    }

    private fun recursiveSolve(letters: CharArray, letterIndex: Int,
                               digits: BooleanArray, mapping: IntArray) {
        if (letterIndex >= letters.size) {
            if (this.isValidSolution(mapping)) {
                System.out.printf("Found   %s%n", this.solutionString(mapping))
            }
        } else {
            for (i in digits.indices) {
                if (digits[i]) {
                    mapping[letters[letterIndex] - FIRST_LETTER] = i
                    digits[i] = false
                    this.recursiveSolve(letters, letterIndex+1, digits, mapping)
                    digits[i] = true // backtracking
                }
            }
        }
    }

    fun solve() {
        System.out.printf("Solving %s%n", this)
        // Build a set with all letters
        val lettersSet = BooleanArray(NUMBER_OF_LETTERS)
        for (op in this.operands) {
            for (i in 0 until op.length) {
                lettersSet[op[i] - FIRST_LETTER] = true
            }
        }
        for (i in 0 until this.result.length) {
            lettersSet[this.result[i] - FIRST_LETTER] = true

        }

        // Build the list of all letters
        var letterCount = 0
        for (b in lettersSet) {
            if (b) letterCount++
        }
        if (letterCount > NUMBER_OF_DIGITS) {
            throw IllegalArgumentException()
        }
        val letters = CharArray(letterCount)
        run {
            var i = 0
            var j = 0
            while (j < lettersSet.size) {
                if (lettersSet[j]) {
                    letters[i++] = (j + FIRST_LETTER.toInt()).toChar()
                }
                j++
            }
        }

        // Build the set of all digits
        val digits = BooleanArray(NUMBER_OF_DIGITS)
        for (i in 0 until NUMBER_OF_DIGITS) {
            digits[i] = true
        }

        // create an empty mapping and solve
        val mapping = IntArray(NUMBER_OF_LETTERS)
        recursiveSolve(letters, 0, digits, mapping)
    }


    fun solutionString(mapping: IntArray): String {
        val args = arrayOfNulls<String>(this.operands.size)
        for (i in this.operands.indices) {
            args[i] = verbToInt(this.operands[i], mapping).toString()
        }
        return args.joinToString(" + ") +
                " = " + verbToInt(this.result, mapping).toString()
    }

    override fun toString(): String {
        return this.operands.joinToString(" + ") + " = " + this.result
    }

    companion object {

        private val NUMBER_OF_DIGITS = 10
        private val NUMBER_OF_LETTERS = 26
        private val FIRST_LETTER = 'A'

        private fun verbToInt(verb: String, mapping: IntArray): Int {
            if (mapping[verb[0] - FIRST_LETTER] == 0) {
                return -1 // a number can't start with zero
            }
            var result = 0
            for (i in 0 until verb.length) {
                result = result * NUMBER_OF_DIGITS +
                mapping[verb[i] - FIRST_LETTER]
            }
            return result
        }
    }

}
```

``` kotlin
fun main(args: Array<String>) {
    puzzle(arrayOf("SEND", "MORE"), "MONEY").solve()
    puzzle(arrayOf("SOLEIL", "SABLE"), "BIKINI").solve()
    puzzle(arrayOf("ONE", "ONE", "ONE", "ONE"), "TEN").solve()
}
```

```
Solving SEND + MORE = MONEY
Found   9567 + 1085 = 10652
Solving SOLEIL + SABLE = BIKINI
Found   496736 + 41567 = 538303
Solving ONE + ONE + ONE + ONE = TEN
Found   182 + 182 + 182 + 182 = 728
```

