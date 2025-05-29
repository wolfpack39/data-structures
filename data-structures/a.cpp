#include <iostream>
using namespace std;

double* geometric_growth(void) {
    static double grows = 0.1;
    grows += 1.1;
    return &grows;
}

int main() {

    string str = "hello";
    char s[5];

    str.copy(s, sizeof(s));

    for (int i = 0; i < str.length(); i++) {
        cout << s[i] << endl;
    }

    int x = 5;

    cout << sizeof(x) << endl;

    return 0;

}

