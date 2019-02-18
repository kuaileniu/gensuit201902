package ${gen.utilPackage?replace("/",".")};

import java.util.*;
import javax.crypto.*;
import javax.crypto.spec.SecretKeySpec;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.security.InvalidKeyException;
import java.security.NoSuchAlgorithmException;


/**
 * AES 双向加密解密工具
 */
public class AESUtil {

    // 默认加密秘钥 AES加密秘钥为约定16位，小于16位会报错
    private static final String ENCODE_RULES = "bjzhsitivenandy0";

    // 默认算法
    private static final String ALGORITHMSTR = "AES/ECB/PKCS5Padding";

    public static String aesEncode(String content) {
        return aesEncode(content,ENCODE_RULES);
    }

    public static String aesDecode(String content) {
        return aesDecode(content,ENCODE_RULES);
    }

    /* *
     * @Description  加密
     * @Param [content]
     * @Return java.lang.String
     */
    public static String aesEncode(String content,String encryptKey) {
        try {
            //1.构造密钥生成器，指定为AES算法,不区分大小写
            KeyGenerator keyGenerator = KeyGenerator.getInstance("AES");
            //2.生成一个128位的随机源,根据传入的字节数组
            keyGenerator.init(128);
            //3.根据指定算法AES自成密码器
            Cipher cipher = Cipher.getInstance(ALGORITHMSTR);
            //4.初始化密码器，第一个参数为加密(Encrypt_mode)或者解密解密(Decrypt_mode)操作，第二个参数为使用的KEY
            cipher.init(Cipher.ENCRYPT_MODE, new SecretKeySpec(encryptKey.getBytes(),"AES"));
            //5.获取加密内容的字节数组(这里要设置为utf-8)不然内容中如果有中文和英文混合中文就会解密为乱码
            byte[] byteEncode = content.getBytes("utf-8");
            //9.根据密码器的初始化方式--加密：将数据加密
            byte[] byteAES = cipher.doFinal(byteEncode);
            //10.将加密后的byte[]数据转换为Base64字符串

            return Base64.getEncoder().encodeToString(byteAES);
            //11.将字符串返回
        } catch (NoSuchAlgorithmException e) {
            e.printStackTrace();
        } catch (NoSuchPaddingException e) {
            e.printStackTrace();
        } catch (InvalidKeyException e) {
            e.printStackTrace();
        } catch (IllegalBlockSizeException e) {
            e.printStackTrace();
        } catch (BadPaddingException e) {
            e.printStackTrace();
        } catch (UnsupportedEncodingException e) {
            e.printStackTrace();
        }
        //如果有错就返加nulll
        return null;

    }
    /* *
     * @Description 解密
     * @Param [cotent]
     * @Return java.lang.String
     */
    public static String aesDecode(String content,String decryptKey) {
        try {
            //1.构造密钥生成器，指定为AES算法,不区分大小写
            KeyGenerator keygen = KeyGenerator.getInstance("AES");
            //生成一个128位的随机源,根据传入的字节数组
            keygen.init(128);

            //6.根据指定算法AES自成密码器
            Cipher cipher = Cipher.getInstance(ALGORITHMSTR);
            //7.初始化密码器，第一个参数为加密(Encrypt_mode)或者解密(Decrypt_mode)操作，第二个参数为使用的KEY
            cipher.init(Cipher.DECRYPT_MODE,new SecretKeySpec(decryptKey.getBytes(),"AES"));
            //8.将加密并编码base64后的字符串内容base64解码成字节数组
            byte[] bytesContent = Base64.getDecoder().decode(content);
            /*
             * 解密
             */
            byte[] byteDecode = cipher.doFinal(bytesContent);
            return new String(byteDecode, "utf-8");
        } catch (NoSuchAlgorithmException e) {
            e.printStackTrace();
        } catch (NoSuchPaddingException e) {
            e.printStackTrace();
        } catch (InvalidKeyException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        } catch (IllegalBlockSizeException e) {
            throw new RuntimeException("密文解密失败");
            //e.printStackTrace();
        } catch (BadPaddingException e) {
            e.printStackTrace();
        }
        //如果有错就返加nulll
        return null;

    }

//    public static void main(String[] args) {
//        String encryptKey = "sdju089t5evdlzwe"; //须为16位
//        String[] keys = {"", "123456", "word中国人￥$#"};
//        System.out.println("key           |               AESEncode       |      AESDecode");
//        for (String key : keys) {
//            System.out.print(key + " | ");
//            System.out.print(aesEncode(key, encryptKey) + " | ");
//            String decryptString = aesDecode(aesEncode(key, encryptKey), encryptKey);
//            System.out.println(decryptString);
//            System.out.println("==============================================================================");
//        }
//    }
// 输出结果
//    key           |               AESEncode       |      AESDecode
//                   | QnkQrI3t4E4LGK7jfOZuBA== |
//            ==============================================================================
//            123456 | dLZNfduN7o5cYKTloBDNSg== | 123456
//            ==============================================================================
//    word中国人￥$# | kiYAuW6gJ8VI469DLKTBrhB7ocuG7+pH+1SNbthtgUU= | word中国人￥$#
//            ==============================================================================
}
