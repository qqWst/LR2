function isPrime(num) {
    if (num <= 1) return false;
    for (let i = 2; i <= Math.sqrt(num); i++) {
        if (num % i === 0) return false;
    }
    return true;
}

function closestPrimeNumber(num) {
    if (isPrime(num)) return 0;
    let i = 1;
    while (true) {
        if (isPrime(num - i) || isPrime(num + i)) return i;
        i++;
    }
}

// Ввод (Node.js)
const readline = require('readline').createInterface({
    input: process.stdin,
    output: process.stdout
});

readline.question("Enter an integer: ", (input) => {
    const N = parseInt(input);
    console.log(closestPrimeNumber(N));
    readline.close();
});
