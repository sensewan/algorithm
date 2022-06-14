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
        StringTokenizer st;
        StringTokenizer st2;



        int limit = Integer.parseInt(br.readLine());

//        String input = br.readLine();
//        String input2 = br.readLine();
//        String line = br.readLine();

//        int a = Integer.parseInt(input.substring(0, input.indexOf(" ")));
//        int b = Integer.parseInt(input.substring(input.indexOf(" ") + 1));



//        어떤 양의 정수 X의 각 자리가 등차수열을 이룬다면, 그 수를 한수라고 한다.
//        등차수열은 연속된 두 개의 수의 차이가 일정한 수열을 말한다.
//        N이 주어졌을 때, 1보다 크거나 같고, N보다 작거나 같은 한수의 개수를 출력하는 프로그램을 작성하시오.

//        첫째 줄에 1보다 크거나 같고, N보다 작거나 같은 한수의 개수를 출력한다.

        // 110 -> 99,
        // 1 -> 1,
        // 210 -> 105,
        // 1000 -> 144,

        System.out.println(limit);

        System.out.println(arithmetic(limit));





//        List<List<String>> sList = new ArrayList<List<String>>(limit);




//        System.out.println(String.format("%.3f", d));




        br.close();


//        sc.close();


    }


    public static int arithmetic(int num) {

        int cnt = 0;

        if(num < 100) {
            return num;
        }
        cnt = 99;

        // 백의 자릿수 = i / 100
        // 십의 자릿수 = (i / 10) % 10
        // 일의 자릿수 = i % 10

        for(int i=100; i<=num; i++) {
            int bak = i / 100;
            int ten = (i / 10) % 10;
            int il = i % 10;

            if((bak - ten) == (ten - il)) {
                cnt++;
            }
        }

        return cnt;
    }

}
