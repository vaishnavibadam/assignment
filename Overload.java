import java.util.*;
class Overload
{
public static void main(String args[])
{
	Sample s=new Sample();
	s.samp(1);
	s.samp(2,3);
}
}
class Sample
{
void samp(int a)
{
	System.out.println(a);
}
void samp(int a,int b)
{
	System.out.println(a+" "+b);
}

} 
