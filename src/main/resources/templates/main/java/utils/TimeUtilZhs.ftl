package ${gen.utilPackage?replace("/",".")};

import java.time.*;
import java.util.Calendar;
import java.util.Date;

/**
 * 时间方面的工具类
 * Java8新特性之日期-时间API https://mp.weixin.qq.com/s/KrZEDBbIERVQzEZ6fSCvHw
 */
public class TimeUtilZhs {

    /**
     * 获取当日 00:00:00的时间
     * @return
     */
    public static Date today000000() {
        Calendar calendar = Calendar.getInstance();
        // 时
        calendar.set(Calendar.HOUR_OF_DAY, 0);
        // 分
        calendar.set(Calendar.MINUTE, 0);
        // 秒
        calendar.set(Calendar.SECOND, 0);
        // 毫秒
        calendar.set(Calendar.MILLISECOND, 0);
        return calendar.getTime();
    }

    /**
     * 获取给定日期的00:00:00的时间
     * @return
     */
    public static Date day000000(Date date) {
        Calendar calendar = Calendar.getInstance();
        calendar.setTime(date);
        // 时
        calendar.set(Calendar.HOUR_OF_DAY, 0);
        // 分
        calendar.set(Calendar.MINUTE, 0);
        // 秒
        calendar.set(Calendar.SECOND, 0);
        // 毫秒
        calendar.set(Calendar.MILLISECOND, 0);
        return calendar.getTime();
    }

    /**
     * 获取给定日期的23:59:59的时间
     * @return
     */
    public static Date day235959(Date date) {
        Calendar calendar = Calendar.getInstance();
        calendar.setTime(date);
        // 时
        calendar.set(Calendar.HOUR_OF_DAY, 23);
        // 分
        calendar.set(Calendar.MINUTE, 59);
        // 秒
        calendar.set(Calendar.SECOND, 59);
        // 毫秒
        calendar.set(Calendar.MILLISECOND, 999);
        return calendar.getTime();
    }

    /**
     * 比较时间
     *
     * @param time1
     * @param time2
     * @return
     * 1 time1 早于time2；
     * 0 time2 等于time2；
     * -1 time1 晚于 time2
     */
    public static int compare(Date time1, Date time2) {
        long cha = time2.getTime() - time1.getTime();
        if (cha > 0) {
            return 1;
        } else if (cha < 0) {
            return -1;
        } else {
            return 0;
        }
    }

    /**
     * @param seconds
     * @return seconds秒后的时间
     */
    public static Date thatSecondTime(int seconds) {
        Calendar calendar = Calendar.getInstance();
        calendar.add(Calendar.SECOND, seconds);
        return calendar.getTime();
    }

    /**
     * @param minute
     * @return minute 分钟后的时间
     */
    public static Date thatMinuteTime(int minute) {
        Calendar calendar = Calendar.getInstance();
        calendar.add(Calendar.MINUTE, minute);
        return calendar.getTime();
    }

    /**
     * @param hour
     * @return hour 小时后的时间
     */
    public static Date thatHourTime(int hour) {
        Calendar calendar = Calendar.getInstance();
        calendar.add(Calendar.HOUR, hour);
        return calendar.getTime();
    }
	
    /**
     * @param hour24 date 那天的第几点
     * @return  date 那天的第几点的时间
     */
    public static Date thatDateHourTime(Date date, int hour24) {
        Calendar calendar = Calendar.getInstance();
        calendar.setTime(date);
        // 时
        calendar.set(Calendar.HOUR_OF_DAY, hour24);
        // 分
        calendar.set(Calendar.MINUTE, 0);
        // 秒
        calendar.set(Calendar.SECOND, 0);
        // 毫秒
        calendar.set(Calendar.MILLISECOND, 0);
        return calendar.getTime();
    }
	
    /**
     * @param date
     * @return date 天后的时间
     */
    public static Date thatDateTime(int date) {
        Calendar calendar = Calendar.getInstance();
        calendar.add(Calendar.DATE, date);
        return calendar.getTime();
    }

    /**
     * @return Year 当前年， 例如 2017
     */
    public static int currentYear(){
        LocalDate localDate = LocalDate.now();
        return localDate.getYear();
    }

    /**
     * @return Month 当前年内的月， 0~12之间
     */
    public static int currentMonth(){
        LocalDate localDate = LocalDate.now();
        return localDate.getMonthValue();
    }

    /**
     * @return Day 当前月内的天， 0~31之间
     */
    public static int currentDay(){
        LocalDate localDate = LocalDate.now();
        return localDate.getDayOfMonth();
    }

    /**
     * @return Hour 当前日内的小时， 0~23之间
     */
    public static int currentHour() {
        LocalTime localTime = LocalTime.now();
        return localTime.getHour();
    }

    /**
     * @return minute 当前小时内的分钟， 0~59之间
     */
    public static int currentMinute() {
        LocalTime localTime = LocalTime.now();
        return localTime.getMinute();
    }

    /**
     * @return second 当前分钟内的秒， 0~59之间
     */
    public static int currentSecond() {
        LocalTime localTime = LocalTime.now();
        return localTime.getSecond();
    }

    public static Date specifiedDate(int year, int month, int dayOfMonth) {
        LocalDate localDate = LocalDate.of(year, month, dayOfMonth);
        ZoneId zoneId = ZoneId.systemDefault();
        ZonedDateTime zdt = localDate.atStartOfDay(zoneId);
        Date date = Date.from(zdt.toInstant());
        return date;
    }

    public static Date specifiedDate(int year, int month, int dayOfMonth, int hour, int minute, int second) {
        LocalDateTime localDateTime = LocalDateTime.of(year, month, dayOfMonth, hour, minute, second);
        return localDateTime2Date(localDateTime);
    }

    public static LocalDate toLocalDate(Date date) {
        Instant instant = date.toInstant();
        ZoneId zoneId = ZoneId.systemDefault();
        LocalDate localDate = instant.atZone(zoneId).toLocalDate();
        return localDate;
    }

    public static Date toDate(LocalDate localDate) {
        ZoneId zoneId = ZoneId.systemDefault();
        ZonedDateTime zdt = localDate.atStartOfDay(zoneId);
        Date date = Date.from(zdt.toInstant());
        return date;
    }

    public static int getYear(Date date){
        LocalDate localDate=toLocalDate(date);
        return localDate.getYear();
    }

    public static int getMonth(Date date){
        LocalDate localDate=toLocalDate(date);
        return localDate.getMonthValue();
    }

    public static int getDay(Date date){
        LocalDate localDate=toLocalDate(date);
        return localDate.getDayOfMonth();
    }

    public static Date localDateTime2Date(LocalDateTime localDateTime) {
        ZoneId zoneId = ZoneId.systemDefault();
        ZonedDateTime zdt = localDateTime.atZone(zoneId);
        Date date = Date.from(zdt.toInstant());
        return date;
    }

}