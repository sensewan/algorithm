package string;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;

public class String11654 {
    public static void main(String[] args) throws IOException {

        BufferedReader br = new BufferedReader(new InputStreamReader(System.in));

        String str = br.readLine();

        int a = str.charAt(0);
        System.out.println(a);

        br.close();

    }
}
