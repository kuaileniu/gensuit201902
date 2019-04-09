package ${gen.utilPackage?replace("/",".")};

import org.apache.commons.lang3.time.FastDateFormat;
import java.time.*;
import java.util.Calendar;
import java.util.Date;

<#if (gen.showComment==true)>
/**
 * 时间方面的工具类
 * Java8新特性之日期-时间API https://mp.weixin.qq.com/s/KrZEDBbIERVQzEZ6fSCvHw
 */
</#if>
public class TimeUtilZhs {

<#if (gen.showComment==true)>
    /**
     * 获取n天前的时间
     * @return
     */
</#if>
    public static Date nDaysBefore(int n) {
        return nDaysAfter(0 - n);
    }

<#if (gen.showComment==true)>
    /**
     * 获取n 天后的时间
     * @return
     */
</#if>
    public static Date nDaysAfter(int n) {
        Calendar calendar = Calendar.getInstance();
        calendar.add(Calendar.DATE, n);
        return calendar.getTime();
    }

<#if (gen.showComment==true)>
    /**
     * 获取当日 00:00:00的时间
     * @return
     */
</#if>
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

<#if (gen.showComment==true)>
    /**
     * 获取给定日期的00:00:00的时间
     * @return
     */
</#if>
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

<#if (gen.showComment==true)>
    /**
     * 获取给定日期的23:59:59的时间
     * @return
     */
</#if>
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

<#if (gen.showComment==true)>
    /**
     * 获取给定日期的所在月的第一天00:00:00的时间
     * @return
     */
</#if>
    public static Date monthStart(Date date) {
        Calendar calendar = Calendar.getInstance();
        calendar.setTime(date);
        calendar.set(Calendar.DAY_OF_MONTH,1);
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
	
<#if (gen.showComment==true)>
    /**
     * 获取给定日期的所在月的最后一天23:59:59的时间
     * @return
     */
</#if>
    public static Date monthEnd(Date date) {
        Calendar calendar = Calendar.getInstance();
        calendar.setTime(date);
        calendar.add(Calendar.MONTH, 1);
        calendar.set(Calendar.DAY_OF_MONTH,0);
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
	
<#if (gen.showComment==true)>
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
</#if>
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

<#if (gen.showComment==true)>
    /**
     * @param seconds
     * @return seconds秒后的时间
     */
</#if>
    public static Date thatSecondTime(int seconds) {
        Calendar calendar = Calendar.getInstance();
        calendar.add(Calendar.SECOND, seconds);
        return calendar.getTime();
    }

<#if (gen.showComment==true)>
    /**
     * @param minute
     * @return minute 分钟后的时间
     */
</#if>
    public static Date thatMinuteTime(int minute) {
        Calendar calendar = Calendar.getInstance();
        calendar.add(Calendar.MINUTE, minute);
        return calendar.getTime();
    }

<#if (gen.showComment==true)>
    /**
     * @param hour
     * @return hour 小时后的时间
     */
</#if>
    public static Date thatHourTime(int hour) {
        Calendar calendar = Calendar.getInstance();
        calendar.add(Calendar.HOUR, hour);
        return calendar.getTime();
    }

<#if (gen.showComment==true)>
    /**
     * @param hour24 date 那天的第几点
     * @return  date 那天的第几点的时间
     */
</#if>
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

<#if (gen.showComment==true)>
    /**
     * @param date
     * @return date 天后的时间
     */
</#if>
    public static Date thatDateTime(int date) {
        Calendar calendar = Calendar.getInstance();
        calendar.add(Calendar.DATE, date);
        return calendar.getTime();
    }

<#if (gen.showComment==true)>
    /**
     * @return Year 当前年， 例如 2017
     */
</#if>
    public static int currentYear(){
        LocalDate localDate = LocalDate.now();
        return localDate.getYear();
    }

<#if (gen.showComment==true)>
    /**
     * @return Month 当前年内的月， 0~12之间
     */
</#if>
    public static int currentMonth(){
        LocalDate localDate = LocalDate.now();
        return localDate.getMonthValue();
    }

<#if (gen.showComment==true)>
    /**
     * @return Day 当前月内的天， 0~31之间
     */
</#if>
    public static int currentDay(){
        LocalDate localDate = LocalDate.now();
        return localDate.getDayOfMonth();
    }

<#if (gen.showComment==true)>
    /**
     * @return Hour 当前日内的小时， 0~23之间
     */
</#if>
    public static int currentHour() {
        LocalTime localTime = LocalTime.now();
        return localTime.getHour();
    }

<#if (gen.showComment==true)>
    /**
     * @return minute 当前小时内的分钟， 0~59之间
     */
</#if>
    public static int currentMinute() {
        LocalTime localTime = LocalTime.now();
        return localTime.getMinute();
    }

<#if (gen.showComment==true)>
    /**
     * @return second 当前分钟内的秒， 0~59之间
     */
</#if>
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

	
    public static final String[] XingZuoArray = {"水瓶座", "双鱼座", "牡羊座",
            "金牛座", "双子座", "巨蟹座", "狮子座", "处女座", "天秤座", "天蝎座", "射手座", "魔羯座"};
    public static final int[] constellationEdgeDay = {20, 19, 21, 21, 21, 22,
            23, 23, 23, 23, 22, 22};

<#if (gen.showComment==true)>
    /**
     * 谢志权
     *
     * @param date
     * @return 星座
     */
</#if>
    public static String date2XingZuo(Date date) {
        Calendar calendar = Calendar.getInstance();
        calendar.setTime(date);
        int month = calendar.get(Calendar.MONTH);
        int day = calendar.get(Calendar.DAY_OF_MONTH);
        if (day < constellationEdgeDay[month]) {
            month = month - 1;
        }
        if (month >= 0) {
            return XingZuoArray[month];
        }
        // default to return 魔羯
        return XingZuoArray[11];
    }


    public static int dateInMonth(Date date) {
        String month= FastDateFormat.getInstance("yyyyMM").format(date);
        return Integer.valueOf(month);
    }

}