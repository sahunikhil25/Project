package com.example;

import java.util.Arrays;

public class CombineArray {

	public static void main(String args[])
	{
		int arr1[]= {2, 3, 6, 7, 9}; //1234 67
		int arr2[] = {1, 4, 8, 10};
	//	2<1,3<4,6<8 7,10++++ +++++
		//1,3,6,7
		 int i = 0, j = 0, k = 0;
		 int arr3[]=new int[arr1.length + arr2.length];
//		int input=5;
//		int arr3[]=new int[arr1.length + arr2.length];
//		int k=0;
//		for(int i=0; i<arr1.length || i<arr2.length ; i++) {
//			
//			if(arr1.length!=i || arr2.length!=i)
//			{
//				arr3[k]=arr1[i];
//				k++;
//				
//			}
//			if(arr2.length!=i)
//			{
//				arr3[k]=arr2[i];
//				k++;
//			}
//		}
//		Arrays.sort(arr3);
//		System.out.print("nums is:" + arr3
//				[input]);
//  		
//	}
		   int n1 = arr1.length;
		    int n2 = arr2.length;

		    while (i < n1 && j < n2) {
		      
		        // Pick smaller of the two current
		        // elements and move ahead in the
		        // array of the picked element
		        if (arr1[i] < arr2[j])
		        {
		            arr3[k] = arr1[i];
		            k++;
		            i++;
		        
		        }
		        else {
		        	//System.out.println("else value " + arr2[j++]);
		            arr3[k] = arr2[j];
		            k++;
		            j++;
		        }
		    }

		    // if there are remaining elements of
		    // the first array, move them
		    while (i < n1) {
		       arr3[k] = arr1[i];
		       k++;
		       i++;
		        //System.out.println("while" + arr1[i++]);
		    }
		    // Else if there are remaining elements of
		    // the second array, move them
		    while (j < n2)
		    {
		        arr3[k] = arr2[j];
		        k++;
		        j++;
		    }
	System.out.println(Arrays.toString(arr3));
}
		
}

