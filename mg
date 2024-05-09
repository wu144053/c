#include<stdio.h>
#include<malloc.h>
#define MaxSize 100
int mg[10][10];
void Mg(int M, int N)
 	{
    int mgtemp[10][10] = {
        {1, 1, 1, 1, 1, 1, 1, 1, 1, 1},
        {1, 0, 0, 1, 0, 0, 0, 1, 0, 1},
        {1, 0, 0, 1, 0, 0, 0, 1, 0, 1},
        {1, 0, 0, 0, 0, 1, 1, 0, 0, 1},
        {1, 0, 1, 1, 1, 0, 0, 0, 0, 1},
        {1, 0, 0, 0, 1, 0, 0, 0, 0, 1},
        {1, 0, 1, 0, 0, 0, 1, 0, 0, 1},
        {1, 0, 1, 1, 1, 0, 1, 1, 0, 1},
        {1, 1, 0, 0, 0, 0, 0, 0, 0, 1},
        {1, 1, 1, 1, 1, 1, 1, 1, 1, 1},
    };
    for (int i = 0; i < M; i++) 
	{
        for (int j = 0; j < N; j++)
		{
            mg[i][j] = mgtemp[i][j];
        }
    }
}
typedef struct //????????Box 
{
	int i;//???? 
	int j;//???? 
	int di;//???? 
}Box;
typedef struct //???????? 
{
	Box date[MaxSize];
	int top;	
}StType;
void InitStack(StType *&s)//?????????? 
{
	s=(StType *)malloc(sizeof(StType));
	s->top=-1;
}
bool Push(StType *&s,Box e)//??? 
{
	if (s->top==MaxSize-1)
	return false;
	s->top++;
	s->date[s->top]=e;
	return true;	
}	
bool  GetTop(StType *s,Box &e)//????????? 
{
	if(s->top==-1)
	return false;
	e=s->date[s->top];
	return true;
}
bool Pop(StType *&s,Box &e)//????????? 
{
	if(s->top==-1)
	return false;
	e=s->date[s->top];
	s->top--;
	return true;
}
void DestoryStack(StType *&s)//????? 
{
	s->top=-1;
	free (s);
}
bool StackEmpty(StType *s)//?ж???? 
{
	return (s->top==-1);
}
bool mgpath(int xi,int yi,int xe ,int ye)
{
	int i,j,il,jl,k,di=-1;//di???????? 
	bool find;	
	Box path[MaxSize],e;
	StType *st;
	InitStack(st); 
	e.i=xi;e.j=yi;e.di=-1;
	Push(st,e);//??????? 
	mg[xi][yi]=-1;//?????????-1??????? 
	while(!StackEmpty(st))
	{
		GetTop(st,e);//????????? 
		i=e.i;j=e.j;di=e.di;
		if(i==xe&&j==ye)// ?????? 
		{
			printf("??????·?????￡?\n");
			k=0;
			while (!StackEmpty(st))
			{
				Pop(st,e);//????????? 
				path[k++]=e;
			}
			while (k>0)//???path???? 
			{
				printf("\t(%d,%d)",path[k-1].i,path[k-1].j);
				if((k+1)%5==0)
				printf("\n");
				k--;
			}
			printf("\n");
		DestoryStack(st);
			return true;
		}	
		find=false;
		while(di<4&&!find)
		{ 
			di++;
			switch(di)
			{
				case 0:il=i-1;jl=j;break;
				case 1:il=i;jl=j+1;break;
				case 2:il=i+1;jl=j;break;
				case 3:il=i;jl=j-1;break;
			} 
			if(mg[il][jl]==0)
			{
			find=true;
			}
		}
			if(find)
			{	
				st->date[st->top].di=di;
				e.i=il;e.j=jl;e.di=-1;
				Push(st,e);
				mg[il][jl]=-1;
			}
			else
			{
				Pop(st ,e);
				mg[e.i][e.j]=0;
			}
	}
	DestoryStack(st);
	return false; 
}
int main()
{
	Mg(10,10);
	int xi=1,yi=1,xe=8,ye=8;//????mg[1][1] ?????mg[8][8] 
	mgpath( xi, yi, xe,ye);
}
