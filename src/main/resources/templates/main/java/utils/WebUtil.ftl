package ${gen.utilPackage?replace("/",".")};

import java.io.*;
import java.net.*;
import java.nio.charset.Charset;
import java.util.*;
import java.util.List;
import java.net.URLEncoder;

import org.apache.commons.io.FilenameUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import java.io.BufferedOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import org.apache.commons.compress.archivers.zip.ZipArchiveEntry;
import org.apache.commons.compress.archivers.zip.ZipArchiveOutputStream;
import org.apache.commons.io.IOUtils;
import java.awt.*;
import java.awt.image.BufferedImage;
import javax.imageio.ImageIO;
import javax.servlet.ServletOutputStream;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.commons.lang3.time.DateUtils;
import org.apache.commons.lang3.time.FastDateFormat;
import ${gen.filterPackage?replace("/",".")}.ResponseWrapper;
import ${gen.modelPackage?replace("/",".")}.*;
import ${gen.handlerPackage?replace("/",".")}.ContextHandler;
import eu.bitwalker.useragentutils.*;
import org.apache.http.impl.client.HttpClients;
import org.apache.http.HttpEntity;
import org.apache.http.NameValuePair;
import org.apache.http.client.config.RequestConfig;
import org.apache.http.client.entity.UrlEncodedFormEntity;
import org.apache.http.client.methods.CloseableHttpResponse;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.impl.client.CloseableHttpClient;
import org.apache.http.message.BasicNameValuePair;
import org.apache.http.util.EntityUtils;
import org.apache.commons.io.FileUtils;
import ${gen.constantsPackage?replace("/",".")}.*;
import org.springframework.util.ResourceUtils;
import java.util.List;
import java.util.zip.ZipEntry;
import java.util.zip.ZipInputStream;

/**
 *
 */
public class WebUtil {

    private static Logger log = LoggerFactory.getLogger(WebUtil.class);

    public static final String WWW = "www.";

    static {
        System.setProperty("java.awt.headless", "true");
    }

    public static boolean writeFile(HttpServletRequest request, HttpServletResponse response, byte[] bytes, String fileName) {
        OutputStream outputStream = null;
        try {
            response.reset();
            //会自动判断下载文件类型
            //response.setContentType("multipart/form-data");
            // 下载MIME类型
            response.setContentType("application/x-download");
            String userAgent = request.getHeader("USER-AGENT").toLowerCase();
            String fileDisplay = transCharacter(userAgent, fileName);
            response.addHeader("Content-Disposition", "attachment;filename=" + fileDisplay);
            // 输出文件流
            outputStream = new BufferedOutputStream(response.getOutputStream());
            outputStream.write(bytes);
            outputStream.flush();
            outputStream.close();
        } catch (Exception e) {
            if (e instanceof IOException) {
                return false;
            }
            log.error("writeFile时异常,{}", e);
        } finally {
            try {
                if (null != outputStream) {
                    outputStream.close();
                }
                response.getOutputStream().close();
            } catch (Exception e) {
            }
        }
        return true;
    }


    public static boolean writeFile(HttpServletRequest request, HttpServletResponse response, String filePathName, String fileName) {
        OutputStream outputStream = null;
        try {
            response.reset();
            byte[] bytes = FileUtils.readFileToByteArray(new File(filePathName));
            //会自动判断下载文件类型
            //response.setContentType("multipart/form-data");
            // 下载MIME类型
            response.setContentType("application/x-download");
            String userAgent = request.getHeader("USER-AGENT").toLowerCase();
            String fileDisplay = transCharacter(userAgent, fileName);
            response.addHeader("Content-Disposition", "attachment;filename=" + fileDisplay);
            // 输出文件流
            outputStream = new BufferedOutputStream(response.getOutputStream());
            outputStream.write(bytes);
            outputStream.flush();
            outputStream.close();
        } catch (Exception e) {
            if (e instanceof IOException) {
                return false;
            }
            log.error("writeFile时异常,{}", e);
        } finally {
            try {
                if (null != outputStream) {
                    outputStream.close();
                }
                response.getOutputStream().close();
            } catch (Exception e) {
            }
        }
        return true;
    }

