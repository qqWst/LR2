def spaceship(fullFuel, distances):
	currentFuel = fullFuel
	refills = 0
	for i in range(len(distances)):
		if distances[i] > fullFuel: return 0
		if currentFuel < distances[i]:
			currentFuel = fullFuel
			refills += 1
		currentFuel -= distances[i]
	return refills

def main():
    N = int(input("Enter N: "))
    V = int(input("Enter V: "))
    if N < 0 or V < 0: 
        print("N and V should be positive!!!")
        return
    R = [0] * (N - 1)
    print("Enter R's:")
    for i in range(N - 1):
        R[i] = int(input("1 - "))
        if R[i] < 0: 
              print("R's should be positive!!!")
              return
    print(spaceship(V, R))
    return

main()