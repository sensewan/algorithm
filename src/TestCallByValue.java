import java.io.IOException;

public class TestCallByValue {

    public static void swap(int x, int y) {

        int temp = x;

        x = y;

        y = temp;
        System.out.println("\n------ 호출 --------");
        System.out.println("x= "+x + ", y= " + y);

    }


    public static void main(String[] args) throws IOException {

        int a = 10;
        int b = 20;

        System.out.println("swap() *호출 전*-> a= " + a +
                                           ", b= " + b);

        swap(a, b);

        System.out.println("\nswap() *호출 후*-> a= " + a +
                                             ", b= " + b);


    }


}