    public static boolean copyFile(String srcPathName,String targetPathName){
        try {
            FileUtils.copyFile(new File(srcPathName), new File(targetPathName));
            return true;
        } catch (Exception e) {
            log.error("copyFile时异常",e);
            return false;
        }
    }


    private static String transCharacter(String userAgent, String fileName) throws Exception {
        // firefox
        if (userAgent != null && userAgent.indexOf("firefox") > 0) {
            // Content-Type="application/x-download; charset=utf-8"不起作用
            return new String(fileName.getBytes("UTF-8"), "ISO8859-1");
        } else {
            // msie和chrome
            return URLEncoder.encode(fileName, "UTF-8");
        }
    }
	
    /**
     * 获取本机内网ip
     *
     * @return
     */
    public static String getLocalIp() {
        InetAddress ia = null;
        try {
            ia = ia.getLocalHost();
            String localIp = ia.getHostAddress();
            <#--log.info("本机名称是：" + ia.getHostName());-->
            <#--log.info("本机的ip是 ：" + localip);-->
            return localIp;
        } catch (Exception e) {
            log.error("获取ip异常", e);
        }
        return null;
    }


    /**
     * 获取所有的ip列表 ，ifconfig -a 中列举出来的本机的内网ip及外网ip
     * @return
     */
    public static List<String> getLocalIPList() {
        List<String> ipList = new ArrayList<String>();
        try {
            Enumeration<NetworkInterface> networkInterfaces = NetworkInterface.getNetworkInterfaces();
            NetworkInterface networkInterface;
            Enumeration<InetAddress> inetAddresses;
            InetAddress inetAddress;
            String ip;
            while (networkInterfaces.hasMoreElements()) {
                networkInterface = networkInterfaces.nextElement();
                inetAddresses = networkInterface.getInetAddresses();
                while (inetAddresses.hasMoreElements()) {
                    inetAddress = inetAddresses.nextElement();
                    if (inetAddress != null && inetAddress instanceof Inet4Address) { // IPV4
                        ip = inetAddress.getHostAddress();
                        ipList.add(ip);
                    }
                }
            }
        } catch (SocketException e) {
            log.error("getLocalIPList获取ip异常", e);
        }
        return ipList;
    }

