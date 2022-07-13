import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

public class Main {
    public static void main(String[] args) throws IOException {

//        예전에는 운영체제에서 크로아티아 알파벳을 입력할 수가 없었다. 따라서, 다음과 같이 크로아티아 알파벳을 변경해서 입력했다.
//        예를 들어, ljes=njak은 크로아티아 알파벳 6개(lj, e, š, nj, a, k)로 이루어져 있다. 단어가 주어졌을 때, 몇 개의 크로아티아 알파벳으로 이루어져 있는지 출력한다.
//        dž는 무조건 하나의 알파벳으로 쓰이고, d와 ž가 분리된 것으로 보지 않는다. lj와 nj도 마찬가지이다. 위 목록에 없는 알파벳은 한 글자씩 센다.

//        첫째 줄에 최대 100글자의 단어가 주어진다. 알파벳 소문자와 '-', '='로만 이루어져 있다.
//        단어는 크로아티아 알파벳으로 이루어져 있다. 문제 설명의 표에 나와있는 알파벳은 변경된 형태로 입력된다.

//        입력으로 주어진 단어가 몇 개의 크로아티아 알파벳으로 이루어져 있는지 출력한다.

//          c=, c-, dz=, d-, lj, nj, s=, z=

//        ljes=njak     ->      6,
//        ddz=z=      ->      3,
//        nljj      ->      3,
//        c=c=      ->      2,
//        dz=ak     ->      3


        BufferedReader br = new BufferedReader(new InputStreamReader(System.in));

//        Scanner sc = new Scanner(System.in);

//        StringBuilder sb = new StringBuilder();
//        StringTokenizer st;

        String str = br.readLine();

//        int limit = Integer.parseInt(br.readLine());
//        st = new StringTokenizer(a);

        int len = str.length();
        int count = 0;

        for (int i = 0; i < len; i++) {

            char ch = str.charAt(i);

            if(ch == 'c' && i < len - 1) {			// 만약 ch 가 c 라면?
                //만약 ch 다음 문자가 '=' 또는 '-' 이라면?
                if(str.charAt(i + 1) == '=' || str.charAt(i + 1) == '-') {
                    // i+1 까지가 하나의 문자이므로 다음 문자를 건너 뛰기 위해 1 증가
                    i++;
                }

            }

            else if(ch == 'd' && i < len - 1) {
                if(str.charAt(i + 1) == '-') {	// d- 일 경우
                    i++;
                }
                else if(str.charAt(i + 1) == 'z' && i < len - 2) {

                    if(str.charAt(i + 2) == '=') {	// dz= 일 경우
                        i += 2;
                    }
                }
            }

            else if((ch == 'l' || ch == 'n') && i < len - 1) {
                if(str.charAt(i + 1) == 'j') {	// lj 또는 nj 일 경우
                    i++;
                }
            }


            else if((ch == 's' || ch == 'z') && i < len - 1) {
                if(str.charAt(i + 1) == '=') {	// s= 또는z= 일 경우
                    i++;
                }

            }

            count++;

        }

        System.out.println(count);







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
