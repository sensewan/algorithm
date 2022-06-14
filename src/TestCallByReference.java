import java.io.IOException;

public class TestCallByReference {

    int value;

    TestCallByReference(int value) {
        this.value = value;
    }


    public static void main(String[] args) throws IOException {

        TestCallByReference a = new TestCallByReference(10);
        TestCallByReference b = new TestCallByReference(20);

        System.out.println("swap() 호출 전-> a= " + a.value +
                                         ", b= " + b.value);

        swap(a, b);

        System.out.println("\nswap() 호출 후-> a= " + a.value +
                                           ", b= " + b.value);

    }


    public static void swap(TestCallByReference x, TestCallByReference y) {

        int temp = x.value;

        x.value = y.value;
        y.value = temp;


        System.out.println("\n------ 호출 --------");
        System.out.println("x= "+x.value + ", y= " + y.value);

    }

}


