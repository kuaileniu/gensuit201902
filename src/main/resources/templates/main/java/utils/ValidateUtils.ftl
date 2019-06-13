package ${gen.utilPackage?replace("/",".")};

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.HashMap;
import java.util.Date;
import java.util.regex.Pattern;
import ${gen.enumPackage?replace("/",".")}.Province;

<#if (gen.showComment==true)>
/**
 * 校验工具
 */
</#if>
public class ValidateUtils {

    private static Logger log = LoggerFactory.getLogger(ValidateUtils.class);

<#if (gen.showComment==true)>
    //省(直辖市)码表
</#if>
    private static String provinceCode[] = {"11", "12", "13", "14", "15", "21", "22",
            "23", "31", "32", "33", "34", "35", "36", "37", "41", "42", "43",
            "44", "45", "46", "50", "51", "52", "53", "54", "61", "62", "63",
            "64", "65", "71", "81", "82", "91"};

<#if (gen.showComment==true)>
    //身份证前17位每位加权因子
</#if>
    private static int[] power = {7, 9, 10, 5, 8, 4, 2, 1, 6, 3, 7, 9, 10, 5, 8, 4, 2};

<#if (gen.showComment==true)>
    //身份证第18位校检码
</#if>
    private static String[] refNumber = {"1", "0", "X", "9", "8", "7", "6", "5", "4", "3", "2"};

<#if (gen.showComment==true)>
    /**
     * 对外提供的调用接口
     * 二代身份证号码有效性校验
     * 二代身份证编码规则及校验代码实现   https://blog.csdn.net/embracejava/article/details/77341740
     * @param idNo
     * @return true 有效;
     */
</#if>
    public static boolean isValidIdNo(String idNo) {
        return (idNo != null) && isIdNoPattern(idNo) && isValidProvinceId(idNo.substring(0, 2))
                && isValidDate(idNo.substring(6, 14)) && checkIdNoLastNum(idNo);
    }

<#if (gen.showComment==true)>
    /**
     * 二代身份证正则表达式
     *
     * @param idNo
     * @return
     */
</#if>
    private static boolean isIdNoPattern(String idNo) {
        return Pattern.matches("^[1-9]\\d{5}[1-9]\\d{3}((0\\d)|(1[0-2]))(([0|1|2]\\d)|3[0-1])\\d{3}([\\d|x|X]{1})$", idNo);
    }

<#if (gen.showComment==true)>
    /**
     * 检查身份证的(qi前两位)省份信息是否正确
     *
     * @param provinceId
     * @return
     */
</#if>
    public static boolean isValidProvinceId(String provinceId) {
        for (String id : provinceCode) {
            if (id.equals(provinceId)) {
                return true;
            }
        }
        return false;
    }

<#if (gen.showComment==true)>
    /**
     * 判断中间的六位日期是否有效
     * 判断日期是否有效
     *
     * @param inDate
     * @return
     */
</#if>
    public static boolean isValidDate(String inDate) {
        if (inDate == null) {
            return false;
        }
        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyyMMdd");
        if (inDate.trim().length() != dateFormat.toPattern().length()) {
            return false;
        }
        dateFormat.setLenient(false);//执行严格的日期匹配
        try {
            dateFormat.parse(inDate.trim());
        } catch (ParseException e) {
            return false;
        }
        return true;
    }

<#if (gen.showComment==true)>
    /**
     * 计算身份证的第十八位校验码
     *
     * @param cardIdArray
     * @return
     */
</#if>
    public static String sumPower(int[] cardIdArray) {
        int result = 0;
        for (int i = 0; i < power.length; i++) {
            result += power[i] * cardIdArray[i];
        }
        return refNumber[(result % 11)];
    }

<#if (gen.showComment==true)>
    /**
     * 校验身份证第18位是否正确(只适合18位身份证)
     *
     * @param idNo
     * @return
     */
</#if>
    public static boolean checkIdNoLastNum(String idNo) {
        if (idNo.length() != 18) {
            return false;
        }
        char[] tmp = idNo.toCharArray();
        int[] cardidArray = new int[tmp.length - 1];
        int i = 0;
        for (i = 0; i < tmp.length - 1; i++) {
            cardidArray[i] = Integer.parseInt(tmp[i] + "");
        }
        String checkCode = sumPower(cardidArray);
        String lastNum = tmp[tmp.length - 1] + "";
        if (lastNum.equals("x")) {
            lastNum = lastNum.toUpperCase();
        }
        if (!checkCode.equals(lastNum)) {
            return false;
        }
        return true;
    }

<#if (gen.showComment==true)>
    /**
     * 获取性别
     * 身份证号倒数第二位奇数表示男生，偶数表示女生
     * @param idNo
     * @return 男 or 女
     */
</#if>
    public static String getSex(String idNo) {
        if (!isValidIdNo(idNo)) {
            return null;
        }
        char sexChar = idNo.charAt(idNo.length() - 2);
        byte sexByte = Byte.parseByte(sexChar + "");
        return sexByte % 2 == 0 ? "女" : "男";
    }

<#if (gen.showComment==true)>
    /**
     * 从身份证号中获取出生年月日
     * @param idNo
     * @return
     */
</#if>
    public static String getBirthDay(String idNo) {
        if (idNo == null || idNo.length() != 18) {
            return null;
        }
        String startNum = idNo.substring(0, 17);
        if (!StringUtil.isNumeric(startNum)) {
            return null;
        }
        return StringUtil.substring(idNo,6,14);
    }

<#if (gen.showComment==true)>
    /**
     * 从身份证号中获取出生年月日
     * @param idNo
     * @return java.util.Date
     */
</#if>
    public static Date getBirthDate(String idNo) {
        if (idNo == null || idNo.length() != 18) {
            return null;
        }
        String startNum = idNo.substring(0, 17);
        if (!StringUtil.isNumeric(startNum)) {
            return null;
        }
        String birthday = StringUtil.substring(idNo, 6, 14);
        return StringUtil.toDate(birthday, "yyyyMMdd");
    }

