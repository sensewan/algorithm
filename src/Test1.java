import java.io.UnsupportedEncodingException;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.HashMap;
import java.util.Map;

public class Test1 {
    public static void main(String[] args) throws UnsupportedEncodingException {

//        Map<String, String> map = new HashMap<String, String>();


//        for(int i=0; i<5; i++) {
//            System.out.println("~~~~~~~~~~~~~~~~~~");
//            System.out.println("메뉴 "+ i);
//            if(i==4){
//                System.out.println("~~~~~~~~~~~~~~~~~~");
//            }
//        }

        String aa = "2022-03-08 12:30:00";
        System.out.println(aa.substring(0, aa.lastIndexOf(":")));

        LocalDateTime lDate = LocalDateTime.now();

        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-hh HH:mm:00");

        String nowDateTime = lDate.format(formatter);

        System.out.println(nowDateTime);

        System.out.println();

        String test1 = "9";
//        String test2 = "1";
//        String test2 = null;

//        if (test1 == null || test2 == null){
//            System.out.println("걸림");
//        } else {
//            System.out.println("안 걸림");
//        }

        if (!test1.contains("0") && !test1.contains("1")){
            System.out.println("걸림");
        } else {
            System.out.println("안 걸림");
        }

        String test3 = "17:00";
        int t1 = 0;
        t1 = Integer.parseInt(test3.split(":")[0]);
        System.out.println(t1);





//        String bb = "RC123";
//        if (bb.startsWith("RC")) {
//            System.out.println("1111");
//        } else if(!bb.startsWith("RA")){
//            System.out.println("2222");
//        }





    }
}
