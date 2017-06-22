#include<stdio.h>
void main()
{
int i=5,a[10]={1,2,3,4,5},j,b[5]={6,7,8,9,0};
printf("Array Elements of first array:1 2 3 4 5 \nArray Elements of Second array:6 7 8 9 0");
for(j=0;j<=4;j++)
{
	a[i]=b[j];
	i++;
}
printf("\nElements after merging array:");
for(i=0;i<10;i++)
{
	printf("%d ",a[i]);
}
}