    public static HashMap<String, Province> codeProvince = new HashMap<String, Province>();

    static {
        codeProvince.put("11", Province.beiJing);
        codeProvince.put("12", Province.tianJin);
        codeProvince.put("13", Province.heBei);
        codeProvince.put("14", Province.shanXi1);
        codeProvince.put("15", Province.neiMengGu);
        codeProvince.put("21", Province.liaoNing);
        codeProvince.put("22", Province.jiLin);
        codeProvince.put("23", Province.heiLongJiang);
        codeProvince.put("31", Province.shangHai);
        codeProvince.put("32", Province.jiangSu);
        codeProvince.put("33", Province.zheJiang);
        codeProvince.put("34", Province.anHui);
        codeProvince.put("35", Province.fuJian);
        codeProvince.put("36", Province.jiangXi);
        codeProvince.put("37", Province.shanDong);
        codeProvince.put("41", Province.heNan);
        codeProvince.put("42", Province.huBei);
        codeProvince.put("43", Province.huNan);
        codeProvince.put("44", Province.guangDong);
        codeProvince.put("45", Province.guangXi);
        codeProvince.put("46", Province.haiNan);
        codeProvince.put("50", Province.chongQing);
        codeProvince.put("51", Province.siChuan);
        codeProvince.put("52", Province.guiZhou);
        codeProvince.put("53", Province.yunNan);
        codeProvince.put("54", Province.xiZang);
        codeProvince.put("61", Province.shanXi3);
        codeProvince.put("62", Province.ganSu);
        codeProvince.put("63", Province.qingHai);
        codeProvince.put("64", Province.ningXia);
        codeProvince.put("65", Province.xinJiang);
        codeProvince.put("71", Province.taiWan);
        codeProvince.put("81", Province.xiangGang);
        codeProvince.put("82", Province.aoMen);
        codeProvince.put("91", Province.guoWai);
    }

<#if (gen.showComment==true)>
    /**
     * 根据身份证号判断所属省份
     * @param idNo
     * @return
     */
</#if>
    public static Province province(String idNo) {
        if (!isValidIdNo(idNo)) {
            return null;
        }
        return codeProvince.get(idNo.substring(0, 2));
    }
}