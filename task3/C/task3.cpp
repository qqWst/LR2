/* На вход подаётся N натуральных чисел, для каждого трёхзначного
числа определить, является ли оно палиндромом (читается одинаково с любой
стороны).
Пример 1: N = 4, 101 456 707 213, Результат: Yes No Yes No
Пример 2: N = 3, 1221 676 33, Результат: - Yes - */

#include <iostream>
#include <vector>

using namespace :: std;

bool isPalindrome(int number) { 
    int cpnum = number;
    int reverseNumber = 0;
    while (number){
        reverseNumber = reverseNumber * 10 + number % 10;
        number /= 10;
    }
     return reverseNumber == cpnum;
}

vector<string> palindromesInArray(vector<int> numbers) {
    vector<string> result;
    for (size_t i = 0; i < numbers.size(); ++i) {
        if (isPalindrome(numbers[i]) && numbers[i] < 1000 && numbers[i] > 99) result.push_back("Yes");
        else if (!isPalindrome(numbers[i]) && numbers[i] < 1000 && numbers[i] > 99) result.push_back("No");
        else result.push_back("-");
    }
    return result;
}

template <typename T>
void display(vector<T> v) { //функция вывода вектора
    for (size_t i = 0; i < v.size(); ++i) {
        cout << v[i] << " ";
    }
}

int main() {
    int N;
    cout << "Enter N: ";
    cin >> N;
    if (N < 0) {
        cout << "N should be positive!!!" << endl;
        return 0;
    }
    vector<int> numbers(N);
    cout << "Enter numbers: " << endl;
    for (size_t i = 0; i < N; ++i) {
        cout << (i + 1) << " - ";
        cin >> numbers[i];
        if (numbers[i] < 0){
            cout << "Number should be positive!!!" << endl;
            return 0;
        }
    }
    display(palindromesInArray(numbers));
    return 0;
}