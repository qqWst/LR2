#include <iostream>
#include <math.h>
using namespace :: std;

bool isPrime(int num) {
    if (num <= 1) return false; // Числа меньше или равные 1 не являются простыми.
    for (int i = 2; i <= sqrt(num); ++i) {
        if (num % i == 0) return false;
    }
    return true;
}

int closestPrimeNumber(int num) {
    if (isPrime(num)) return 0;
    for (int i = 1; ; ++i) {
        if (isPrime(num - i) || isPrime(num + i)) return i;
    }
}

int main() {
    int N;
    cout << "Enter an integer: ";
    cin >> N;
    cout << closestPrimeNumber(N) << endl;
    return 0;
}