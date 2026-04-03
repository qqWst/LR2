package main

import (
	"fmt"
)

func main() {
	var N, V int
	fmt.Print("Enter N: ")
	fmt.Scan(&N)
	fmt.Print("Enter V: ")
	fmt.Scan(&V)
	if V < 0 || N < 0 {
		fmt.Print("V and N should be positive!!!")
		return
	}
	R := make([]int, N-1)
	fmt.Print("Enter R's:\n")
	for i := 0; i < (N - 1); i++ {
		fmt.Printf("%d - ", i+1)
		fmt.Scan(&R[i])
		if R[i] < 0 {
			fmt.Print("Elements should be positive!!!")
			return
		}
	}
	fmt.Print(spaceship(V, R))
}

func spaceship(fullFuel int, distances []int) int {
	var currentFuel int = fullFuel
	var refills int = 0
	for i := 0; i < len(distances); i++ {
		if distances[i] > fullFuel {
			return 0
		}
		if currentFuel < distances[i] {
			currentFuel = fullFuel
			refills++
		}
		currentFuel -= distances[i]
	}
	return refills
}