    /**
     * 获取用户的ip地址
     *
     * @param request
     * @return
     */
    public static String getRequestIp(HttpServletRequest request) {
        if (null == request) {
            return null;
        }
        String ip = null;
        try {
            // 获取请求主机IP地址,如果通过代理进来，则透过防火墙获取真实IP地址
            ip = request.getHeader("X-Forwarded-For");
            if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
                if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
                    ip = request.getHeader("Proxy-Client-IP");
                }
                if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
                    ip = request.getHeader("WL-Proxy-Client-IP");
                }
                if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
                    ip = request.getHeader("HTTP_CLIENT_IP");
                }
                if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
                    ip = request.getHeader("HTTP_X_FORWARDED_FOR");
                }
                if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
                    ip = request.getRemoteAddr();
                }
            } else if (ip.length() > 15) {
                String[] ips = ip.split(",");
                for (int index = 0; index < ips.length; index++) {
                    String strIp = (String) ips[index];
                    if (!("unknown".equalsIgnoreCase(strIp))) {
                        ip = strIp;
                        break;
                    }
                }
            }
        } catch (Exception e) {
        }
        // ipv6 “ffff:ffff:ffff:ffff:ffff:ffff:ffff:ffff” ,最长39
        //原来IPv4映射的IPv6地址可能出现这种格式“ffff:ffff:ffff:ffff:ffff:ffff:255:255:255:255”，也就是45字节，加上结束符就是46字节了
        if (StringUtil.isNotBlank(ip)) {
            if (ip.length() >= 46) {
                ip = ip.substring(0, 46);
            }
        }
        return ip;
    }

    /**
     * 获取一级域名
     *
     * @param request
     * @return
     */
    public static String getRootDomain(HttpServletRequest request) {
        String domain = "";
        String domainHost = request.getServerName();
        try {
            if (domainHost != null && domainHost.trim().length() > 0) {
                if (domainHost.equals("localhost")) {
                    domain = domainHost;
                } else if ("127.0.0.1".equals(domainHost)) {
                    domain = domainHost;
                } else {
                    String[] segments = domainHost.split("\\.");
                    if (segments.length > 1) {
                        if (StringUtil.isNumeric(segments[segments.length - 1])) { //是否是ip地址
                            domain = domainHost;
                        } else {
                            domain = segments[segments.length - 2] + "." + segments[segments.length - 1];
                            if (domain.contains("com.cn")
                                    || domain.contains("gov.cn")
                                    || domain.contains("net.cn")
                                    || domain.contains("org.cn")
                                    || domain.contains("ac.cn")
                            ) {
                                domain = segments[segments.length - 3] + "." + segments[segments.length - 2] + "." + segments[segments.length - 1];
                            }
                        }
                    } else {
                        domain = domainHost;
                    }
                }
            }
        } catch (Exception e) {
            domain = domainHost;
        }
        return domain;
    }

    /**
     * 获取当前域名
     *
     * @param request
     * @return
     */
    public static String getDomain(HttpServletRequest request) {
        String domain = request.getServerName();
        if (domain.startsWith(WWW)) {
            return domain.substring(4);
        } else {
            return domain;
        }
    }

<#if (gen.showComment==true)>
    // 获取浏览器名称
    // 获取浏览器 版本
    // 获取登录用户操作系统
</#if>
    public static ClientBrowser getBrowser(HttpServletRequest request) {
        ClientBrowser cb = new ClientBrowser();
        try {
            String machineIntroduction = request.getHeader("User-Agent");
            UserAgent userAgent = UserAgent.parseUserAgentString(machineIntroduction);
            OperatingSystem operatingSystem = userAgent.getOperatingSystem();
            Browser browser = userAgent.getBrowser();
            //获取浏览器版本号
            Version version = browser.getVersion(machineIntroduction);
            BrowserType browserType = browser.getBrowserType();

            cb.setMachineIntroduction(machineIntroduction);
            cb.setOs(operatingSystem.getName());
            cb.setBrowserType(browserType.getName());
            cb.setBrowserName(browser.getName());
            cb.setBrowserVersion(version.getVersion());
            cb.setRenderingEngine(browser.getRenderingEngine().name());

        } catch (Exception ex) {
            log.error("获取用户浏览器信息时异常", ex);
        }
        return cb;
    }

<#if (gen.showComment==true)>
    /**
     * 写出图片
     *
     * @param resp
     * @param code       写入图片的文字
     * @param width      图片宽度
     * @param height     图片高度
     * @param ganRaoXian 随机产生条干扰线条数，使图象中的认证码不易被其它程序探测到。
     * @return true成功写出
     * 例 WebUtil.imgWrite(response, code, 100, 30, 8);
     */
