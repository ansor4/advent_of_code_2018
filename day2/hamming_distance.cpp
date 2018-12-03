#include <iostream>
#include <fstream>
#include <vector>
#include <sstream>

using namespace std;

int hamming_distance(string s1, string s2) {
    int sum = 0;
    for (int i = 0; i < s1.length(); i++) {
        sum += (s1[i] == s2[i]) ? 0 : 1;
    }
    return sum;
}

int main() {

    ifstream ifs("input");

    string s;
    vector<string> lines;
    while (ifs >> s) {
        lines.push_back(s);
    }

    string correct_id1, correct_id2;

    for (int i = 0; i < lines.size(); i++) {
        for (int j = i; j < lines.size(); j++) {
            if (hamming_distance(lines[i], lines[j]) == 1) {
                correct_id1 = lines[i];
                correct_id2 = lines[j];
                break;
            }
        }
    }

    stringstream ss("");
    for (int i = 0; i < correct_id1.length(); i++) {
        if (correct_id1[i] != correct_id2[i]) { continue; }
        ss << correct_id1[i];
    }

    cout << ss.str() << endl;

    return 0;

}
