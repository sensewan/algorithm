import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;

public class Main {
    public static void main(String[] args) throws IOException {

        BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
//        Scanner sc = new Scanner(System.in);

//        StringBuilder sb = new StringBuilder();
//        StringTokenizer st;
//        StringTokenizer st2;


        int[] arr = new int[26];

        for (int i=0; i < arr.length; i++) {
            arr[i] = -1;
        }

//        int limit = Integer.parseInt(br.readLine());
        String s = br.readLine();
//        String s = "baekjoon";


//        String str = br.readLine();

//        String input = br.readLine();
//        String input2 = br.readLine();
//        String line = br.readLine();

//        int a = Integer.parseInt(input.substring(0, input.indexOf(" ")));
//        int b = Integer.parseInt(input.substring(input.indexOf(" ") + 1));

//        List<List<String>> sList = new ArrayList<List<String>>(limit);



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

//        sc.close();


    }



}
