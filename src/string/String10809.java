package string;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;


/*
* 1. 기본 배열 선언
* 2. charAt 이용 (문자열 하나씩 활용하기)
* */

// 알파벳 찾기
public class String10809 {
    public static void main(String[] args) throws IOException {


        BufferedReader br = new BufferedReader(new InputStreamReader(System.in));

        int[] arr = new int[26];

        for (int i=0; i < arr.length; i++) {
            arr[i] = -1;
        }

        String s = br.readLine();

        for (int i=0; i < s.length(); i++) {
            char ch = s.charAt(i);

            if (arr[ch - 'a'] == -1) {
                arr[ch -'a'] = i;
            }
        }

        for(int val : arr) {
            System.out.print(val + " ");
        }



        br.close();


    }
}