</#if>
    public static boolean imgWrite(HttpServletResponse resp, final String code, final int width, final int height, final int ganRaoXian) {
        ServletOutputStream sos = null;
        try {
            //字高度
            int fontHeight = height - 2;
            //每个字占的宽度
            int oneFontWidth = width / (code.length() + 1);
            //字体y坐标
            int fontY = height - 4;

            BufferedImage buffImg = new BufferedImage(width, height, BufferedImage.TYPE_INT_RGB);
            Graphics2D g = buffImg.createGraphics();
            //将图像填充为白色
            g.setColor(Color.WHITE);
            g.fillRect(0, 0, width, height);
            // 创建字体，字体的大小应该根据图片的高度来定。
            //Font font = new Font("Fixedsys", Font.PLAIN, fontHeight);
            Font font = new Font("宋体", Font.PLAIN, fontHeight);
            // 设置字体。
            g.setFont(font);
            // 画边框。
            g.setColor(Color.BLACK);
            g.drawRect(0, 0, width - 1, height - 1);
            for (int i = 0; i < ganRaoXian; i++) {
                int x1 = RandomUtil.noGreaterThan(width);
                int y1 = RandomUtil.noGreaterThan(height);
                int x2 = RandomUtil.noGreaterThan(20);
                int y2 = RandomUtil.noGreaterThan(20);
                g.drawLine(x1, y1, x1 + x2, y1 + y2);
            }
            for (int i = 0; i < code.length(); i++) {
                String ch = code.substring(i, i + 1);
                int red = 0, green = 0, blue = 0;
                red = RandomUtil.noGreaterThan(255);
                green = RandomUtil.noGreaterThan(255);
                blue = RandomUtil.noGreaterThan(255);
                // 用随机产生的颜色将验证码绘制到图像中。
                g.setColor(new Color(red, green, blue));
                g.drawString(ch, (i + 1) * oneFontWidth, fontY);
            }
            // 禁止图像缓存。
            resp.setHeader("Pragma", "no-cache");
            resp.setHeader("Cache-Control", "no-cache");
            resp.setDateHeader("Expires", 0);
            resp.setContentType("image/jpeg");
            sos = resp.getOutputStream();
            ImageIO.write(buffImg, "jpeg", sos);
            sos.flush();
            return true;
        } catch (Exception ex) {
            log.error("图片写出时异常", ex);
            return false;
        } finally {
            if (sos != null) {
                try {
                    sos.close();
                } catch (Exception e) {
                    log.error("关闭图片写出流时异常", e);
                }
            }
        }
    }


    /**
     * 获取请求Body
     *
     * @param request
     * @return
     */
    public static String getBodyString(ServletRequest request) {
        StringBuilder sb = new StringBuilder();
        InputStream inputStream = null;
        BufferedReader reader = null;
        try {
            inputStream = request.getInputStream();
            reader = new BufferedReader(new InputStreamReader(inputStream, Charset.forName("UTF-8")));
            String line = "";
            while ((line = reader.readLine()) != null) {
                sb.append(line);
            }
        } catch (IOException e) {
            log.error("WebUtil.getBodyString异常", e);
            ;
        } finally {
            if (inputStream != null) {
                try {
                    inputStream.close();
                } catch (IOException e) {
                    log.error("WebUtil.getBodyString异常", e);
                }
            }
            if (reader != null) {
                try {
                    reader.close();
                } catch (IOException e) {
                    log.error("WebUtil.getBodyString异常", e);
                }
            }
        }
        return sb.toString();
    }

    /**
     * 重写response时的HttpBody
     *
     * @param responseWrapper
     * @param response
     * @throws IOException
     */
    public static void rewriteResponseBody(ResponseWrapper responseWrapper, ServletResponse response) throws IOException {
        ServletOutputStream out = response.getOutputStream();
        byte[] responseBody = null;
        ResponseModel responseModel = (ResponseModel) ContextHandler.Instance.getResponseBody();
        if (responseModel != null) {
            responseBody = StringUtil.toJson(responseModel).getBytes("UTF-8");
        } else {
            responseBody = responseWrapper.getContent();//获取返回值
        }
        out.write(responseBody);
        out.flush();
    }

<#if (gen.showComment==true)>
    /**
     * 获取有前缀并带日期的token
     *
     * @param header
     * @param id
     * @return
     */
</#if>
    public static String ztoken(String header, String id) {
        String today = FastDateFormat.getInstance("yyyyMMddHHmmss").format(new Date());
        return header + today + id;
    }

<#if (gen.showComment==true)>
    /**
     * 发送post请求
     *
     * @param url    请求地址
     * @param params 请求参数Map<String, ? extends Object> params  Object可以为String或者File或者基本类型
     * @throws IOException
     */
