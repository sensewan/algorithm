import java.io.IOException;
import java.math.BigDecimal;
import java.math.RoundingMode;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.StringTokenizer;

public class Test3 {
    public static void main(String[] args) throws IOException {




        double d = 1.000056;

//        System.out.println(String.format("%.3f", d));

        String test  = "1,2,3, 4, 5";

        StringTokenizer st = new StringTokenizer(test, ",");

        int index = 0;
        List<String> list = new ArrayList<String>();
        while (st.hasMoreTokens()) {
            list.add(st.nextToken().trim());
//            index++;
        }

        for(String s : list){
            System.out.print(s);
        }

        System.out.println();

        double a = 10000.0;
        double b = 100.0;

        System.out.println(a+b);

        System.out.println();

        double dd1 = 0.00001;
        double dd2 = 0.00002;
        System.out.println(dd1+dd2);

        BigDecimal bc1 = BigDecimal.valueOf(dd1);
        BigDecimal bc2 = BigDecimal.valueOf(dd2);
        System.out.println(bc1);
        System.out.println(bc2);

        BigDecimal sum = null;
        sum = bc1.add(bc2);
        sum = sum.add(bc2).stripTrailingZeros();
        System.out.println("sum: " +sum);
        System.out.println("sum 곱하기: " +sum.multiply(BigDecimal.valueOf(3)).stripTrailingZeros());


        System.out.println("-----------------------------------------------------");


        double d1 = 1000.0;
        double d2 = 2000.01;
        System.out.println("d1: " +d1);

        BigDecimal big1 = BigDecimal.valueOf(d1).stripTrailingZeros();
        BigDecimal big2 = BigDecimal.valueOf(d2).stripTrailingZeros();

        String test1 = null;

        System.out.println(big1);
        System.out.println(big1.add(big2));

        System.out.println(big1.toString());

        System.out.println(Double.parseDouble(String.valueOf(big1)));


        double d3 = 1000.01;
        double d4 = 1000.00;
        double d5 = 0000.01;
        BigDecimal big3 = BigDecimal.valueOf(d3).stripTrailingZeros();
        BigDecimal big4 = BigDecimal.valueOf(d4).stripTrailingZeros();
        BigDecimal big5 = BigDecimal.valueOf(d5).stripTrailingZeros();
        System.out.println("big3: "+ big3);
        System.out.println("big4: "+ big4);
        if(big3.compareTo(big4.add(big5)) == 0){
            System.out.println("같어");
        }else{
            System.out.println("틀려");
        }


        System.out.println();
        BigDecimal big6 = BigDecimal.ZERO;
        System.out.println(big6);
        System.out.println(big6.add(big4));


        System.out.println("-----------------------------------------------------");
        BigDecimal big7 = BigDecimal.valueOf(10000);
//        BigDecimal n = BigDecimal.valueOf(10);
//        System.out.println((big7.multiply(BigDecimal.valueOf(9))).divide(BigDecimal.valueOf(100), RoundingMode.FLOOR).setScale(0, RoundingMode.FLOOR));
        System.out.println((big7.multiply(BigDecimal.valueOf(0.5))).divide(BigDecimal.valueOf(100)).setScale(0, RoundingMode.FLOOR));
        System.out.println((big7.multiply(BigDecimal.valueOf(0.105))).setScale(0, RoundingMode.FLOOR));


        System.out.println();
        String aaa = "wine_piece_joint_nft";
        String bbb = "art_piece_joint";

        if(bbb.startsWith("wine")){
            System.out.println("걸림");
        }else {
            System.out.println("안 걸림");
        }
        System.out.println();


        ArrayList<String> list1 = new ArrayList<String>();
        for(int i = 0; i < 3; i++){
            list1.add("테스트"+i);
        }

        System.out.println(list1);


        String sub = "1652428515145-138";
        System.out.println(sub.split("-")[0]);
        System.out.println(sub.split("-")[1]);


        System.out.println();
        int resultNftInfo = 1;
        int resultGrid = 0;
        if(resultNftInfo < 1 || resultGrid < 1) {
            System.out.println("걸림");
        }else {
            System.out.println("안 걸림");
        }

        System.out.println();

        BigDecimal total_amt = new BigDecimal(10000);
        BigDecimal loyal_amt = BigDecimal.ZERO;
        BigDecimal loyal_amt2 = new BigDecimal(0.1);
        BigDecimal global_suggest_goods_price = new BigDecimal(10000.0);
        BigDecimal admin_page_fee_rate = new BigDecimal(0.1);

        System.out.println(total_amt.subtract(loyal_amt2).setScale(2, RoundingMode.FLOOR));
        System.out.println(total_amt.subtract(loyal_amt2).intValue());

        System.out.println();

        String global_origin_nid_no = "123";
        String global_origin_grid_no = "123";

        int checkUpdate = 0;
        if(global_origin_nid_no != null){
            checkUpdate++;
            System.out.println("ddd");
            System.out.println(checkUpdate);
        }
        if(global_origin_grid_no != null){
            checkUpdate++;
            System.out.println("ggg");
            System.out.println(checkUpdate);
        }
        System.out.println(checkUpdate);
        System.out.println();

        System.out.println(total_amt.multiply(loyal_amt2).setScale(0, RoundingMode.FLOOR));

        System.out.println();

        // 수수료 금액
        BigDecimal global_fee_sum_price = global_suggest_goods_price.multiply(admin_page_fee_rate).setScale(0, RoundingMode.FLOOR);
        // 수수료 포함 상품 결제금액
        BigDecimal global_total_fee_goods_price = global_suggest_goods_price.add(global_fee_sum_price);

        System.out.println(global_fee_sum_price);
        System.out.println(global_total_fee_goods_price);


        System.out.println("\n---------------------------------------\n");

//        String result_c1 = null;
        String result_c1 = "0";

        if(result_c1 == null || !result_c1.equals("1")){
            System.out.println("걸림");
        }else {
            System.out.println("통과");
        }

        System.out.println();

        Map<String, String> map = new HashMap<String, String>();
        map.put("key1", "맵111");
        map.put("key2", "맵222");

        System.out.println(map);
        System.out.println(map.get("key2"));

        System.out.println();


        String s2 = "3 ABC";
        int nn = Integer.parseInt(s2.split(" ")[0]);

        System.out.println(nn);




        System.out.println("--------------------------------------------");

        String u1= "12";
        String u2= "13";
        if(!u1.equals(u2)) {
            System.out.println("걸림");
        }else {
            System.out.println("통과");
        }





    }

}
