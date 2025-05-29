import java.util.*;
import java.lang.*;

public class TuringTest {
        /**
         * @param String[] ops - List of operations
         * @return int - Sum of scores after performing all operations
         */
        public static int calPoints(String[] ops) {
            int result = Integer.MIN_VALUE;

            int opsLength = ops.length;

            int[] copy = new int[opsLength];

            for (int i = 0; i < opsLength; i++) {
                if (i == 0)
                    copy[i] = Integer.parseInt(ops[i]);
                else {
                    if (isInteger(ops[i])) {
                        copy[i] = Integer.parseInt(ops[i]);
                    } else if (ops[i].equals("+")) {
                        copy[i] = copy[i    -1] + copy[i - 2];
                    } else if (ops[i].equals("D")) {
                        copy[i] = copy[i - 1] * 2;
                    }
                }
            }
            int sum = 0;

            for (int i = 0; i < copy.length; i++) {
                sum += copy[i];
            }
            result = sum;
            for (int i = 0; i < copy.length; i++) {
                System.out.println(" " + copy[i]);
            }
            return result;
        }

    public static boolean isInteger(String input) {

        if (input == null)
            return false;
        try {
            int i = Integer.parseInt(input);
        } catch(NumberFormatException e) {
            return false;
        }
        return true;
    }

    public static void main(String[] args)
    {
        Customer customer1 = new Customer();

        Customer customer2;
        customer2 = customer1;

        customer1.name = "Ndoda";

        System.out.println(customer1.name);
        System.out.println(customer2.name);

        customer1.name = "Scotch";

        System.out.println(customer1.name);
        System.out.println(customer2.name);
    }
}



