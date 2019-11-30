package ${gen.officePackage?replace("/",".")};

import cn.afterturn.easypoi.excel.ExcelExportUtil;
import cn.afterturn.easypoi.excel.entity.TemplateExportParams;
import cn.afterturn.easypoi.word.WordExportUtil;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.xwpf.usermodel.XWPFDocument;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.io.FileOutputStream;
import java.io.OutputStream;
import java.net.URLEncoder;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class ZOfficeUtil {
    private static Logger log = LoggerFactory.getLogger(ZOfficeUtil.class);

    /**
     *
     * @param templatePathName
     * @param outFilePath
     * @param outFileName
     * @param params
     * @return
     */
    public static boolean exportWord07(String templatePathName, String outFilePath, String outFileName, Map<String, Object> params) {
        if (outFileName == null) {
            outFileName = System.currentTimeMillis() + ".docx";
        }
        try {
            XWPFDocument doc = WordExportUtil.exportWord07(templatePathName, params);
            File file=new File(outFilePath);
            if (!file.exists()){
                file.mkdirs();
            }
            FileOutputStream fos = new FileOutputStream(outFilePath + "/" + outFileName);
            doc.write(fos);
            fos.close();
            return true;
        } catch (Exception e) {
            log.error("通过模板导出word文档时异常", e);
            return false;
        }
    }

<#if (gen.showComment==true)>
    /**
     * 导出word
     * <p>第一步生成替换后的word文件，只支持docx</p>
     * <p>第二步下载生成的文件</p>
     * 模版变量中变量格式：{{foo}}
     *
     * @param templatePathName word模板地址
     * @param outFileName      文件名
     * @param params           替换的参数
     * @param request          HttpServletRequest
     * @param response         HttpServletResponse
     */
</#if>
    public static boolean exportWord07(String templatePathName, String outFileName, Map<String, Object> params, HttpServletRequest request, HttpServletResponse response) {
        if (outFileName == null) {
            outFileName = System.currentTimeMillis() + ".docx";
        }
        try {
            String userAgent = request.getHeader("user-agent").toLowerCase();
            if (userAgent.contains("msie") || userAgent.contains("like gecko")) {
                outFileName = URLEncoder.encode(outFileName, "UTF-8");
            } else {
                outFileName = new String(outFileName.getBytes("UTF-8"), "ISO-8859-1");
            }
            XWPFDocument doc = WordExportUtil.exportWord07(templatePathName, params);
<#if (gen.showComment==true)>
            // 设置强制下载不打开
</#if>
            response.setContentType("application/force-download");
<#if (gen.showComment==true)>
            // 设置文件名
</#if>
            response.addHeader("Content-Disposition", "attachment;fileName=" + outFileName);
            OutputStream out = response.getOutputStream();
            doc.write(out);
            out.close();
            return true;
        } catch (Exception e) {
            log.error("通过模板导出word文档时异常", e);
            return false;
        }

    }

    /**
     *
     * @param templatePathName
     * @param outFilePath
     * @param outFileName
     * @param param
     * @return
     */
    public static boolean exportExcel07(String templatePathName, String outFilePath, String outFileName, Map<String, Object> param) {
        try {
            TemplateExportParams tpl = new TemplateExportParams(templatePathName);
            Workbook workbook = ExcelExportUtil.exportExcel(tpl, param);
            File file = new File(outFilePath);
            if (!file.exists()) {
                file.mkdirs();
            }
            FileOutputStream fos = new FileOutputStream(outFilePath + "/" + outFileName);
            workbook.write(fos);
            fos.close();
            return true;
        } catch (Exception e) {
            log.error("导出Excel时异常", e);
            return false;
        }

    }

<#if (gen.showComment==true)>
    /**
     * @param templatePathName
     * @param outFileName
     * @param params
     * @return
     */
</#if>
    public static boolean exportExcel07(String templatePathName, String outFileName, Map<String, Object> params, HttpServletRequest request, HttpServletResponse response) {
        if (outFileName == null) {
            outFileName = System.currentTimeMillis() + ".xlsx";
        }
        try {
            String userAgent = request.getHeader("user-agent").toLowerCase();
            if (userAgent.contains("msie") || userAgent.contains("like gecko")) {
                outFileName = URLEncoder.encode(outFileName, "UTF-8");
            } else {
                outFileName = new String(outFileName.getBytes("UTF-8"), "ISO-8859-1");
            }
            TemplateExportParams tpl = new TemplateExportParams(templatePathName);
            Workbook workbook = ExcelExportUtil.exportExcel(tpl, params);
<#if (gen.showComment==true)>
            // 设置强制下载不打开
</#if>
            response.setContentType("application/force-download");
<#if (gen.showComment==true)>
            // 设置文件名
</#if>
            response.addHeader("Content-Disposition", "attachment;fileName=" + outFileName);
            OutputStream out = response.getOutputStream();

            workbook.write(out);
            out.close();
            return true;
        } catch (Exception e) {
            log.error("通过模板导出Excel文档时异常", e);
            return false;
        }
    }	
}
