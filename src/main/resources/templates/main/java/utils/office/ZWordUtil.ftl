package ${gen.officePackage?replace("/",".")};

import cn.afterturn.easypoi.word.WordExportUtil;
import org.apache.poi.xwpf.usermodel.XWPFDocument;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.OutputStream;
import java.net.URLEncoder;
import java.util.Map;

public class ZWordUtil {
    private static Logger log = LoggerFactory.getLogger(ZWordUtil.class);

    /**
     * 导出word
     * <p>第一步生成替换后的word文件，只支持docx</p>
     * <p>第二步下载生成的文件</p>
     * 模版变量中变量格式：{{foo}}
     *
     * @param templatePath word模板地址
     * @param fileName     文件名
     * @param params       替换的参数
     * @param request      HttpServletRequest
     * @param response     HttpServletResponse
     */
    public static void exportWord(String templatePath, String fileName, Map<String, Object> params, HttpServletRequest request, HttpServletResponse response) {
        if (fileName == null) {
            fileName = System.currentTimeMillis() + ".docx";
        }
        try {
            String userAgent = request.getHeader("user-agent").toLowerCase();
            if (userAgent.contains("msie") || userAgent.contains("like gecko")) {
                fileName = URLEncoder.encode(fileName, "UTF-8");
            } else {
                fileName = new String(fileName.getBytes("UTF-8"), "ISO-8859-1");
            }
            XWPFDocument doc = WordExportUtil.exportWord07(templatePath, params);
            // 设置强制下载不打开
            response.setContentType("application/force-download");
            // 设置文件名
            response.addHeader("Content-Disposition", "attachment;fileName=" + fileName);
            OutputStream out = response.getOutputStream();
            doc.write(out);
            out.close();
        } catch (Exception e) {
            log.error("通过模板导出word文档时异常", e);
        }

    }


}
