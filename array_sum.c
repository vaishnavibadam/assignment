#include<stdio.h>                                                              
void main()
{
int i,n,b=0;
printf("enter size of array");
scanf("%d",&n);
int a[n];
printf("enter elements to be pushed into array");
for(i=0;i<n;i++)
{
	scanf("%d",&a[i]);
}
for(i=0;i<n;i++)
{
b=b+a[i];
}
printf("sum of array elements %d",b);
}
