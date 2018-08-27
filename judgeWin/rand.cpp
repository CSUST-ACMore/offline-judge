#include<bits/stdc++.h>
using namespace std;
#define random(a,b) ((a)+rand()%((b)-(a)+1))
stringstream ss;

int T = 1;

int main( int argc, char *argv[] ) {
    int seed=time(NULL);
    if(argc > 1) {
        ss.clear();
        ss<<argv[1];
    }
    srand(seed);

    while ( T --) {
        int N = random(1,10);
        int M = random(1,5);
        printf("%d %d\n", M, N);
        for(int i = 1; i <= N; i++) {
            int t = random(1, 10000);
            int lv = random(1,5);
            int k = random(0,3);
            printf("%d %d %d\n", t, lv, k);
            while(k --) {
                int id=random(2,N);
                while(id==i) id=random(2,N);
                printf("%d %d\n", id, random(1,t));
            }
        }
    }

    return 0;
}