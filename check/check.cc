// 此文件用于检查答案

#include <bits/stdc++.h>
using namespace std;
using ll = long long;

int main() {
    std::ifstream input_ifs, output_ifs;

    // 读取题目输入
    input_ifs.open("data.in", std::ifstream::in);
    int sum;
    input_ifs >> sum;
    input_ifs.close();

    // 读取代码输出
    output_ifs.open("data.out", std::ifstream::in);
    int a, b;
    output_ifs >> a >> b;
    output_ifs.close();

    std::cout << "input:" << std::endl
              << "sum = " << sum << std::endl << std::endl;
    std::cout << "output:" << std::endl
              << "a = " << a << " b = " << b << std::endl << std::endl;

    std::cout << "Check log:" << std::endl;
    // 检查答案是否合法
    if (a + b == sum) {
        std::cout << "Yes: " << a << " + " << b << " = " << sum << std::endl;
    } else {
        std::cout << "No: " << a << " + " << b << " != " << sum << std::endl;
        return 1;   // Note: 必须返回非 0 值以终止对拍
    }

    return 0;
}