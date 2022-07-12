package string;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.util.ArrayList;
import java.util.List;
import java.util.StringTokenizer;


/*
* 1. StringTokenizer 사용
* */

// 단어의 개수
public class String1152 {
    public static void main(String[] args) throws IOException {

//        영어 대소문자와 공백으로 이루어진 문자열이 주어진다. 이 문자열에는 몇 개의 단어가 있을까? 이를 구하는 프로그램을 작성하시오.
//        단, 한 단어가 여러 번 등장하면 등장한 횟수만큼 모두 세어야 한다.

//        첫째 줄에 단어의 개수를 출력한다.

//        The Curious Case of Benjamin Button   ->  6
//        The first character is a blank    ->  6
//        The last character is a blank     ->  6

        BufferedReader br = new BufferedReader(new InputStreamReader(System.in));

        StringTokenizer st;

        String a = br.readLine();
        st = new StringTokenizer(a);



        List<String> list = new ArrayList<>();
        while (st.hasMoreTokens()) {
            list.add(st.nextToken(" "));
        }

        System.out.println(list.size());


        br.close();

    }
}
