package main

import (
	"fmt"
)

func main() {
	var N int
	fmt.Print("Enter N: ")
	fmt.Scan(&N)
	fmt.Print(closestPrimeNumber(N))
}

func isPrime(num int) bool {
	if num <= 1 {
		return false
	} // Числа меньше или равные 1 не являются простыми.
	for i := 2; i <= num/2; i++ {
		if num%i == 0 {
			return false
		}
	}
	return true
}

func closestPrimeNumber(num int) int {
	if isPrime(num) {
		return 0
	}
	for i := 1; ; i++ {
		if isPrime(num-i) || isPrime(num+i) {
			return i
		}
	}
}
