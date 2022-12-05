import common.DateTypeName;
import common.DateUtil;

import java.math.BigDecimal;
import java.math.RoundingMode;
import java.time.LocalDateTime;
import java.time.ZoneId;
import java.time.ZonedDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class Test4 {

    public static void main(String[] args) {

        Map<String, Object> m = new HashMap<>();

        m.put("키1", 1000);
        m.put("키2", "값2");
        Map<String,String> result = test(m);

        System.out.println(result.get("결과"));

        System.out.println();

        String s1 = "requestToNftOrderSuggestByCash";
        String s2 = "requestToNftOrderSuggestByCash";

        System.out.println("--------------------------------------");

        String goods_param = "gs_id:44,gcode:1659445835758,quantity:1,goodstype:digital_nft,grid_publication:0,nid_no:137,token_id:138,grid_no:null,joint_no:null,goods_price:10000,fee_unit_price:1000/" +
                "gs_id:44,gcode:1659445835758,quantity:1,goodstype:digital_nft,grid_publication:0,nid_no:138,token_id:138,grid_no:null,joint_no:null,goods_price:10000,fee_unit_price:1000/" +
                "gs_id:44,gcode:1659445835758,quantity:1,goodstype:digital_nft,grid_publication:0,nid_no:139,token_id:138,grid_no:null,joint_no:null,goods_price:10000,fee_unit_price:1000";
//        String goods_param = "gs_id:13,gcode:1657787715299,quantity:1,goodstype:digital_nft,grid_publication:0,nid_no:null,token_id:null,grid_no:null,joint_no:null,goods_price:0.01,fee_unit_price:0.001";

        List<Object> goods_list = new ArrayList<Object>();

        Map<String, Object> paramMap = paramGoodsChange(goods_param, 1);

        boolean check = (boolean) paramMap.get("check");
        if(check) {
            goods_list = (List<Object>) paramMap.get("goods_list");
        }

        System.out.println("=== check-> " + check);
        System.out.println("=== goods_list-> " + goods_list);


        System.out.println();
        System.out.println("--------------------------------------");
        BigDecimal global_total_fee_goods_price = BigDecimal.valueOf(0.16);
        System.out.println(global_total_fee_goods_price);
        System.out.println(global_total_fee_goods_price.setScale(0, RoundingMode.FLOOR));
        System.out.println(global_total_fee_goods_price.intValue());
        System.out.println("zzzzz");
        System.out.println(Double.parseDouble(String.valueOf(global_total_fee_goods_price.intValue())));


        System.out.println("\n--------------------------------------");
//        String sb = "2022-10-27 09:00:00";

//        System.out.println(sb.substring(0, sb.indexOf(" ")));

//        String tt1 = "G1";
        String tt1 = "RG";
//        String tt1 = "RG1";
        if (tt1.equals("G1") || tt1.equals("RG")) {
            System.out.println("걸림!!");
        } else {
            System.out.println("안걸림!!");
        }







    }





    public static void test1111(int ttt){
        System.out.println(ttt);
    }




    public static Map<String, Object> paramGoodsChange(String param, int nft_pr_quantity) {
        Map<String, Object> map = new HashMap<>();

        if(param == null) {
            System.out.println("null !!!");
            map.put("check", false);
            return map;
        }
        if(param.indexOf(" ") != -1){
            System.out.println("공백이 있습니다.");
            map.put("check", false);
            return map;
        }

        List<Object> goods_param_list = new ArrayList<Object>();
        List<Object> goods_list = new ArrayList<Object>();

        if(!param.contains("/")) {
            goods_param_list = Arrays.asList(param);
            System.out.println("상품 1개 구매");
        } else {
            goods_param_list = Arrays.asList(param.split("/"));
            System.out.println("상품 여러개 구매  " + goods_param_list.size());
        }

        System.out.println("goods_param_list : " + goods_param_list);

        // 구매한 NFT 상품 갯수
        int goods_len = goods_param_list.size();

        if(goods_len != nft_pr_quantity) {
            System.out.println("신청 수량 이상 " + goods_len + " vs " + nft_pr_quantity);
            map.put("check", false);
            return map;
        }


        // 구매 상품 목록 형태 변경 (중복)
        for(int i = 0; i < goods_param_list.size(); i++) {
            Map<String, Object> goodsMap = new HashMap<>();

            for (int j = 0; j < goods_param_list.get(i).toString().split(",").length; j++) {
//                    System.out.println(goods_param_list.get(i).toString().split(",")[j]);

                String goods = goods_param_list.get(i).toString().split(",")[j];

                String key = goods.split(":")[0];
                String value = goods.split(":")[1];

                goodsMap.put(key, value);
            }
            goods_list.add(goodsMap);
        }

//        System.out.println("\n=== goods_list-> " + goods_list);


        map.put("goods_list", goods_list);
        map.put("check", true);


        return map;
    }



    public static Map<String,String> test(Map<String,Object> m) {

        System.out.println((Integer) m.get("키1"));

        System.out.println("파라미터: "+ m);


        Map<String, String> map = new HashMap<>();
        map.put("결과", "1111");

        return map;

    }
}
