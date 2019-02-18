package ${gen.utilPackage?replace("/",".")};

import com.auth0.jwt.JWT;
import com.auth0.jwt.JWTVerifier;
import com.auth0.jwt.algorithms.Algorithm;
import com.auth0.jwt.exceptions.JWTDecodeException;
import com.auth0.jwt.interfaces.DecodedJWT;

import io.jsonwebtoken.*;
import io.jsonwebtoken.impl.DefaultHeader;
import io.jsonwebtoken.impl.DefaultJwsHeader;
import io.jsonwebtoken.impl.TextCodec;
import io.jsonwebtoken.impl.compression.DefaultCompressionCodecResolver;
import io.jsonwebtoken.lang.Assert;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
<#--import org.springframework.util.StringUtils;-->

<#--import javax.xml.bind.DatatypeConverter;-->
import java.util.*;
import java.io.UnsupportedEncodingException;

<#--//参见 https://github.com/monkeyWie/bootshiro-->
public class JWTUtil {

    private static Logger log = LoggerFactory.getLogger(JWTUtil.class);
    // 过期时间 24 小时
    public static final long EXPIRE_TIME = 60 * 24 * 60 * 1000;
    public static final String SECRET_KEY = "?::4343fdf4fdf6cvf):";

    private static CompressionCodecResolver CODECRESOLVER = new DefaultCompressionCodecResolver();

    <#--/**-->
     <#--*-->
     <#--* @Description  json web token 签发（生成JWT）-->
     <#--* @param id          令牌ID-->
     <#--* @param subject     用户ID-->
     <#--* @param issuer      签发人-->
     <#--* @param period      有效时间(毫秒)-->
     <#--* @param roles       访问主张-角色-->
     <#--* @param permissions 访问主张-权限-->
     <#--* @param algorithm   加密算法-->
     <#--* @Description json web token 签发-->
     <#--* @Return java.lang.String-->
     <#--*/-->
    <#--public static String issueJWT(String id, String subject, String issuer, Long period, String roles, String permissions, SignatureAlgorithm algorithm) {-->
        <#--// 当前时间戳-->
        <#--Long currentTimeMillis = System.currentTimeMillis();-->
        <#--// 秘钥-->
        <#--byte[] secreKeyBytes = DatatypeConverter.parseBase64Binary(SECRET_KEY);-->
        <#--JwtBuilder jwtBuilder = Jwts.builder();-->
        <#--if (!StringUtils.isEmpty(id)) {-->
            <#--jwtBuilder.setId(id);-->
        <#--}-->
        <#--if (!StringUtils.isEmpty(subject)) {-->
            <#--jwtBuilder.setSubject(subject);-->
        <#--}-->
        <#--if (!StringUtils.isEmpty(issuer)) {-->
            <#--jwtBuilder.setIssuer(issuer);-->
        <#--}-->
        <#--// 设置签发时间-->
        <#--jwtBuilder.setIssuedAt(new Date(currentTimeMillis));-->
        <#--// 设置到期时间-->
        <#--if (null != period) {-->
            <#--jwtBuilder.setExpiration(new Date(currentTimeMillis + period * 1000));-->
        <#--}-->
        <#--if (!StringUtils.isEmpty(roles)) {-->
            <#--jwtBuilder.claim("roles", roles);-->
        <#--}-->
        <#--if (!StringUtils.isEmpty(permissions)) {-->
            <#--jwtBuilder.claim("perms", permissions);-->
        <#--}-->
        <#--// 压缩，可选GZIP-->
        <#--jwtBuilder.compressWith(CompressionCodecs.DEFLATE);-->
        <#--// 加密设置-->
        <#--jwtBuilder.signWith(algorithm, secreKeyBytes);-->

        <#--return jwtBuilder.compact();-->
    <#--}-->


    /**
     * 解析JWT的Payload
     */
    public static String parseJwtPayload(String jwt) {
        Assert.hasText(jwt, "JWT String argument cannot be null or empty.");
        String base64UrlEncodedHeader = null;
        String base64UrlEncodedPayload = null;
        String base64UrlEncodedDigest = null;
        int delimiterCount = 0;
        StringBuilder sb = new StringBuilder(128);
        for (char c : jwt.toCharArray()) {
            if (c == '.') {
                CharSequence tokenSeq = io.jsonwebtoken.lang.Strings.clean(sb);
                String token = tokenSeq != null ? tokenSeq.toString() : null;

                if (delimiterCount == 0) {
                    base64UrlEncodedHeader = token;
                } else if (delimiterCount == 1) {
                    base64UrlEncodedPayload = token;
                }

                delimiterCount++;
                sb.setLength(0);
            } else {
                sb.append(c);
            }
        }
        if (delimiterCount != 2) {
            String msg = "JWT strings must contain exactly 2 period characters. Found: " + delimiterCount;
            throw new MalformedJwtException(msg);
        }
        if (sb.length() > 0) {
            base64UrlEncodedDigest = sb.toString();
        }
        if (base64UrlEncodedPayload == null) {
            throw new MalformedJwtException("JWT string '" + jwt + "' is missing a body/payload.");
        }
        // =============== Header =================
        Header header = null;
        CompressionCodec compressionCodec = null;
        if (base64UrlEncodedHeader != null) {
            String origValue = TextCodec.BASE64URL.decodeToString(base64UrlEncodedHeader);
            Map<String, Object> m = StringUtil.fromJson(origValue,Map.class);
            if (base64UrlEncodedDigest != null) {
                header = new DefaultJwsHeader(m);
            } else {
                header = new DefaultHeader(m);
            }
            compressionCodec = CODECRESOLVER.resolveCompressionCodec(header);
        }
        // =============== Body =================
        String payload;
        if (compressionCodec != null) {
            byte[] decompressed = compressionCodec.decompress(TextCodec.BASE64URL.decode(base64UrlEncodedPayload));
            payload = new String(decompressed, io.jsonwebtoken.lang.Strings.UTF_8);
        } else {
            payload = TextCodec.BASE64URL.decodeToString(base64UrlEncodedPayload);
        }
        return payload;
    }

