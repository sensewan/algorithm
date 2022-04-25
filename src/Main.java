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



//        첫째 줄에는 테스트 케이스의 개수 C가 주어진다.
//        둘째 줄부터 각 테스트 케이스마다 학생의 수 N(1 ≤ N ≤ 1000, N은 정수)이 첫 수로 주어지고,
//        이어서 N명의 점수가 주어진다. 점수는 0보다 크거나 같고, 100보다 작거나 같은 정수이다.

        // 평균구하기
        // 평균 보다 높은 인원 수 구하기
        // 비율 구하기
        // 5 50 50 70 80 100         40.000%
        // 7 100 95 90 80 70 60 50   57.143%
//        3 70 90 80
//        3 70 90 81
//        9 100 99 98 97 96 95 94 93 91

        List<List<String>> sList = new ArrayList<List<String>>(limit);



        for(int i=0; i<limit; i++) {
            List<String> list = new ArrayList<String>();

            list.add(br.readLine());

            sList.add(list);

        }

        for(int i=0; i<sList.size(); i++) {
            List<String> list = sList.get(i);
            String s = list.get(0);

//            System.out.println(s);

            st = new StringTokenizer(s, " ");
            st2 = new StringTokenizer(s, " ");

            int n = Integer.parseInt(st.nextToken());
            int sum = 0;
            int avg = 0;
            Integer[] intList = new Integer[st.countTokens()];

            int index = 0;
            while (st.hasMoreTokens()) {
                int a;
                a=Integer.parseInt(st.nextToken());
                sum += a;
                intList[index] = a;
                index++;
            }
            avg = sum/n;

            int count = 0;
            for(int j=0; j<intList.length; j++) {
                if(intList[j] > avg) {
                    count++;
                }
            }
            System.out.println(count);


        }



//        System.out.println(String.format("%.3f", d));










//        br.close();




//        System.out.println(sb);




//        Scanner sc = new Scanner(System.in);
//
//        int a = sc.nextInt();

//        sc.close();






    }

}
