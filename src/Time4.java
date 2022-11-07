import common.DateTypeName;
import common.DateUtil;

import java.time.LocalDateTime;
import java.time.ZoneId;
import java.time.ZonedDateTime;
import java.time.format.DateTimeFormatter;

public class Time4 {

    public static void main(String[] args) {



        System.out.println("\n--------------------------------------");
//        String sb = "2022-10-27 09:00:00";

//        System.out.println(sb.substring(0, sb.indexOf(" ")));

        String originDate = "2022-10-28 00:00:00";
        String formatDate = originDate.substring(0, originDate.indexOf(" "));

        DateTimeFormatter format = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");

        // 입력된 날짜 존데이트타임 구함
        ZonedDateTime input_time = ZonedDateTime.of(LocalDateTime.parse(originDate, format), ZoneId.of("UTC"));
        StringBuffer sb3 = new StringBuffer(formatDate);
        sb3.append(" ");
        sb3.append("15:00:00");

        // 비교할 기준 타임 만들기
        ZonedDateTime standard_time = ZonedDateTime.of(LocalDateTime.parse(sb3.toString(), format), ZoneId.of("UTC"));
        System.out.println("standard_time : " + standard_time);
        System.out.println();

        String begin = null;
        String end = null;

        if(input_time.isBefore(standard_time)){
            begin = standard_time.minusDays(1L).format(format);
            end = standard_time.minusSeconds(1L).format(format);
            System.out.println("end : " + end);
        }else{
            begin = standard_time.format(format);
            end = standard_time.plusDays(1L).minusSeconds(1L).format(format);

            System.out.println("begin : " + begin);
            System.out.println("end : " + end);
        }

        System.out.println("\n--------------------------------------");
        System.out.println(DateUtil.plusDateInUTC("2022-10-28 00:00:00", DateTypeName.DAY, 1L));

        System.out.println("\n--------------------------------------");

        // DateTimeFormatter format2 = DateTimeFormatter.ofPattern("yyyy-MM-dd");


        ZonedDateTime nowUtc = ZonedDateTime.now(ZoneId.of("UTC"));
        String nowDateTime = nowUtc.format(format);

        String nowDate = nowDateTime.substring(0, nowDateTime.indexOf(" "));
        String nowTime = nowDateTime.substring(nowDateTime.indexOf(" ") + 1);


        System.out.println("nowUtc : " + nowUtc);
        System.out.println("nowDateTime : " + nowDateTime);


        System.out.println("nowDate : " + nowDate);
        System.out.println("nowTime : " + nowTime);


        String startDate = null;
        System.out.println(nowUtc.plusMinutes(01L).format(format).toString());


        System.out.println("startDate : " + startDate);

        // 변경된 하루 만들기
        StringBuffer sb = new StringBuffer(nowDate);
        sb.append(" ");
        sb.append("15:00:00");

        ZonedDateTime standard_time2 = ZonedDateTime.of(LocalDateTime.parse(sb.toString(), format), ZoneId.of("UTC"));

        String changDay = null;
        changDay = standard_time2.minusDays(1L).format(format);
        System.out.println("changDay : " + changDay);


        System.out.println("utc변경-> "+ DateUtil.transformKstTimeToUtcTime("2022-10-28 00:00:00"));



    }





}
