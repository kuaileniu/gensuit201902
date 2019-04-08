package ${gen.utilPackage?replace("/",".")};

import java.io.*;
import java.net.*;
import java.text.DecimalFormat;
import java.util.regex.Matcher;
import java.util.regex.Pattern;
import java.util.*;
import java.math.BigDecimal;
import com.google.gson.*;
import java.lang.reflect.Type;
import org.apache.commons.lang3.time.FastDateFormat;

/**
 *
 */
public class StringUtil {
    private static Gson gson = new GsonBuilder()
            .setDateFormat("yyyy-MM-dd HH:mm:ss")
            .create();

    public static final String EMPTY = "";

    public static boolean isEmpty(final CharSequence cs) {
        return cs == null || cs.length() == 0;
    }

<#if (gen.showComment==true)>
    /**
     * return false if null or "" or "   "
     */
</#if>
    public static boolean isNotBlank(final CharSequence cs) {
        return !isBlank(cs);
    }

<#if (gen.showComment==true)>
    /**
     * return true if null or "" or "   "
     */
</#if>
    public static boolean isBlank(final CharSequence cs) {
        int strLen;
        if (cs == null || (strLen = cs.length()) == 0) {
            return true;
        }
        for (int i = 0; i < strLen; i++) {
            if (Character.isWhitespace(cs.charAt(i)) == false) {
                return false;
            }
        }
        return true;
    }

<#if (gen.showComment==true)>
    /**
     * 相同并且都不为空及"" ,"  "
     *
     * @param a
     * @param b
     * @return true 相同且不为空;
     */
</#if>
    public static boolean equalsNotBlank(final String a, final String b) {
        if (isBlank(a) || isBlank(b)) {
            return false;
        }
        return a.equals(b);
    }

<#if (gen.showComment==true)>
    /**
     * 都不为空及"" ,"  "且都不相同
     *
     * @param a
     * @param b
     * @return true  不为空且不相同;
     */
</#if>
    public static boolean notEqualsNotBlank(final String a, final String b) {
        return !equalsNotBlank(a, b);
    }
//    1.用JAVA自带的函数
    public static boolean isNumeric(String str){
        for (int i = 0; i < str.length(); i++){
            if (!Character.isDigit(str.charAt(i))){
                return false;
            }
        }
        return true;
    }


<#if (gen.showComment==true)>
//    2.用正则表达式
//    表达式修改为“^-?[0-9]+”即可，修改为“-?[0-9]+.?[0-9]+”即可匹配所有数字。
</#if>
    public static boolean isNumericWithMatcher(String str){
        Pattern pattern = Pattern.compile("[0-9]*");
        Matcher isNum = pattern.matcher(str);
        if( !isNum.matches() ){
            return false;
        }
        return true;
    }

<#if (gen.showComment==true)>
    /**
     * 是金额数字
     *
     * @param str
     * @return true，是金额数字;
     */
</#if>
    public static boolean isMoney(final String str) {
        if(str==null){
            return false;
        }
        int length = str.length();
        char firstChar = str.charAt(0);
        //首字符是否是0到9之间的数字
        if (firstChar < '0' || firstChar > '9') {
            return false;
        }
        //是否含两个点符号
        int pointCount = 0;
        for (int i = 0; i < length; i++) {
            char c = str.charAt(i);
            if (c == '.') {
                pointCount++;
            }
        }
        if (pointCount > 1) {
            return false;
        }
        //含有非0-9、逗号、点的字符
        for (int i = 0; i < length; i++) {
            char c = str.charAt(i);
            if ((c < '0' || c > '9') && (c != '.') && (c != ',')) {
                return false;
            }
        }
        return true;
    }

    public static BigDecimal toDecimal(String money) {
        money = replaceChars(money, ",", "");
        return new BigDecimal(money);
    }

<#if (gen.showComment==true)>	
    /**
     * @param str       http://odm.zhsit.cn/api/files/download/204xosu1i54ulhk6wet1zmvhq
     * @param separator "/"
     * @return separator "/" 返回 204xosu1i54ulhk6wet1zmvhq  ；separator "\\" 返回 "http://odm.zhsit.cn/api/files/download/204xosu1i54ulhk6wet1zmvhq"
     */
</#if>	 
    public static String fromLastSeparator(String str, String separator) {
        int start = str.lastIndexOf(separator);
        int end = str.length();
        return substring(str, start + 1, end);
    }

