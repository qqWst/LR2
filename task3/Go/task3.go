package main

import (
	"fmt"
)

func main() {
	var N int
	fmt.Print("Enter N: ")
	fmt.Scan(&N)
	if N < 0 {
		fmt.Print("N should be positive!!!")
		return
	}
	numbers := make([]int, N)
	fmt.Print("Enter numbers:\n")
	for i := 0; i < N; i++ {
		fmt.Printf("%d - ", i+1)
		fmt.Scan(&numbers[i])
		if numbers[i] < 0 {
			fmt.Print("Numbers should be positive!!!")
			return
		}
	}
	fmt.Println(palindromesInArray(numbers))
}

func isPalindrome(number int) bool {
	var cpnum int = number
	var reverseNumber int = 0
	for number > 0 {
		reverseNumber = reverseNumber*10 + number%10
		number /= 10
	}
	return reverseNumber == cpnum
}

func palindromesInArray(numbers []int) []string {
	result := make([]string, len(numbers))
	for i := 0; i < len(numbers); i++ {
		if isPalindrome(numbers[i]) && numbers[i] < 1000 && numbers[i] > 99 {
			result[i] = "Yes"
		} else if !isPalindrome(numbers[i]) && numbers[i] < 1000 && numbers[i] > 99 {
			result[i] = "No"
		} else {
			result[i] = "-"
		}
	}
	return result
}