</#if>
    public static String sendPost(String url, Map<String, String> params) throws IOException {
        String result = null;
        CloseableHttpClient httpclient = HttpClients.createDefault();
        RequestConfig requestConfig = RequestConfig.custom().setConnectTimeout(30000).build();//.setSocketTimeout(120000)
        try {
            HttpPost httpPost = new HttpPost(url);
            httpPost.setConfig(requestConfig);
            List<NameValuePair> formparams = new ArrayList<>();
            if (params != null && params.size() > 0) {
                for (Map.Entry<String, String> entry : params.entrySet()) {
                    String key = entry.getKey();
                    String value = params.get(key);
                    formparams.add(new BasicNameValuePair(key, value));
                }
            }
            httpPost.setEntity(new UrlEncodedFormEntity(formparams, GenConstant.utf8));
            CloseableHttpResponse response = httpclient.execute(httpPost);
            try {
                System.out.println(response.getStatusLine());
                HttpEntity entity = response.getEntity();
                if (entity != null) {
                    result = EntityUtils.toString(response.getEntity(), GenConstant.utf8);
                }
                // do something useful with the response body
                // and ensure it is fully consumed
                EntityUtils.consume(entity);
            } finally {
                response.close();
            }
        } finally {
            httpclient.close();
        }
        return StringUtil.replaceBlank(result);
    }

<#if (gen.showComment==true)>
    /**
     * 在发生https请求之前执行
     *
     * @param proxyHost
     * @param port
     */
</#if>
    public static void setHttpsProxy(String proxyHost, String port) {
        System.setProperty("https.proxyHost", proxyHost);
        System.setProperty("https.proxyPort", port);
    }

<#if (gen.showComment==true)>
    /**
     * 设置代理
     */
</#if>
    public static void setProxy() {
        //Http代理，只能代理http
        System.setProperty("http.proxyHost", "127.0.0.1");
        System.setProperty("http.proxyPort", "9876");
        //https代理,只能代理https
        System.setProperty("https.proxyHost", "127.0.0.1");
        System.setProperty("https.proxyPort", "9876");
        //同时支持 http、https
        System.setProperty("proxyHost", "127.0.0.1");
        System.setProperty("proxyPort", "9876");
        //Socket代理 同时支持 http、https
        //注意，如果设置了Socket代理，就不要设置http/https代理
        System.setProperty("socksProxyHost", "127.0.0.1");
        System.setProperty("socksProxyPort", "9876");

        //另外一种可以通过jvm启动参数设置
        // -DproxyHost=127.0.0.1 -DproxyPort=9876
    }

<#if (gen.showComment==true)>
    /**
     * 对url 编码
     *
     * @param url
     * @return
     */
</#if>
    public static String urlEncode(String url) {
        try {
            String jiaMiCodeUrl = URLEncoder.encode(url, GenConstant.utf8);
            return jiaMiCodeUrl;
        } catch (Exception ex) {
            log.error("", ex);
        }
        return null;
    }

<#if (gen.showComment==true)>
    /**
     * 向磁盘写文件
     *
     * @param base     文件夹根路径
     * @param path     文件根路径下的相对路径
     * @param fileName 文件名称（含后缀）
     * @param data     文件字节
     * @return
     */
</#if>
    public static String saveFile(String base, String path, String fileName, byte[] data) {
        String fileIncludeName = null;
        FileOutputStream fos = null;
        try {
            if (base == null) {
                base = "zhsstore/";
            }
            if (path.startsWith("/")) {
                path = path.substring(1);
            }
            String allPath = base + "/" + path;
            fileIncludeName = allPath + "/" + fileName;
            File file = new File(fileIncludeName);
            if (!file.exists()) {
                File f = new File(allPath);
                if (!f.exists()) {
                    f.mkdirs();
                }
                f.createNewFile();
            }
            fos = new FileOutputStream(file);
            fos.write(data);
            fos.flush();
        } catch (Exception e) {
            log.error("写文件时异常,{}", e);
        } finally {
            if (fos != null) {
                try {
                    fos.close();
                } catch (IOException e) {
                    log.error("文件流关闭失败");
                }
            }
        }
        return fileIncludeName;
    }

