import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;

public class Main {
    public static void main(String[] args) throws IOException {

        BufferedReader br = new BufferedReader(new InputStreamReader(System.in));

//        Scanner sc = new Scanner(System.in);


//        StringBuilder sb = new StringBuilder();
//        StringTokenizer st;기
//        StringTokenizer st2;


//        int limit = Integer.parseInt(br.readLine());

//        알파벳 대소문자로 된 단어가 주어지면, 이 단어에서 가장 많이 사용된 알파벳이 무엇인지 알아내는 프로그램을 작성하시오.
//        단, 대문자와 소문자를 구분하지 않는다.

//        첫째 줄에 이 단어에서 가장 많이 사용된 알파벳을 대문자로 출력한다. 단, 가장 많이 사용된 알파벳이 여러 개 존재하는 경우에는 ?를 출력한다.

//        Mississipi    ->  ?
//        zZa   -> Z
//        z     -> Z
//        baaa  -> A

        String a = br.readLine();

        System.out.println("입력받은 값: " +a);

//        소문자 97 ~ 122
//        대문자 65 ~ 90

        int[] num = new int[26];


        for(int i=0; i<a.length(); i++) {
            // 소문자
            if('a' <= a.charAt(i) && a.charAt(i) <='z') {
                num[a.charAt(i)-97]++;
            } else {
                num[a.charAt(i)-65]++;
            }
        }

        int max = -1;
        char ch = '?';

        for (int i = 0; i < num.length; i++) {
            if (num[i] > max) {
                max = num[i];
                ch = (char) (i + 65); // 대문자로 출력해야하므로 65를 더해준다.
            }
            else if (num[i] == max) {
                ch = '?';
            }
        }
        System.out.println(ch);







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
