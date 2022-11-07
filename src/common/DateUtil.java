package common;

import common.DateTypeName;

import java.text.SimpleDateFormat;
import java.time.LocalDateTime;
import java.time.ZoneId;
import java.time.ZonedDateTime;
import java.time.format.DateTimeFormatter;
import java.time.zone.ZoneRulesException;
import java.util.HashMap;
import java.util.Map;

public class DateUtil {

    private static final String UTC = "UTC";
    private static final String DATE_PATTERN = "yyyy-MM-dd HH:mm:ss";

    // 문자열이 날짜형식인지 적용하는 함수
    public static boolean isDateFormat(String value, String dateFormat) {
        try {
            SimpleDateFormat dateFormatParser = new SimpleDateFormat(dateFormat);
            // parse에 잘못된 값이 들어오면 Exception을 리턴하도록 설정
            dateFormatParser.setLenient(false);
            dateFormatParser.parse(value);
            return true;
        } catch (Exception e) {
            return false;
        }
    }

    // UTC시간을 KST시간으로 변경해주는 함수
    public static String transformUtcTimeToKstTime(String value, String dateFormat, String timezone) {
        ZonedDateTime utcTime = LocalDateTime.parse(value, DateTimeFormatter.ofPattern(dateFormat)).atZone(ZoneId.of(UTC));
        ZonedDateTime kstTime = utcTime.withZoneSameInstant(ZoneId.of(timezone));
        return kstTime.format(DateTimeFormatter.ofPattern(dateFormat));
    }

    // KST시간을 UTC시간으로 변경해주는 함수
    public static String transformKstTimeToUtcTime(String value) {
        ZonedDateTime kstTime = LocalDateTime.parse(value, DateTimeFormatter.ofPattern(DATE_PATTERN)).atZone(ZoneId.of("Asia/Seoul"));
        ZonedDateTime utcTime = kstTime.withZoneSameInstant(ZoneId.of(UTC));
        return utcTime.format(DateTimeFormatter.ofPattern(DATE_PATTERN));
    }

    // 쿠키에 담긴 timezone값으로 날짜 형식이 있다면 UTC시간으로 변경해주는 함수
    public static String transformDateToKstTime(String value, String dateFormat, String timezone) {
        try {
            ZonedDateTime kstTime = LocalDateTime.parse(value, DateTimeFormatter.ofPattern(dateFormat)).atZone(ZoneId.of(timezone));
            ZonedDateTime utcTime = kstTime.withZoneSameInstant(ZoneId.of(UTC));
            return utcTime.format(DateTimeFormatter.ofPattern(dateFormat));
        } catch (ZoneRulesException e) {
            ZonedDateTime kstTime = LocalDateTime.parse(value, DateTimeFormatter.ofPattern(dateFormat)).atZone(ZoneId.of(UTC));
            ZonedDateTime utcTime = kstTime.withZoneSameInstant(ZoneId.of(UTC));
            return utcTime.format(DateTimeFormatter.ofPattern(dateFormat));
        }
    }

    // 입력된 날짜 값을 기준으로 날짜를 더해주는 함수, long은 반드시 L을 붙여야 한다.
    public static String plusDateInUTC(String date, String type, long bounds) {
        DateTimeFormatter format = DateTimeFormatter.ofPattern(DATE_PATTERN);

        String plus_date = null;

        ZonedDateTime old_date = ZonedDateTime.of(LocalDateTime.parse(date, format), ZoneId.of(UTC)).minusSeconds(1L);

        switch (type) {
            case DateTypeName.SECOND:
                plus_date = old_date.plusSeconds(bounds).format(format);
                break;
            case DateTypeName.MINUTE:
                plus_date = old_date.plusMinutes(bounds).format(format);
                break;
            case DateTypeName.HOUR:
                plus_date = old_date.plusHours(bounds).format(format);
                break;
            case DateTypeName.DAY:
                plus_date = old_date.plusDays(bounds).format(format);
                break;
            case DateTypeName.WEEK:
                plus_date = old_date.plusWeeks(bounds).format(format);
                break;
            case DateTypeName.MONTH:
                plus_date = old_date.plusMonths(bounds).format(format);
                break;
            case DateTypeName.YEAR:
                plus_date = old_date.plusYears(bounds).format(format);
                break;
        }

        return plus_date;
    }

    // 기간 조회 관련 함수 (현재 예약 유효성 검사에서 사용)
    public static Map<String, String> checkDate(String originDate, String formatDate){

        Map<String, String> map = new HashMap<String, String>();

        DateTimeFormatter format = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
    
        // 입력된 날짜 존데이트타임 구함
        ZonedDateTime input_time = ZonedDateTime.of(LocalDateTime.parse(originDate, format), ZoneId.of("UTC"));
        StringBuffer sb = new StringBuffer(formatDate);
        sb.append(" ");
        sb.append("15:00:00");
    
        // 비교할 기준 타임 만들기
        ZonedDateTime standard_time = ZonedDateTime.of(LocalDateTime.parse(sb.toString(), format), ZoneId.of("UTC"));
    
        String begin = null;
        String end = null;
    
        if(input_time.isBefore(standard_time)){
          begin = standard_time.minusDays(1L).format(format);
          end = standard_time.minusSeconds(1L).format(format);
          map.put("begin", begin);
          map.put("end", end);
        }else{
            begin = standard_time.format(format);
            end = standard_time.plusDays(1L).minusSeconds(1L).format(format);
            map.put("begin", begin);
            map.put("end", end);
        }
        return map;

    }

    // 1년 후의 기간을 구해주는 함수
    public static String getOneYearLater() {
        return ZonedDateTime.now(ZoneId.of(UTC)).plusYears(1L).minusDays(1L).format(DateTimeFormatter.ofPattern(DATE_PATTERN));
    }
    // 999년 후의 기간을 구해주는 함수
    public static String getGuGuGuYearLater() {
        return ZonedDateTime.now(ZoneId.of(UTC)).plusYears(999L).minusDays(1L).format(DateTimeFormatter.ofPattern(DATE_PATTERN));
    }
    
}
