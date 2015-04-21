#include<bits/stdc++.h>
using namespace std;
#define pb push_back
#define mp make_pair
#define clr(x) x.clear()
#define sz(x) ((int)(x).size())
#define F first
#define S second
#define REP(i,a,b) for(i=a;i<b;i++)
#define rep(i,b) for(i=0;i<b;i++)
#define rep1(i,b) for(i=1;i<=b;i++)
#define pdn(n) printf("%d\n",n)
#define sl(n) scanf("%lld",&n)
#define sd(n) scanf("%d",&n)
#define pn printf("\n")
typedef pair<int,int> PII;
typedef vector<PII> VPII;
typedef vector<int> VI;
typedef vector<VI> VVI;
typedef long long LL;
#define MOD 1000000007
#define LIMIT 100000
#define debug printf("THIS IS THE %d\n",__LINE__) 
#define MASK (1<<16) - 1

inline void readint(int *var)
{
    register char ch=0;
    *var=0;
    while (ch<33)
        ch=getchar_unlocked();
    //Consider only numerals
    while (ch>47 && ch<58)
    {
        *var=(*var * 10) + (ch-'0');
        ch=getchar_unlocked();
    }
}
