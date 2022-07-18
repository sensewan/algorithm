import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

public class Main {

    static BufferedReader br = new BufferedReader(new InputStreamReader(System.in));

    public static void main(String[] args) throws IOException {

//        그룹 단어란 단어에 존재하는 모든 문자에 대해서, 각 문자가 연속해서 나타나는 경우만을 말한다.
//        예를 들면, ccazzzzbb는 c, a, z, b가 모두 연속해서 나타나고, kin도 k, i, n이 연속해서 나타나기 때문에 그룹 단어이지만,
//        aabbbccb는 b가 떨어져서 나타나기 때문에 그룹 단어가 아니다.

//        단어 N개를 입력으로 받아 그룹 단어의 개수를 출력하는 프로그램을 작성하시오.

//        3
//        happy
//        new
//        year          ->      3

//        4
//        aba
//        abab
//        abcabc
//        a             ->      1

//        5
//        ab
//        aa
//        aca
//        ba
//        bb            ->      4

//        2
//        yzyzy
//        zyzyz         ->      0


//        BufferedReader br = new BufferedReader(new InputStreamReader(System.in));

//        Scanner sc = new Scanner(System.in);

//        StringBuilder sb = new StringBuilder();
//        StringTokenizer st;

        int limit = Integer.parseInt(br.readLine());

        int count = 0;
        for(int i=0; i<limit; i++) {

            String str = br.readLine();

            boolean[] checkList = new boolean[26];
            int prev = 0;

            for(int j=0; j<str.length(); j++) {

                int now = str.charAt(j);

                if (prev != now) {

                    if(checkList[str.charAt(j) - 'a'] == false) {
                        prev = now;
                    }
                }

            }


        }


//        st = new StringTokenizer(a);








//        String input = br.readLine();
//        String input2 = br.readLine();
//        String line = br.readLine();

//        int a = Integer.parseInt(input.substring(0, input.indexOf(" ")));
//        int b = Integer.parseInt(input.substring(input.indexOf(" ") + 1));

//        List<List<String>> sList = new ArrayList<List<String>>(limit);


        br.close();

//        sc.close();


    }


    public static boolean check() throws IOException {
        boolean[] check = new boolean[26];
        int prev = 0;

        String str = br.readLine();

        for(int i = 0; i < str.length(); i++) {

            int now = str.charAt(i);	// i 번째 문자 저장 (현재 문자)

            // 앞선 문자와 i 번째 문자가 같지 않다면?
            if (prev != now) {

                // 해당 문자가 처음 나오는 경우 (false 인 경우)
                if ( check[now - 'a'] == false ) {
                    check[now - 'a'] = true;		// true 로 바꿔준다
                    prev = now;					// 다음 턴을 위해 prev 도 바꿔준다
                }

                // 해당 문자가 이미 나온 적이 있는 경우 (그룹단어가 아니게 됨)
                else {
                    return false;	//함수 종료
                }
            }


            // 앞선 문자와 i 번째 문자가 같다면? (연속된 문자)
            // else 문은 없어도 됨
            else {
                continue;
            }
        }
        return true;
    }


}
