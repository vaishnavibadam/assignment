#include<stdio.h>                                                              
void main()
{
int i,n,b,k,j;
printf("enter size of array");
scanf("%d",&n);
int a[n];
printf("enter elements to be pushed into array");
for(i=0;i<n;i++)
{
	scanf("%d",&a[i]);
}
printf("enter element to be deleted");
scanf("%d",&b);
for(i=0;i<n;i++)
{
	if(a[i]==b)
	{
		for(k=i;k<n;k++)
		{
			j=k+1;
			a[k]=a[j];
			
		}
		n=n-1;
	}		
}
for(i=0;i<n;i++)
{
	printf("%d ",a[i]);
}
}
