package string;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;

public class String11720 {
    public static void main(String[] args) throws IOException {


        BufferedReader br = new BufferedReader(new InputStreamReader(System.in));

        int limit = Integer.parseInt(br.readLine());

        String num = br.readLine();

        int sum = 0;
        for (int i = 0; i < limit; i++) {

            sum += Integer.parseInt(String.valueOf(num.charAt(i)));
        }
        System.out.println(sum);



        br.close();


    }
}
