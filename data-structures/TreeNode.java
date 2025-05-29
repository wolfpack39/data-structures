import java.util.Arrays;

public class TreeNode {
    public static void main(String[] args) {
        int[] A = { 1, 4, 6, 16 };
        int itemsInArray = 3;
        //int len = A.length;     // Length of the original array

        //int[] newArray = new int[len * 2];      // Create new array and copy elements into it
        //System.arraycopy(A, 0, newArray, 0, len);
        
        insert(A, itemsInArray, 2);
        for (int j : A) {
            System.out.println(j);
        }
    }

    public static void getNumber(int[] A) {

        int num = 1;
        Arrays.sort(A);

        for (int j : A) {
            while (num <= A[A.length - 1]) {
                if (num != j) {
                    break;
                }
                num++;
            }
        }
        System.out.println(num);
    }


    public static void test() {

    }

    static int binarySearch(int[] A, int loIndex, int hiIndex, int value) {

        if (loIndex > hiIndex) {
            // The starting position comes after the final index.
            // There are no elements in the specified range
            return -1;
        } else {
            int middle = (loIndex + hiIndex) / 2;
            if (value == A[middle]) {
                return middle;
            } else if (value < A[middle]) {
                return binarySearch(A, loIndex, middle - 1, value);
            } else {
                return binarySearch(A, middle + 1, hiIndex, value);
            }
        }
    }

    static int find(int[] A, int N) {
        for (int index = 0; index < A.length; index++) {
            if (N == A[index])
                return index;
        }
        // If we get this far then N has not been found
        // anywhere in the array. Return a value of -1
        return -1;
    }

    static void insert(int[] A, int itemsInArray, int newItem) {
        /*
         * Pre-condition. itemsInArray is the number of items that are stored in A
         * These items must be in increasing order.
         * Post-condition. The number of items has increased by 1, newItem has been added to the
         * array, and all the items in the array are still in increasing order*
         * * *
         *
         */
        int loc = itemsInArray - 1;     // Start at the end of the array

        while (loc >= 0  && A[loc] > newItem) {
            /*
             * Bump A[loc] up onto A[loc + 1] to make space for newItem,
             * until A[loc] is greater than newItem
             */
            A[loc + 1] = A[loc];
            loc = loc - 1;          // Move on to the next item
        }
        A[loc + 1] = newItem;       // Put newItem into last vacated space
    }

    static void insertionSort(int[] A) {
        int itemsSorted;        // Number of items that have been sorted so far
        for (itemsSorted = 1; itemsSorted < A.length; itemsSorted++) {
            // Assume that items A[0], A[1], ...A[itemsSorted - 1]
            // have already been sorted. Insert A[itemsSorted]
            // into the sorted part of the list
            int temp = A[itemsSorted];      // The item to be inserted
            int loc = itemsSorted - 1;      // Start at the end of the list
            while (loc >= 0 && A[loc] > temp) {
                A[loc + 1] = A[loc];        // Bump A[loc] up onto A[loc + 1] to make space for temp
                loc = loc - 1;
            }
            A[loc + 1] = temp;
        }
    }

}
