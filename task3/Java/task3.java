import java.util.*;

public class task3 {

    public static boolean isPalindrome(int number) {
        int cpnum = number;
        int reverseNumber = 0;

        while (number != 0) {
            reverseNumber = reverseNumber * 10 + number % 10;
            number /= 10;
        }

        return reverseNumber == cpnum;
    }

    public static List<String> palindromesInArray(List<Integer> numbers) {
        List<String> result = new ArrayList<>();

        for (int num : numbers) {
            if (num > 99 && num < 1000) {
                if (isPalindrome(num)) {
                    result.add("Yes");
                } else {
                    result.add("No");
                }
            } else {
                result.add("-");
            }
        }

        return result;
    }

    public static <T> void display(List<T> list) {
        for (T item : list) {
            System.out.print(item + " ");
        }
    }

    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);

        System.out.print("Enter N: ");
        int N = scanner.nextInt();

        if (N < 0) {
            System.out.println("N should be positive!!!");
            return;
        }

        List<Integer> numbers = new ArrayList<>();

        System.out.println("Enter numbers:");
        for (int i = 0; i < N; i++) {
            System.out.print((i + 1) + " - ");
            int num = scanner.nextInt();

            if (num < 0) {
                System.out.println("Number should be positive!!!");
                return;
            }

            numbers.add(num);
        }

        display(palindromesInArray(numbers));
    }
}
