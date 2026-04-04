//kotlin task1.kt -include-runtime -d task1.jar
//java -jar task1.jar
import kotlin.math.sqrt

fun isPrime(num: Int): Boolean {
    if (num <= 1) return false
    for (i in 2..sqrt(num.toDouble()).toInt()) {
        if (num % i == 0) return false
    }
    return true
}

fun closestPrimeNumber(num: Int): Int {
    if (isPrime(num)) return 0
    var i = 1
    while (true) {
        if (isPrime(num - i) || isPrime(num + i)) return i
        i++
    }
}

fun main() {
    print("Enter an integer: ")
    val N = readLine()!!.toInt()
    println(closestPrimeNumber(N))
}
