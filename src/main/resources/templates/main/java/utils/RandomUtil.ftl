package ${gen.utilPackage?replace("/",".")};

import java.util.*;

import java.util.*;

<#if (gen.showComment==true)>
/**
 * 生成随机数或随机字母
 */
</#if>
public class RandomUtil {

    public final static String[] numArray = {"0", "1", "2", "3", "4", "5", "6", "7", "8", "9"};
    public final static char[] charArray = {'A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J',
            'K', 'L', 'M', 'N', 'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'W',
            'X', 'Y', 'Z'};
    public final static char[] codeSequence = {'A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J',
            'K', 'L', 'M', 'N', 'O', 'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'W',
            'X', 'Y', 'Z', '0', '1', '2', '3', '4', '5', '6', '7', '8', '9'};
    public final static Random random = new Random();

<#if (gen.showComment==true)>
    //生成8位数字与字母组合的字符串
</#if>
    public static String getNumAndChar(int n) {
        int charCount = random.nextInt(n - 1);
        if (charCount < 1) {
            charCount = 1;
        }
        int numCount = n - charCount;
        String chars = getRandomChar(charCount);
        String nums = getRandomNum(numCount);
        String str = chars + nums;
        return mix(str);
    }

<#if (gen.showComment==true)>
    //将字符串中的字符顺序混淆
</#if>
    public static String mix(String str) {
        int length = str.length();
        List<String> list = new ArrayList();
        for (int i = 0; i < length; i++) {
            list.add(str.substring(i, i + 1));
        }
        Collections.shuffle(list);
        StringBuilder sb = new StringBuilder();
        for (String s : list) {
            sb.append(s);
        }
        return sb.toString();
    }

<#if (gen.showComment==true)>
    //将字符串中的字符顺序混淆
</#if>
    public static String mix(List<String> list) {
        Collections.shuffle(list);
        StringBuilder sb = new StringBuilder();
        for (String s : list) {
            sb.append(s);
        }
        return sb.toString();
    }

<#if (gen.showComment==true)>
    //获取随机n个字母
</#if>
    public static String getRandomChar(int i) {
        String randChar = "";
        for (int k = 0; k < i; k++) {
            randChar += charArray[new Random().nextInt(charArray.length)];
        }
        return randChar;
    }

<#if (gen.showComment==true)>
    /**
     * 生成num位的随机数
     * @param num 要随机生成的位数
     */
</#if>
    public static String getRandomNum(int num) {
        StringBuilder rand = new StringBuilder(num);
        for (int i = 0; i < num; i++) {
            rand.append(numArray[new Random().nextInt(numArray.length)]);
        }
        return rand.toString();
    }

<#if (gen.showComment==true)>
    /**
     * 生成不多于n位的随机数
     *
     * @param n
     * @return
     */
</#if>
    public static String getNoMoreBitRandomNum(int n) {
        int num = random.nextInt(n);
        return getRandomNum(num);
    }

<#if (gen.showComment==true)>
    /**
     * 生成不大于
     *
     * @param max
     * @return
     */
</#if>
    public static int noGreaterThan(int max) {
        return random.nextInt(max);
    }
}