    public static String replaceChars(final String str, final String searchChars, String replaceChars) {
        if (isEmpty(str) || isEmpty(searchChars)) {
            return str;
        }
        if (replaceChars == null) {
            replaceChars = EMPTY;
        }
        boolean modified = false;
        final int replaceCharsLength = replaceChars.length();
        final int strLength = str.length();
        final StringBuilder buf = new StringBuilder(strLength);
        for (int i = 0; i < strLength; i++) {
            final char ch = str.charAt(i);
            final int index = searchChars.indexOf(ch);
            if (index >= 0) {
                modified = true;
                if (index < replaceCharsLength) {
                    buf.append(replaceChars.charAt(index));
                }
            } else {
                buf.append(ch);
            }
        }
        if (modified) {
            return buf.toString();
        }
        return str;
    }

    public static String trim(String str) {
        return str == null ? null : str.trim();
    }

    public static String substring(final String str, int start, int end) {
        if (str == null) {
            return null;
        }

        // handle negatives
        if (end < 0) {
            end = str.length() + end; // remember end is negative
        }
        if (start < 0) {
            start = str.length() + start; // remember start is negative
        }

        // check length next
        if (end > str.length()) {
            end = str.length();
        }

        // if start is greater than end, return ""
        if (start > end) {
            return EMPTY;
        }

        if (start < 0) {
            start = 0;
        }
        if (end < 0) {
            end = 0;
        }

        return str.substring(start, end);
    }

<#if (gen.showComment==true)>
    /**
     * 截取后n位长度
     *
     * @param str
     * @param n
     * @return
     */
</#if>
    public static String subLastN(String str, int n) {
        if (str == null || str.length() < n) {
            return str;
        }
        int begin = str.length() - n;
        return str.substring(begin);
    }

<#if (gen.showComment==true)>
    /**
     * 截取前n位字符
     *
     * @param str
     * @param n
     * @return
     */
</#if>
    public static String subFrontN(String str, int n) {
        if (str == null || str.length() < n) {
            return str;
        }
        return str.substring(0,n);
    }

<#if (gen.showComment==true)>
    /**
     * 不够要求总位数的情况下，前面填充字符
     *
     * @param sourceNum 源
     * @param totalBit  要求总位数
     * @param fillChar  填充的字符
     * @return 填充后的字符串
     */
</#if>
    public static String fillFront(final long sourceNum, final int totalBit, final char fillChar) {
        String sourceNumStr = sourceNum + "";
        int currentBit = sourceNumStr.length();
        if (currentBit >= totalBit) {
            return sourceNumStr;
        }
        int cha = totalBit - currentBit;
        String fillChars = "";
        for (int i = 0; i < cha; i++) {
            fillChars += fillChar;
        }
        return fillChars + sourceNumStr;
    }

<#if (gen.showComment==true)>
    /**
     * 根据文件全名获取文件后缀
     *
     * @param fileName
     * @return 不含".",例 "png"
     */
</#if>
    public static String filePostfix(String fileName) {
        if (!fileName.contains(".")) {
            return null;
        }
        int lastIndexOfPoint = fileName.lastIndexOf(".");
        return fileName.substring(lastIndexOfPoint + 1);
    }

<#if (gen.showComment==true)>
    /**
     * 1.去除空格：s = s.replace('\\s','');
     * 2.去除回车：s = s.replace('\n','');
     * 注：\n 回车(\u000a)       \t 水平制表符(\u0009)       \s 空格(\u0008)       \r 换行(\u000d)
     */
</#if>
    public static String replaceBlank(String str) {
        String dest = "";
        if (str != null) {
            Pattern p = Pattern.compile("\\s*|\t|\r|\n");
            Matcher m = p.matcher(str);
            dest = m.replaceAll("");
        }
        return dest;
    }

<#if (gen.showComment==true)>	
    /**
     * 
     * @param bool 
     * @return bool是否为true
     */
</#if>
    public static boolean isTrue(Object bool) {
        if (bool instanceof Boolean) {
            return true == ((Boolean) bool).booleanValue();
        } else if (bool instanceof String) {
            return "true".equals(bool);
        }
        return false;
    }

