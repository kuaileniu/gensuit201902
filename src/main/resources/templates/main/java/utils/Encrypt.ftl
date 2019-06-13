package ${gen.utilPackage?replace("/",".")};

import javax.crypto.Mac;
import javax.crypto.spec.SecretKeySpec;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

<#if (gen.showComment==true)>
/**
 * 加密类
 */
</#if>
public class Encrypt {

<#if (gen.showComment==true)>
    /**
     * md5 两次
     *
     * @param text
     * @return
     */
</#if>
    public static String pwd(String text) {
        String md5Once = md5(text).substring(2) + "a@9$*.cn";
        return md5(md5Once).substring(2);
    }

<#if (gen.showComment==true)>
    /**
     * 获取加密后的字符串
     *
     * @param text 原文
     * @param key  密钥
     * @return
     */
</#if>
    private static String md5(String text, String key) {
        try {
<#if (gen.showComment==true)>
            // 拿到一个MD5转换器
</#if>
            MessageDigest messageDigest = MessageDigest.getInstance("MD5");
<#if (gen.showComment==true)>
            // 输入的字符串转换成字节数组
</#if>
            byte[] inputByteArray = text.getBytes();
<#if (gen.showComment==true)>
            // inputByteArray是输入字符串转换得到的字节数组
</#if>
            messageDigest.update(inputByteArray);
<#if (gen.showComment==true)>
            // 转换并返回结果，也是字节数组，包含16个元素
</#if>
            byte[] resultByteArray = messageDigest.digest(key.getBytes());
<#if (gen.showComment==true)>
            // 字符数组转换成字符串返回
</#if>
            return byteArrayToHex(resultByteArray);
        } catch (NoSuchAlgorithmException e) {
            return null;
        }
    }

<#if (gen.showComment==true)>
	/**
     * 获取加密后的字符串
     *
     * @param text 原文
     * @return 32 位长度字符串
     */
</#if>
    public static String md5UpperCase(String text) {
        String str = md5(text);
        if (str != null) {
            return str.toUpperCase();
        }
        return null;
    }

<#if (gen.showComment==true)>
    /**
     * 获取加密后的字符串
     *
     * @param text 原文
     * @return 32 位长度字符串
     */
</#if>
    public static String md5(String text) {
        try {
<#if (gen.showComment==true)>
            // 拿到一个MD5转换器
</#if>
            MessageDigest messageDigest = MessageDigest.getInstance("MD5");
<#if (gen.showComment==true)>
            // 输入的字符串转换成字节数组
</#if>
            byte[] inputByteArray = text.getBytes();
<#if (gen.showComment==true)>
            // inputByteArray是输入字符串转换得到的字节数组
</#if>
            messageDigest.update(inputByteArray);
<#if (gen.showComment==true)>
            // 转换并返回结果，也是字节数组，包含16个元素
</#if>
            byte[] resultByteArray = messageDigest.digest();
<#if (gen.showComment==true)>
            // 字符数组转换成字符串返回
</#if>
            return byteArrayToHex(resultByteArray);
        } catch (NoSuchAlgorithmException e) {
            return null;
        }
    }

    private static String byteArrayToHex(byte[] byteArray) {
<#if (gen.showComment==true)>
        // 首先初始化一个字符数组，用来存放每个16进制字符
</#if>
        char[] hexDigits = {'0', '1', '2', '3', '4', '5', '6', '7', '8', '9', 'a', 'b', 'c', 'd', 'e', 'f'};
<#if (gen.showComment==true)>
        // new一个字符数组，这个就是用来组成结果字符串的（解释一下：一个byte是八位二进制，也就是2位十六进制字符（2的8次方等于16的2次方））
</#if>
        char[] resultCharArray = new char[byteArray.length * 2];
<#if (gen.showComment==true)>
        // 遍历字节数组，通过位运算（位运算效率高），转换成字符放到字符数组中去
</#if>
        int index = 0;
        for (byte b : byteArray) {
            resultCharArray[index++] = hexDigits[b >>> 4 & 0xf];
            resultCharArray[index++] = hexDigits[b & 0xf];
        }
<#if (gen.showComment==true)>
        // 字符数组组合成字符串返回
</#if>
        return new String(resultCharArray);
    }

<#if (gen.showComment==true)>
    /**
     * 生成 HMACSHA256
     * @param data 待处理数据
     * @param key 密钥
     * @return 加密结果
     * @throws Exception
     */
</#if>
    public static String HMACSHA256(String data, String key) throws Exception {
        Mac sha256_HMAC = Mac.getInstance("HmacSHA256");
        SecretKeySpec secret_key = new SecretKeySpec(key.getBytes("UTF-8"), "HmacSHA256");
        sha256_HMAC.init(secret_key);
        byte[] array = sha256_HMAC.doFinal(data.getBytes("UTF-8"));
        StringBuilder sb = new StringBuilder();
        for (byte item : array) {
            sb.append(Integer.toHexString((item & 0xFF) | 0x100).substring(1, 3));
        }
        return sb.toString().toUpperCase();
    }	
}
