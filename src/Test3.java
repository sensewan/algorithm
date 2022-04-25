import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.StringTokenizer;

public class Test3 {
    public static void main(String[] args) throws IOException {

        System.out.println("디버깅 포인트1");

        System.out.println("디버깅 포인트2");


        double d = 1.000056;

//        System.out.println(String.format("%.3f", d));

        String test  = "1,2,3, 4, 5";

        StringTokenizer st = new StringTokenizer(test, ",");

        int index = 0;
        List<String> list = new ArrayList<String>();
        while (st.hasMoreTokens()) {
            list.add(st.nextToken().trim());
//            index++;
        }

        for(String s : list){
            System.out.print(s);
        }





    }

}