<#if (gen.showComment==true)>
    /**
     * 从磁盘读取文件
     *
     * @param fileIncludePath 文件路径和名称（含文件名后缀）
     * @return
     */
</#if>
    public static byte[] readFile(String fileIncludePath) {
        try {
            File file = new File(fileIncludePath);
            if (!file.exists()) {
                return null;
            }
            return FileUtils.readFileToByteArray(file);
        } catch (Exception ex) {
            log.error("读取文件:" + fileIncludePath + "失败。");
        }
        return null;
    }

<#if (gen.showComment==true)>
    /**
     * 根据文件全名获取我文件后缀
     *
     * @param fileName
     * @return 含有".",例 ".png"
     */
</#if>
    public static String filePostfix(String fileName) {
        if (!fileName.contains(".")) {
            return null;
        }
        int lastIndexOfPoint = fileName.lastIndexOf(".");
        return fileName.substring(lastIndexOfPoint);
    }

<#if (gen.showComment==true)>
    /**
     * 根据文件类型和年月划分的文件路径
     *
     * @return
     */
</#if>
    public static String location(String fileType) {
        int year = Calendar.getInstance().get(Calendar.YEAR) - 2000;
        int month = Calendar.getInstance().get(Calendar.MONTH) + 1;
        int date = Calendar.getInstance().get(Calendar.DATE);
        StringJoiner joiner = new StringJoiner("/");
        return joiner.add(fileType)
                .add(year + "")
                .add(month + "")
                .add(date + "")
                .toString()
                ;

    }

<#if (gen.showComment==true)>
    /**
     * springboot打包后取不到
     *
     * @param fileIncludePath spring resources文件夹下的相对路径，不以/ 开头，例如downloadfile/订购函.docx
     * @return
     */
</#if>
    public static File getResourcesFile(String fileIncludePath) {
        String filePath = "classpath:" + fileIncludePath;
        try {
            File fi = ResourceUtils.getFile(filePath);
            return fi;
        } catch (IOException ioe) {
            log.error("读取文件异常", ioe);
        }
        return null;
    }

<#if (gen.showComment==true)>
    /**
     * @param fileIncludePath spring resources文件夹下的相对路径，不以/ 开头，例如downloadfile/订购函.docx
     * @return
     */
</#if>
    public static InputStream getResourcesFileStream(String fileIncludePath) {
        String filePath = "classpath:" + fileIncludePath;
        try {
            File fi = ResourceUtils.getFile(filePath);
            InputStream in = new FileInputStream(fi);
            return in;
        } catch (IOException ioe) {
            log.error("读取文件异常", ioe);
        }
        return null;
    }

    public static boolean zip(String srcPath, String outFilePathName) {
        try {
            File zipFile = new File(outFilePathName);
            ZipArchiveOutputStream stream = new ZipArchiveOutputStream(zipFile);
            File[] files = new File(srcPath).listFiles();
            for (File file : files) {
                InputStream in = new FileInputStream(file);
                ZipArchiveEntry entry = new ZipArchiveEntry(file, file.getName());
                stream.putArchiveEntry(entry);
                IOUtils.copy(in, stream);
                stream.closeArchiveEntry();
                in.close();
            }
            stream.finish();
            stream.close();
            return true;
        } catch (Exception e) {
            log.error("zip 打zip压缩包时异常", e);
            return false;
        }
    }


    public static boolean deleteFile(String pathOrFile) {
        try {
            FileUtils.forceDelete(new File(pathOrFile));
            return true;
        } catch (Exception e) {
            log.error("删除文件" + pathOrFile + "时异常");
        }
        return false;
    }

<#if (gen.showComment==true)>
    /**
     * @param in
     * @param folder   路径文件夹
     * @param fileName 文件名称含后缀
     * @return
     */
