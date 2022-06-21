import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.text.DecimalFormat;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashSet;
import java.util.List;
import java.util.StringTokenizer;

public class Main {
    public static void main(String[] args) throws IOException {

        BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
//        Scanner sc = new Scanner(System.in);

//        StringBuilder sb = new StringBuilder();
//        StringTokenizer st;
//        StringTokenizer st2;



        int limit = Integer.parseInt(br.readLine());

        String num = br.readLine();
        System.out.println(num.length());

        int sum = 0;
        for (int i = 0; i < limit; i++) {

            sum += Integer.parseInt(String.valueOf(num.charAt(i)));
        }
        System.out.println(sum);

//        String str = br.readLine();

//        String input = br.readLine();
//        String input2 = br.readLine();
//        String line = br.readLine();

//        int a = Integer.parseInt(input.substring(0, input.indexOf(" ")));
//        int b = Integer.parseInt(input.substring(input.indexOf(" ") + 1));


//        List<List<String>> sList = new ArrayList<List<String>>(limit);






//        System.out.println(String.format("%.3f", d));




        br.close();

//        sc.close();


    }




}
