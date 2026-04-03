/* (Космический корабль) Космический корабль должен пролететь
через N планет, расположенных на одной линии. Известны расстояния между
последовательными планетами – R (в миллионах километров). Корабль
расходует 1 литр топлива на 1 миллион км.
У корабля есть ёмкость топливного бака – V литров; на старте бак
полностью заправлен, на каждой планете можно дозаправиться.
Необходимо определить минимальное количество дозаправок, чтобы
достичь последней планеты; если это невозможно – вывести 0.
Пример 1: N = 5, V = 10, R: 4 3 5 2, Результат: 1
Пример 2: N = 4, V = 5, R: 3 4 2, Результат: 2
Пример 3: N = 3, V = 4, R: 5 2 1, Результат: 0 */

#include <iostream>
#include <vector>

using namespace :: std;

int spaceship(int fullFuel, vector<int> distances) {
    int currentFuel = fullFuel;
    int refills = 0;
    for (int i = 0; i < distances.size(); ++i) {
        if (distances[i] > fullFuel) return 0;
        if (currentFuel < distances[i]) {
            currentFuel = fullFuel;
            refills++;
        }
        currentFuel -= distances[i]; 
    }
    return refills;
}

int main() {
    int N, V;
    cout << "Enter N: ";
    cin >> N;
    cout << "Enter V: ";
    cin >> V;
    if (N < 0 || V < 0) {
        cout << "N and V should be positive!!!" << endl;
        return 0;
    }
    vector<int> R(N - 1);
    cout << "Enter R: " << endl;
    for (size_t i = 0; i < R.size(); ++i) {
        cout << (i + 1) << " - ";
        cin >> R[i];
        if (R[i] < 0) {
            cout << "R's should be positive!!!" << endl;
            return 0;
        }
    }
    cout << spaceship(V, R);
    return 0;
}