</#if>
    public static String writeToDisk(InputStream in, String folder, String fileName) {
        try {
            String filePathName = folder + "/" + fileName;
            File folderFile = new File((folder));
            folderFile.mkdirs();
            FileOutputStream fos = new FileOutputStream(new File(filePathName));
            IOUtils.copy(in, fos);
            fos.close();
            in.close();
            return filePathName;
        } catch (Exception e) {
            log.error("writeToDisk 异常", e);
            return null;
        }
    }

<#if (gen.showComment==true)>
    /**
     * @param bytes
     * @param folder   路径文件夹
     * @param fileName 文件名称含后缀
     * @return
     */
</#if>
    public static String writeToDisk(byte[] bytes, String folder, String fileName) {
        try {
            String filePathName = folder + "/" + fileName;
            File folderFile = new File((folder));
            folderFile.mkdirs();
            FileOutputStream fos = new FileOutputStream(new File(filePathName));
            fos.write(bytes);
            fos.close();
            return filePathName;
        } catch (Exception e) {
            log.error("writeToDisk 异常", e);
            return null;
        }
    }

<#if (gen.showComment==true)>
     /**
     * 递归解压压缩包
     * 注意:wrar393sc.exe 压缩的解压不出
     *
     * @param in
     * @param path
     * @return
     * @throws Exception
     */
</#if>
    public static List<String> unZip(InputStream in, String path) {
        List<String> nameList = new ArrayList<>();
        ZipInputStream zin = new ZipInputStream(in, Charset.forName("GBK"));//输入源zip路径
        BufferedInputStream bin = new BufferedInputStream(zin);
        String parent = path; //输出路径（文件夹目录）
        File fout = null;
        ZipEntry entry;
        try {
            while ((entry = zin.getNextEntry()) != null && !entry.isDirectory()) {
                fout = new File(parent, entry.getName());
                nameList.add(parent + "/" + entry.getName());
                if (!fout.exists()) {
                    (new File(fout.getParent())).mkdirs();
                }
                FileOutputStream out = new FileOutputStream(fout);
                BufferedOutputStream bout = new BufferedOutputStream(out);
                int b;
                while ((b = bin.read()) != -1) {
                    bout.write(b);
                }
                bout.close();
                out.close();
            }
            bin.close();
            zin.close();
        } catch (Exception e) {
            log.error("递归解压压缩包时异常", e);
        }
        return nameList;
    }

<#if (gen.showComment==true)>
    /**
     * 递归解压压缩包
     * 注意:wrar393sc.exe 压缩的解压不出
     *
     * @param in
     * @param path
     * @return Map<不含路径的原文件名, 磁盘存储路径文件名称>
     * @throws Exception
     */
</#if>
    public static Map<String, String> unZipResetPathName(InputStream in, String path) {
        Map<String, String> nameList = new HashMap<>();
        ZipInputStream zin = new ZipInputStream(in, Charset.forName("GBK"));//输入源zip路径
        BufferedInputStream bin = new BufferedInputStream(zin);
        String parent = path; //输出路径（文件夹目录）
        File fout = null;
        ZipEntry entry;
        try {
            while ((entry = zin.getNextEntry()) != null && !entry.isDirectory()) {
                String fileNameSuffix = entry.getName();
                String fileName = FilenameUtils.getName(fileNameSuffix);
                String fileSuffix = FilenameUtils.getExtension(fileNameSuffix);
                String diskPathName = parent + "/" + Unique.unique25() + "." + fileSuffix;
                nameList.put(fileName, diskPathName);
                fout = new File(diskPathName);
                if (!fout.exists()) {
                    (new File(fout.getParent())).mkdirs();
                }
                FileOutputStream out = new FileOutputStream(fout);
                BufferedOutputStream bout = new BufferedOutputStream(out);
                int b;
                while ((b = bin.read()) != -1) {
                    bout.write(b);
                }
                bout.close();
                out.close();
            }
            bin.close();
            zin.close();
        } catch (Exception e) {
            log.error("递归解压压缩包时异常", e);
        }
        return nameList;
    }


}