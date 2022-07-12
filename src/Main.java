import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.util.ArrayList;
import java.util.List;
import java.util.StringTokenizer;

public class Main {
    public static void main(String[] args) throws IOException {

        BufferedReader br = new BufferedReader(new InputStreamReader(System.in));

//        Scanner sc = new Scanner(System.in);


//        StringBuilder sb = new StringBuilder();
        StringTokenizer st;
//        StringTokenizer st2;


//        int limit = Integer.parseInt(br.readLine());
        String a = br.readLine();
        st = new StringTokenizer(a);

//        영어 대소문자와 공백으로 이루어진 문자열이 주어진다. 이 문자열에는 몇 개의 단어가 있을까? 이를 구하는 프로그램을 작성하시오.
//        단, 한 단어가 여러 번 등장하면 등장한 횟수만큼 모두 세어야 한다.

//        첫째 줄에 단어의 개수를 출력한다.


//        The Curious Case of Benjamin Button   ->  6
//        The first character is a blank    ->  6
//        The last character is a blank     ->  6

        List<String> list = new ArrayList<>();
        while (st.hasMoreTokens()) {
//            System.out.println(st.nextToken(" "));
            list.add(st.nextToken(" "));
        }

        System.out.println(list.size());




//        System.out.println(s.length());

//        String str = br.readLine();

//        String input = br.readLine();
//        String input2 = br.readLine();
//        String line = br.readLine();

//        int a = Integer.parseInt(input.substring(0, input.indexOf(" ")));
//        int b = Integer.parseInt(input.substring(input.indexOf(" ") + 1));

//        List<List<String>> sList = new ArrayList<List<String>>(limit);


        br.close();

//        sc.close();


    }



}
