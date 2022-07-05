package string;

import java.io.IOException;
import java.util.Scanner;


/*
*
*
* */

// 문자열 반복
public class String2675 {
    public static void main(String[] args) throws IOException {

        Scanner in = new Scanner(System.in);


        int T = in.nextInt();
        for(int i = 0; i < T; i++) {

            int R = in.nextInt();
            String S = in.next();

            for(int j = 0; j < S.length(); j++) {
                for(int k = 0; k < R; k++) {
                    System.out.print(S.charAt(j));
                }
            }

            System.out.println();
        }


    }
}
