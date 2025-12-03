package com.example;

import java.lang.reflect.Array;
import java.util.Arrays;
import java.util.PrimitiveIterator.OfInt;
import java.util.Spliterator;

public class ProgramTest1 {

String s=new String();

	public static void main(String args[])
	{
	System.out.println("working ");
	
	 int []  arr = {10,5,10,4, 20,3,50, 40};
	 
	 int smallest=arr[0];
	 int secondSmallest=arr[0];
	 
	 for(int i=0;i<arr.length;i++)
	 {
		 if(smallest>arr[i])
		 {
			 smallest=arr[i];
		 }
	 }
       for(int i=0 ; i<arr.length;i++)
       {
    	   if(secondSmallest>arr[i] && smallest!=arr[i])
    	   {
    		   secondSmallest=arr[i];
    	   }
       }
	System.out.println("second smallest:" + secondSmallest); 
  
}
}
