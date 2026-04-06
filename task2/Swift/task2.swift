import Foundation

func spaceship(fullFuel: Int, distances: [Int]) -> Int {
    var currentFuel = fullFuel
    var refills = 0
    for distance in distances {
        if distance > fullFuel {
            return 0
        }
        if currentFuel < distance {
            currentFuel = fullFuel
            refills += 1
        }
        currentFuel -= distance
    }
    return refills
}

// Ввод данных
print("Enter N: ", terminator: "")
guard let nInput = readLine(), let N = Int(nInput) else {
    print("Invalid input")
    exit(0)
}

print("Enter V: ", terminator: "")
guard let vInput = readLine(), let V = Int(vInput) else {
    print("Invalid input")
    exit(0)
}

if N < 0 || V < 0 {
    print("N and V should be positive!!!")
    exit(0)
}

var R: [Int] = []

print("Enter R:")
for i in 0..<(N - 1) {
    print("\(i + 1) - ", terminator: "")
    guard let input = readLine(), let value = Int(input) else {
        print("Invalid input")
        exit(0)
    }
    
    if value < 0 {
        print("R's should be positive!!!")
        exit(0)
    }
    
    R.append(value)
}

// Вывод результата
let result = spaceship(fullFuel: V, distances: R)
print(result)