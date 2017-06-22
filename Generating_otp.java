import java.util.*;
class Generating_otp
{
public static void main(String args[]) 
{
String capital="ABCDEFGHIJKLMNOPQRSTUVWXYZ",small="abcdefghijklmnopqrstuvwxyz",num="0123456789";
String value=capital+small+num;
Random rm=new Random();
char[] otp=new char[6];
for(int i=0;i<6;i++)
{
	otp[i]=value.charAt(rm.nextInt(value.length()));
	System.out.print(otp[i]);
}
}
}
