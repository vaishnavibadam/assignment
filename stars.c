#include<stdio.h>
void main()
{
int i,j,c,k=1;
for(i=1;i<=5;i++)
{
	if(i<=3)
	{
		c=1;
		
		for(j=1;j<=k;j++)
		{
			printf("*");
			c++;		
		}
		k=k+2;
	}
	else
	{
		for(j=1;j<=c-3;j++)
		{
			printf("*");				
		}		
		c=c-2;	
	}
printf("\n");
}
}
