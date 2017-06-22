#include<stdio.h>
void main()
{
int b,i,rem,rev=0,n;
printf("enter a number to which you want to find nearest palindrome \n");
scanf("%d",&n);
for(i=n-1;i>=1;i--)
{
	b=i;
	while(i!=0)
	{
		rem=i%10;
		i=i/10;
		rev=(rev*10)+rem;
	}
	
	if(rev==b)
	{
		printf("%d",b);
		break;
	}i=b;rem=0;rev=0;
	
}

}















