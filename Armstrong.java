import java.util.*;
class Armstrong
{
public static void main(String args[])
{
int a,b;
double rem=0,sum=0;
System.out.println("enter number");
Scanner sc=new Scanner(System.in);
a=sc.nextInt();
b=a;
while(a!=0)
{
	rem=a%10;
	sum=sum+(Math.pow(rem,3));
	a=a/10;
}
if((int)sum==b)
	System.out.println("number is armstrong");
else
	System.out.println("not armstrong number");
}


}
