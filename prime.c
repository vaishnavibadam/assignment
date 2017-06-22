#include<stdio.h>
void main()
{
int c=0,i,j;
for(i=2;i<=600;i++)
{
	for(j=2;j<=i/2;j++)
	{
		if((i%j)==0)
		c++;
	}
	if(c==0)
	printf("%d \n",i);
c=0;
}

}