    <#--/**-->
     <#--* 验签JWT-->
     <#--*-->
     <#--* @param jwt json web token-->
     <#--*/-->
    <#--public static JwtAccount parseJwt(String jwt, String appKey) {-->
        <#--Claims claims = Jwts.parser()-->
                <#--.setSigningKey(DatatypeConverter.parseBase64Binary(appKey))-->
                <#--.parseClaimsJws(jwt)-->
                <#--.getBody();-->
        <#--JwtAccount jwtAccount = new JwtAccount();-->
        <#--jwtAccount.setTokenId(claims.getId());// 令牌ID-->
        <#--jwtAccount.setAppId(claims.getSubject());// 客户标识-->
        <#--jwtAccount.setIssuer(claims.getIssuer());// 签发者-->
        <#--jwtAccount.setIssuedAt(claims.getIssuedAt());// 签发时间-->
        <#--jwtAccount.setAudience(claims.getAudience());// 接收方-->
        <#--jwtAccount.setRoles(claims.get("roles", String.class));// 访问主张-角色-->
        <#--jwtAccount.setPerms(claims.get("perms", String.class));// 访问主张-权限-->
        <#--return jwtAccount;-->
    <#--}-->

    /**
     * 生成 token, 24小时后过期
     * @param username 用户名
     * @return 加密的token
     */
    public static String createToken(String username) {
        try {
            Date date = new Date(System.currentTimeMillis() + EXPIRE_TIME);
            Algorithm algorithm = Algorithm.HMAC256(SECRET_KEY);
            // 附带username信息
            return JWT.create()
                    .withClaim("username", username)
                    //到期时间
                    .withExpiresAt(date)
                    //创建一个新的JWT，并使用给定的算法进行标记
                    .sign(algorithm);
        } catch (UnsupportedEncodingException e) {
            return null;
        }
    }


    /**
     * 校验 token 是否正确
     * @param token    密钥
     * @param username 用户名
     * @return 是否正确
     */
    public static boolean verify(String token, String username) {
        try {
            Algorithm algorithm = Algorithm.HMAC256(SECRET_KEY);
            //在token中附带了username信息
            JWTVerifier verifier = JWT.require(algorithm)
                    .withClaim("username", username)
                    .build();
            //验证 token
            verifier.verify(token);
            return true;
        } catch (Exception exception) {
            return false;
        }
    }


    /**
     * 获得token中的信息，无需secret解密也能获得
     *
     * @return token中包含的用户名
     */
    public static String getUsername(String token) {
        try {
            DecodedJWT jwt = JWT.decode(token);
            return jwt.getClaim("username").asString();
        } catch (JWTDecodeException e) {
            return null;
        }
    }

    public static class Claim{
        public String name;
        // TODO, val类型只能是 int,long,string date,boolean double
        public String val;
    }
//    public static void main(String[] args) {
//        long refreshPeriodTime = 36000L;  //seconds为单位,
//        System.out.println(refreshPeriodTime >> 2); // 9000
//        long dd= refreshPeriodTime >> 2;
//        System.out.println(dd);
//        String newJwt = JWTUtil.issueJWT(UUID.randomUUID().toString(),"abcuserId","token-server",dd,"admin",null, SignatureAlgorithm.HS512);
//        System.out.println(newJwt);
////        eyJhbGciOiJIUzUxMiIsInppcCI6IkRFRiJ9.eNosy1sOgyAQQNG9zLeTMBRl6g66DJAhoQ9tAE2Txr2LTX9P7v3CvSYYwWgeIokgGRvQ9HFCzywodOGgHEfNV-igrL7Fzk9rkXwLTVIpTerykBmbbZJPdBVG6rUdFBHbDuTz_gOpH-TlKefowivNsB8AAAD__w.LZ8xrNkUJoVGjtMRO888kgSPHFUumqm0cxOgx99Q2D53idscZzZ8MfKX4MJ0v8eueQF_ovYMlpyVrhJxTV7gYw
//        String payload = JWTUtil.parseJwtPayload(newJwt);
//        System.out.println(payload);
//        JwtAccount account = JWTUtil.parseJwt(newJwt,JWTUtil.SECRET_KEY);
//        System.out.println(account.getAppId());
//    }

//输出结果
//    eyJhbGciOiJIUzUxMiIsInppcCI6IkRFRiJ9.eNosy1sKgzAQQNG9zLcDE4mT1B10GRMzQvrQkkQplO69sfh7uPcDt5pgBO-tFUcTXsQpWseMQUmQhWWOngYmgg7KFlosYdqK5mtskkppUte7Lths13ygVBjN0Dum3pDrQN-vE4z5Q14feowSn2mB7w8AAP__.88Z3B2qRYyAI_1mvRnG7uZKm7mYVHkUQGH69CE7xdjgicK-YwI20D8Wr8T18l43wLWpNma-pHZ-EgjJz9WajkQ
//    {"jti":"8844a70c-9a7e-4766-be0a-6a6afd805600","sub":"abcuserId","iss":"token-server","iat":1527602107,"exp":1527611107,"roles":"admin"}
//    abcuserId
}
