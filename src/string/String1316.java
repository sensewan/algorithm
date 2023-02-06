package string;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.util.StringTokenizer;


/*
* 1. 리스트이용해 true,false로 연속된 문자열 찾기
* */

// 그룹 단어 체커
public class String1316 {

    static BufferedReader br = new BufferedReader(new InputStreamReader(System.in));

    public static void main(String[] args) throws IOException {

//        그룹 단어란 단어에 존재하는 모든 문자에 대해서, 각 문자가 연속해서 나타나는 경우만을 말한다.
//        예를 들면, ccazzzzbb는 c, a, z, b가 모두 연속해서 나타나고, kin도 k, i, n이 연속해서 나타나기 때문에 그룹 단어이지만,
//        aabbbccb는 b가 떨어져서 나타나기 때문에 그룹 단어가 아니다.

//        단어 N개를 입력으로 받아 그룹 단어의 개수를 출력하는 프로그램을 작성하시오

//        3
//        happy
//        new
//        year          -> 3

//        4
//        aba
//        abab
//        abcabc
//        a            -> 1

//        5
//        ab
//        aa
//        aca
//        ba
//        bb           -> 4


        StringTokenizer st;


        // 그룹단어 몇개인지 체크
        int count = 0;

        int number = Integer.parseInt(br.readLine());

        for (int i=0; i<number; i++) {
            if (check() == true) {
                count++;
            }
        }

        System.out.println(count);


        br.close();

    }

    public static boolean check() throws IOException {

        // 알파벳 개수 만큼 배열 생성 (기본 false 생성됨)
        boolean[] check = new boolean[26];

        // 이전 문자와 현재 문자비교를 위한 변수
        int prev = 0;

        String str = br.readLine();

        // 입력 받은 문자 한 개씩 검사하기
        for (int i=0; i<str.length(); i++) {
            // 알파벳을 숫자로 변환 (ex. A=65, a=97, b=98 ...)
            int now = str.charAt(i);

            if (prev != now) {
                // 이전에 나온 적이 있는지 확인
                if (check[now - 'a'] == false) {
                    // 처음 나온 알파벳이면 true로 변경
                    check[now - 'a'] = true;

                    // 이전 문자를 현재 문자로 변경
                    prev = now;

                } else {
                    // 이미 나온 적이 있는 알파벳이면 그룹 단어가 아님
                    return false;
                }
            } else {
                // 이전 문자와 현재 문자가 같으면 그룹 단어
                continue;
            }
        }

        return true;
    }
}





