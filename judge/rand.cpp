#include <bits/stdc++.h>
using namespace std;

//此文件用于生成数据

typedef long long LL;
int MAX_T = 5;      //多组输入时的最大组数
int MAX_N = 10;
int MAX_M = 5;
int MAX_AI = 1e4;
int T, N, M, K;

//生成[x, y]范围的整数
inline int random(int x, int y) {
    return rand()%(y-x+1)+x;
}

int main() {
    unsigned int tm = (unsigned)time(NULL);
    srand(tm);

    //write your code here~

/*  例子: 第一行样例组数T, 每组包含两行, 第一行为N, 第二行N个数一空格分隔
    T = random(1, MAX_T);
    //T = MAX_T;
    printf("%d\n", T);
    while(T --) {
        N = random(1,MAX_N);
        //N = MAX_N;
        printf("%d\n",N);

        for(int i = 0; i < N; i++) {
            int x = random(1, MAX_AI);
            printf("%d%c", x, " \n"[i==N-1]);
        }

    }
*/
    return 0;
}