    private static class LongDefault0Adapter implements JsonSerializer<Long>, JsonDeserializer<Long> {
        @Override
        public Long deserialize(JsonElement json, Type typeOfT, JsonDeserializationContext context)
                throws JsonParseException {
            try {
                if (json.getAsString().equals("") || json.getAsString().equals("null")) {//定义为long类型,如果后台返回""或者null,则返回0
                    return 0l;
                }
            } catch (Exception ignore) {
            }
            try {
                return json.getAsLong();
            } catch (NumberFormatException e) {
                throw new JsonSyntaxException(e);
            }
        }

        @Override
        public JsonElement serialize(Long src, Type typeOfSrc, JsonSerializationContext context) {
            return new JsonPrimitive(src);
        }
    }

    private static class IntegerDefault0Adapter implements JsonSerializer<Integer>, JsonDeserializer<Integer> {
        @Override
        public Integer deserialize(JsonElement json, Type typeOfT, JsonDeserializationContext context)
                throws JsonParseException {
            try {
                if (json.getAsString().equals("") || json.getAsString().equals("null")) {//定义为int类型,如果后台返回""或者null,则返回0
                    return 0;
                }
            } catch (Exception ignore) {
            }
            try {
                return json.getAsInt();
            } catch (NumberFormatException e) {
                throw new JsonSyntaxException(e);
            }
        }

        @Override
        public JsonElement serialize(Integer src, Type typeOfSrc, JsonSerializationContext context) {
            return new JsonPrimitive(src);
        }
    }

    private static class DoubleDefault0Adapter implements JsonSerializer<Double>, JsonDeserializer<Double> {
        @Override
        public Double deserialize(JsonElement json, Type typeOfT, JsonDeserializationContext context) throws JsonParseException {
            try {
                if (json.getAsString().equals("") || json.getAsString().equals("null")) {//定义为double类型,如果后台返回""或者null,则返回0.00
                    return 0.00;
                }
            } catch (Exception ignore) {
            }
            try {
                return json.getAsDouble();
            } catch (NumberFormatException e) {
                throw new JsonSyntaxException(e);
            }
        }

        @Override
        public JsonElement serialize(Double src, Type typeOfSrc, JsonSerializationContext context) {
            return new JsonPrimitive(src);
        }
    }

    public static Gson buildGson(String timePattern) {
        return new GsonBuilder()
                .setDateFormat(timePattern)
                .registerTypeAdapter(Integer.class, new IntegerDefault0Adapter())
                .registerTypeAdapter(int.class, new IntegerDefault0Adapter())
                .registerTypeAdapter(Double.class, new DoubleDefault0Adapter())
                .registerTypeAdapter(double.class, new DoubleDefault0Adapter())
                .registerTypeAdapter(Long.class, new LongDefault0Adapter())
                .registerTypeAdapter(long.class, new LongDefault0Adapter())
                .create();
    }

<#if (gen.showComment==true)>
    /**
     * yyyy-MM-dd HH:mm:ss
     **/
</#if>
    public static String toJson(Object src, String timePattern) {
        return new GsonBuilder()
                .setDateFormat(timePattern)
                .create().toJson(src);
    }

    public static String toJson(Object src) {
        return gson.toJson(src);
    }

    public static <T> T fromJson(String json,Class<T> t) {
        return gson.fromJson(json, t);
    }

