package ${gen.utilPackage?replace("/",".")};

<#--import Decoder.BASE64Decoder;-->
<#--import Decoder.BASE64Encoder;-->
import javax.crypto.Cipher;
import javax.crypto.spec.IvParameterSpec;
import javax.crypto.spec.SecretKeySpec;
import java.util.Base64;

<#if (gen.showComment==true)>
/**
 * https://www.golang123.com/topic/1686
 * AES 双向加密解密工具
 */
</#if>
public class AESUtil {

<#if (gen.showComment==true)>
    /**
     * 加密用的Key 可以用26个字母和数字组成
     * 此处使用AES-128-CBC加密模式，key需要为16位。
     */
</#if>
    private static String sKey = "bjzhsitivenandy0";
    private static String ivParameter = "bjzhsitfengteng0";

<#if (gen.showComment==true)>
    // 加密
</#if>
    public static String aesEncode(String sSrc) {
        try {
            Cipher cipher = Cipher.getInstance("AES/CBC/PKCS5Padding");
            byte[] raw = sKey.getBytes();
            SecretKeySpec skeySpec = new SecretKeySpec(raw, "AES");
            IvParameterSpec iv = new IvParameterSpec(ivParameter.getBytes());//使用CBC模式，需要一个向量iv，可增加加密算法的强度
            cipher.init(Cipher.ENCRYPT_MODE, skeySpec, iv);
            byte[] encrypted = cipher.doFinal(sSrc.getBytes("utf-8"));
            <#--return new BASE64Encoder().encode(encrypted);//此处使用BASE64做转码。-->
            return Base64.getEncoder().encodeToString(encrypted);//此处使用BASE64做转码。
        } catch (Exception e) {
            e.printStackTrace();
        }

        return null;
    }

<#if (gen.showComment==true)>
    // 解密
</#if>
    public static String aesDecode(String sSrc) throws Exception {
        try {
            byte[] raw = sKey.getBytes("ASCII");
            SecretKeySpec skeySpec = new SecretKeySpec(raw, "AES");
            Cipher cipher = Cipher.getInstance("AES/CBC/PKCS5Padding");
            IvParameterSpec iv = new IvParameterSpec(ivParameter.getBytes());
            cipher.init(Cipher.DECRYPT_MODE, skeySpec, iv);
            <#--byte[] encrypted1 = new BASE64Decoder().decodeBuffer(sSrc);//先用base64解密-->
            byte[] encrypted1 = Base64.getDecoder().decode(sSrc);//先用base64解密
            byte[] original = cipher.doFinal(encrypted1);
            String originalString = new String(original, "utf-8");
            return originalString;
        } catch (Exception ex) {
            ex.printStackTrace();
            return null;
        }
    }

//    public static void main(String[] args) throws Exception {
//        String orig = "1ug88zfyxa9_20190517182933张三丰";
//        String miWen = aesEncode(orig);
//        String jieMi = aesDecode(miWen);
//        System.out.println("原文：" + orig + "    密文:" + miWen + "    解密密文:" + jieMi);
////        原文：1ug88zfyxa9_20190517182933张三丰    密文:2C/BeaQGY8W8WZVRMn10+dfjvBp4vzjT+Z7GbwDmGSvNfpqw3haMR0ubNEEZ7LBv    解密密文:1ug88zfyxa9_20190517182933张三丰
//
//    }
}
