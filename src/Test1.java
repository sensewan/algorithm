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


//        String bb = "RC123";
//        if (bb.startsWith("RC")) {
//            System.out.println("1111");
//        } else if(!bb.startsWith("RA")){
//            System.out.println("2222");
//        }





    }
}