    //List<CloudFront> list = x.fromJson(msg, new TypeToken<List<CloudFront>>() {}.getType());
    public static  <T> T fromJson(String json, Type type){
        return gson.fromJson(json, type);
    }

<#if (gen.showComment==true)>
    /**
     * 分割字符串进SET
     */
 </#if>
    public static Set<String> split(String str) {
        return split(str, ",");
    }

<#if (gen.showComment==true)>
    /**
     * 分割字符串进SET
     */
</#if>
    public static Set<String> split(String str, String separator) {
        Set<String> set = new HashSet<>();
        if (str == null || str.trim() ==""){
            return set;
        }
        for (String s : str.split(separator)) {
            set.add(s);
        }
        return set;
    }

<#if (gen.showComment==true)>
    /**
     * 将字符串转换成日期 yyyy-MM-dd HH:mm:ss.SSS
     **/
</#if>
    public static Date toDate(String dateTime, String pattern) {
        try {
            return FastDateFormat.getInstance(pattern).parse(dateTime);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

<#if (gen.showComment==true)>
    /**
     * 抽取日期中的年yyyy，月，日，时，分，秒
     * @param date
     * @param pattern  yyyy-MM-dd HH:mm:ss.SSS
     * @return
    */
</#if>
    public static String fromDate(Date date,String pattern){
        return FastDateFormat.getInstance(pattern).format(date);
    }

<#if (gen.showComment==true)>
    /**
     * 获取当日 00:00:00的时间
     * @return 2018-10-13 00:00:00
     */
</#if>
    public static String today000000() {
        Calendar calendar = Calendar.getInstance();
        // 时
        calendar.set(Calendar.HOUR_OF_DAY, 0);
        // 分
        calendar.set(Calendar.MINUTE, 0);
        // 秒
        calendar.set(Calendar.SECOND, 0);
        // 毫秒
        calendar.set(Calendar.MILLISECOND, 0);
        Date time = calendar.getTime();
        //"yyyy-MM-dd HH:mm:ss.SSS"
        return fromDate(time,"yyyy-MM-dd HH:mm:ss");
    }

<#if (gen.showComment==true)>
   /**
    *
    * @return 今日年月日
    */
</#if>
    public static String today() {
        Calendar calendar = Calendar.getInstance();
        return fromDate(calendar.getTime(), "yyyyMMdd");
    }

    public static String yesterday() {
        Calendar calendar = Calendar.getInstance();
        calendar.add(Calendar.DATE,-1);
        return fromDate(calendar.getTime(),"yyyyMMdd");
    }

<#if (gen.showComment==true)>
    /**
     * 获取当前时间的字符串
     * @return
     */
</#if>
    public static String currentHHMMddHHmmss(){
        return FastDateFormat.getInstance("yyyyMMddHH:mm:ss").format(new Date());
    }

<#if (gen.showComment==true)>
    /**
     * #.00 表示两位小数 #.0000四位小数,超过位数的部分四舍五入
     *
     * @param bigDecimal
     * @return
    */
</#if>
    public static String decimalFormat(BigDecimal bigDecimal) {
        if (null == bigDecimal) {
            return null;
        }
        DecimalFormat df = new DecimalFormat("#.00");
        return df.format(bigDecimal);
    }

<#if (gen.showComment==true)>
    /**
     * 是否含有
     *
     * @param seq
     * @param searchSeq
     * @return
     */
</#if>
    public static boolean contains(CharSequence seq, CharSequence searchSeq) {
        if (seq != null && searchSeq != null) {
            return indexOf(seq, searchSeq, 0) >= 0;
        } else {
            return false;
        }
    }

<#if (gen.showComment==true)>
    /**
     * 是否含有(忽略大小写)
     *
     * @param str
     * @param searchStr
     * @return
     */
</#if>
    public static boolean containsIgnoreCase(CharSequence str, CharSequence searchStr) {
        if (str != null && searchStr != null) {
            int len = searchStr.length();
            int max = str.length() - len;

            for (int i = 0; i <= max; ++i) {
                if (regionMatches(str, true, i, searchStr, 0, len)) {
                    return true;
                }
            }
            return false;
        } else {
            return false;
        }
    }

<#if (gen.showComment==true)>
    /**
     * 是否含空格
     *
     * @param seq
     * @return
     */
</#if>
    public static boolean containsWhitespace(CharSequence seq) {
        if (isEmpty(seq)) {
            return false;
        } else {
            int strLen = seq.length();

            for (int i = 0; i < strLen; ++i) {
                if (Character.isWhitespace(seq.charAt(i))) {
                    return true;
                }
            }
            return false;
        }
    }

    static int indexOf(CharSequence cs, CharSequence searchChar, int start) {
        return cs.toString().indexOf(searchChar.toString(), start);
    }


    static boolean regionMatches(CharSequence cs, boolean ignoreCase, int thisStart, CharSequence substring, int start, int length) {
        if (cs instanceof String && substring instanceof String) {
            return ((String) cs).regionMatches(ignoreCase, thisStart, (String) substring, start, length);
        } else {
            int index1 = thisStart;
            int index2 = start;
            int tmpLen = length;
            int srcLen = cs.length() - thisStart;
            int otherLen = substring.length() - start;
            if (thisStart >= 0 && start >= 0 && length >= 0) {
                if (srcLen >= length && otherLen >= length) {
                    while (tmpLen-- > 0) {
                        char c1 = cs.charAt(index1++);
                        char c2 = substring.charAt(index2++);
                        if (c1 != c2) {
                            if (!ignoreCase) {
                                return false;
                            }

                            if (Character.toUpperCase(c1) != Character.toUpperCase(c2) && Character.toLowerCase(c1) != Character.toLowerCase(c2)) {
                                return false;
                            }
                        }
                    }
                    return true;
                } else {
                    return false;
                }
            } else {
                return false;
            }
        }
    }

<#if (gen.showComment==true)>
    /**
     * 汉语中数字大写
     */
</#if>
    private static final String[] CN_UPPER_NUMBER = {"零", "壹", "贰", "叁", "肆", "伍", "陆", "柒", "捌", "玖"};

<#if (gen.showComment==true)>
    /**
     * 汉语中货币单位大写，这样的设计类似于占位符
     */
</#if>
    private static final String[] CN_UPPER_MONETRAY_UNIT = {"分", "角", "元", "拾", "佰", "仟", "万", "拾", "佰", "仟", "亿", "拾", "佰", "仟", "兆", "拾", "佰", "仟"};

<#if (gen.showComment==true)>
    /**
     * 特殊字符：整
     */
</#if>
    private static final String CN_FULL = "整";

<#if (gen.showComment==true)>
    /**
     * 特殊字符：负
     */
</#if>
    private static final String CN_NEGATIVE = "负";

<#if (gen.showComment==true)>
    /**
     * 金额的精度，默认值为2
     */
</#if>
    private static final int MONEY_PRECISION = 2;

<#if (gen.showComment==true)>
    /**
     * 特殊字符：零元整
     */
</#if>
    private static final String CN_ZEOR_FULL = "零元" + CN_FULL;

<#if (gen.showComment==true)>
    /**
     * 把输入的金额转换为汉语中人民币的大写
     * BigDecimal numberOfMoney = new BigDecimal("65321.0100");
     * String s = number2CN(numberOfMoney); //陆万伍仟叁佰贰拾壹元零壹分
     * 65321.00  陆万伍仟叁佰贰拾壹元整
     * @param numberOfMoney 输入的金额
     * @return 对应的汉语大写
     */
</#if>
    public static String number2CN(BigDecimal numberOfMoney) {
        StringBuffer sb = new StringBuffer();
        // -1, 0, or 1 as the value of this BigDecimal is negative, zero, or
        // positive.
        int signum = numberOfMoney.signum();
        // 零元整的情况
        if (signum == 0) {
            return CN_ZEOR_FULL;
        }
        //这里会进行金额的四舍五入
        long number = numberOfMoney.movePointRight(MONEY_PRECISION)
                .setScale(0, 4).abs().longValue();
        // 得到小数点后两位值
        long scale = number % 100;
        int numUnit = 0;
        int numIndex = 0;
        boolean getZero = false;
        // 判断最后两位数，一共有四中情况：00 = 0, 01 = 1, 10, 11
        if (!(scale > 0)) {
            numIndex = 2;
            number = number / 100;
            getZero = true;
        }
        if ((scale > 0) && (!(scale % 10 > 0))) {
            numIndex = 1;
            number = number / 10;
            getZero = true;
        }
        int zeroSize = 0;
        while (true) {
            if (number <= 0) {
                break;
            }
            // 每次获取到最后一个数
            numUnit = (int) (number % 10);
            if (numUnit > 0) {
                if ((numIndex == 9) && (zeroSize >= 3)) {
                    sb.insert(0, CN_UPPER_MONETRAY_UNIT[6]);
                }
                if ((numIndex == 13) && (zeroSize >= 3)) {
                    sb.insert(0, CN_UPPER_MONETRAY_UNIT[10]);
                }
                sb.insert(0, CN_UPPER_MONETRAY_UNIT[numIndex]);
                sb.insert(0, CN_UPPER_NUMBER[numUnit]);
                getZero = false;
                zeroSize = 0;
            } else {
                ++zeroSize;
                if (!(getZero)) {
                    sb.insert(0, CN_UPPER_NUMBER[numUnit]);
                }
                if (numIndex == 2) {
                    if (number > 0) {
                        sb.insert(0, CN_UPPER_MONETRAY_UNIT[numIndex]);
                    }
                } else if (((numIndex - 2) % 4 == 0) && (number % 1000 > 0)) {
                    sb.insert(0, CN_UPPER_MONETRAY_UNIT[numIndex]);
                }
                getZero = true;
            }
            // 让number每次都去掉最后一个数
            number = number / 10;
            ++numIndex;
        }
        // 如果signum == -1，则说明输入的数字为负数，就在最前面追加特殊字符：负
        if (signum == -1) {
            sb.insert(0, CN_NEGATIVE);
        }
        // 输入的数字小数点后两位为"00"的情况，则要在最后追加特殊字符：整
        if (!(scale > 0)) {
            sb.append(CN_FULL);
        }
        return sb.toString();
    }

<#if (gen.showComment==true)>
    /**
     * 末尾无元整俩字（针对众签合同模板）
     * 把输入的金额转换为汉语中人民币的大写
     * BigDecimal numberOfMoney = new BigDecimal("65321.0100");
     * String s = number2CN(numberOfMoney); //陆万伍仟叁佰贰拾壹元零壹分
     * 65321.00  陆万伍仟叁佰贰拾壹
     * @param numberOfMoney 输入的金额
     * @return 对应的汉语大写
     */
</#if>
    public static String number2CNNoYuanZheng(BigDecimal numberOfMoney) {
         String cn = number2CN(numberOfMoney);
         if(cn.endsWith("元整")){
             return cn.substring(0,cn.length()-2);
         }
         return cn;
    }

<#if (gen.showComment==true)>
    /**
     * 获取n（小于19位） 的随机数
     * @param bits
     * @return
     */
</#if>
    public static String getNString(int bits) {
        String random = System.currentTimeMillis() + "";
        return subLastN(random, bits);
    }

<#if (gen.showComment==true)>
    /**
     * 获取分隔符前面的字符串
     */
</#if>
    public static String substringBefore(String str, String separator) {
        if (!isEmpty(str) && separator != null) {
            if (separator.isEmpty()) {
                return "";
            } else {
                int pos = str.indexOf(separator);
                return pos == -1 ? str : str.substring(0, pos);
            }
        } else {
            return str;
        }
    }

<#if (gen.showComment==true)>
    /**
     * Decodes the passed UTF-8 String using an algorithm that's compatible with
     * JavaScript's <code>decodeURIComponent</code> function. Returns
     * <code>null</code> if the String is <code>null</code>.
     *
     * @param s The UTF-8 encoded String to be decoded
     * @return the decoded String
     */
</#if>
    public static String decodeURIComponent(String s) {
        if (s == null) {
            return null;
        }
        String result = null;
        try {
            result = URLDecoder.decode(s, "UTF-8");
        } catch (UnsupportedEncodingException e) { // This exception should never occur.
            result = s;
        }
        return result;
    }

<#if (gen.showComment==true)>
    /**
     * Encodes the passed String as UTF-8 using an algorithm that's compatible
     * with JavaScript's <code>encodeURIComponent</code> function. Returns
     * <code>null</code> if the String is <code>null</code>.
     *
     * @param s The String to be encoded
     * @return the encoded String
     */
</#if>
    public static String encodeURIComponent(String s) {
        String result = null;
        try {
            result = URLEncoder.encode(s, "UTF-8")
                    .replaceAll("\\+", "%20")
                    .replaceAll("\\%21", "!")
                    .replaceAll("\\%27", "'")
                    .replaceAll("\\%28", "(")
                    .replaceAll("\\%29", ")")
                    .replaceAll("\\%7E", "~");
        } catch (UnsupportedEncodingException e) {
            result = s;
        }

        return result;
    }

<#if (gen.showComment==true)>
    /**
     * @param yaNfuM 押一付年
     * @param yaOrFu 押，求押的月数；付，求付的月数；
     * @return
     */
</#if>	 
    public static Integer monthNum(String yaNfuM, String yaOrFu) {
        if (yaNfuM == null) {
            return null;
        }
        yaNfuM = yaNfuM.substring(1);
        String[] months = yaNfuM.split("付");
        if (months.length == 1) {
            return null;
        }
        if ("押".equals(yaOrFu)) {
            return numConvert(months[0]);
        } else if ("付".equals(yaOrFu)) {
            return numConvert(months[1]);
        }
        return null;
    }
	
<#if (gen.showComment==true)>	
	/**
     * 中文月份转数字
     * @param hanZi
     * @return
     */
</#if>		 
    public static Integer numConvert(String hanZi) {
        switch (hanZi) {
            case "0":
            case "零":
            case "O":
            case "o":
                return 0;
            case "一":
            case "壹":
            case "1":
                return 1;
            case "二":
            case "貳":
            case "2":
                return 2;
            case "三":
            case "叁":
            case "3":
                return 3;
            case "四":
            case "肆":
            case "4":
                return 4;
            case "五":
            case "伍":
            case "5":
                return 5;
            case "六":
            case "陸":
            case "6":
                return 6;
            case "七":
            case "柒":
            case "7":
                return 7;
            case "八":
            case "捌":
            case "8":
                return 8;
            case "九":
            case "久":
            case "9":
                return 9;
            case "十":
            case "拾":
            case "10":
                return 10;
            case "十一":
            case "拾壹":
            case "拾一":
            case "十壹":
            case "11":
                return 11;
            case "十二":
            case "拾二":
            case "拾貳":
            case "十貳":
            case "年":
            case "12":
                return 12;
            default:
                return null;
        }
    }	

<#if (gen.showComment==true)>	
    /**
     * 获取日期对应的周几
     * @param date
     * @return
     */
</#if>	
    public static String date2Week(Date date) {
        Calendar calendar = Calendar.getInstance();
        calendar.setTime(date);
        int w = calendar.get(Calendar.DAY_OF_WEEK) - 1;
        if (w < 0)
            w = 0;
        switch (w) {
            case 0:
                return "周日";
            case 1:
                return "周一";
            case 2:
                return "周二";
            case 3:
                return "周三";
            case 4:
                return "周四";
            case 5:
                return "周五";
            case 6:
                return "周六";
            case 7:
                return "周日";
        }
        return "周日";
    }
	
	
    public static String dateInMonth(Date date) {
        Calendar calendar = Calendar.getInstance();
        calendar.setTime(date);
        int w = calendar.get(Calendar.MONTH) + 1;
        switch (w) {
            case 1:
                return "一月";
            case 2:
                return "二月";
            case 3:
                return "三月";
            case 4:
                return "四月";
            case 5:
                return "五月";
            case 6:
                return "六月";
            case 7:
                return "七月";
            case 8:
                return "八月";
            case 9:
                return "九月";
            case 10:
                return "十月";
            case 11:
                return "十一月";
            case 12:
                return "十二月";
        }
        return "月月";
    }
}