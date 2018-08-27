#include<cstdio>
#include<cstring>
#include<algorithm>
using namespace std;

const int maxn = 110;
const int INF = 200000000;

int w[maxn][maxn]; //w[i][j]表示物品i换j的花费
int dist[maxn]; //dist[i]表示起点到i的花费
bool vis[maxn];

int level[maxn], value[maxn]; //等级与价值
bool can_change[maxn]; //满足等级限制的标记数组
int limit_level, n; //limit_level 表示限制的等级

int Dijkstra()
{
    int mini_cost = INF;
    memset(vis,false,sizeof(vis)); //清除所有点的标号
    for(int i=1;i<=n;i++)
        dist[i] = INF; //设d[1] = 0,其它为 INF
    dist[1] = 0; //（此处还未加上进入改点的花费）自己换自己为0

    for(int i=1;i<=n;i++) //循环n 次
    {
        int x, m = INF;
        for(int y=1;y<=n;y++)
        { //在所有未标号且满足等级限制的点中选出 d值最小的点 x
            if(!vis[y] && dist[y] <= m && can_change[y])
                m = dist[x=y];
        }
        vis[x] = true; //标记点x

        for(int y=1;y<=n;y++) // 对于从x出发的所有边 (x, y)更新dist
        {
            if(can_change[y]) //若满足等级限制
                dist[y] = min(dist[y], dist[x]+w[x][y]);
        }
    }

    for(int y=1;y<=n;y++)
    { //对于每个dist[y]还要满足进入改点的花费
        dist[y] += value[y];
        mini_cost = min(mini_cost,dist[y]);
    }

    return mini_cost; //返回最小值
}
int main()
{
    scanf("%d%d", &limit_level, &n);

    for(int i=1;i<=n;i++)
    {
        for(int j=1;j<=n;j++)
        {
            if(i==j) w[i][j] = 0; //从自己到自己花费为0
            else w[i][j] = INF;
        }
    }

    for(int i=1;i<=n;i++)
    {
        int change;
        scanf("%d%d%d", &value[i], &level[i], &change);
        for(int j=1;j<=change;j++)
        {
            int y,Value;
            scanf("%d%d", &y, &Value);
            w[i][y] = Value;
        }
    }

    int King_level = level[1]; //酋长的等级
    int m, minicost = INF;

    for(int i=0;i<=limit_level;i++) //枚举
    {
        memset(can_change,false,sizeof(can_change));
        for(int j=1;j<=n;j++)
        { //枚举等级允许的范围
            if(level[j] >=King_level-limit_level+i && level[j]<=King_level+i)
                can_change[j] = true;
        }

        minicost = min(minicost, Dijkstra());
    }
    printf("%d\n",minicost);
    return 0;
}
