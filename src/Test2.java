import java.io.IOException;
import java.util.Scanner;
import java.util.StringTokenizer;

public class Test2 {
    public static void main(String[] args) throws IOException {

//        BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
//
//        int n = Integer.parseInt(br.readLine());
//
//        String list = br.readLine();
//
//        br.close();

        Scanner sc = new Scanner(System.in);

        String inTime = sc.nextLine();
        int countTime = sc.nextInt();
        sc.close();

//        System.out.println("입력값-> " + inTime);
        System.out.println("입력 카운트시간-> " + countTime);

        int hour = Integer.parseInt(inTime.substring(0, inTime.indexOf(" ")));
        int min = Integer.parseInt(inTime.substring(inTime.indexOf(" ") + 1));

        int cMin = 0;

        System.out.println("시간-> " + hour);
        System.out.println("분-> " + min);
        if(min + countTime >= 60){
            cMin = min + countTime - 60;

            while (cMin >= 60) {
                hour ++;
                cMin -= 60;
            }
            hour++;
            if(hour > 23){
                hour -= 24;
            }
        }

//        System.out.println("계산 시간-> " + hour);
//        System.out.println("계산 분-> " + cMin);
        System.out.println(hour +" " + cMin);




    }

}
