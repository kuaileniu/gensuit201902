package cn.zhsit.utils;

import cn.zhsit.models.FileObject;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;

/**
 * Created by Administrator on 2018/4/21.
 */
public class ZFileUtil {

    public static File readFile(String path, String fileName) {
        String rootPath = PathUtil.RootPath;
        String filePathName = rootPath + File.separator + path + File.separator + fileName;
        File file = new File(filePathName);
        return file;
    }

    public static boolean writeFile(File file, String outPath, String fileName) {
        try {
            FileInputStream in = new FileInputStream(file);
            FileOutputStream out = new FileOutputStream(file);
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
        return true;
    }

    /**
     * 复制文件
     * @param sourcePath 本项目的路径，不含项目名称
     * @param targetPath 目标项目的路径，含目标项目的名称
     * @param fileName 文件名称
     * @return
     */
    public static boolean copyFile(String sourcePath, String targetPath, String fileName) {
        FileInputStream in = null;
        FileOutputStream out = null;
        try {
            String sourceFilePathName = PathUtil.RootPath + File.separator + sourcePath + File.separator + fileName;
            String targetFilePathName = PathUtil.RootParentPath + File.separator + targetPath + File.separator + fileName;
            File sourceFile = new File(sourceFilePathName);
            File targetFile = new File(targetFilePathName);

            in = new FileInputStream(sourceFile);
            out = new FileOutputStream(targetFile);

            byte[] buf = new byte[1024];
            int byteRead;
            while ((byteRead = in.read(buf)) > 0) {
                out.write(buf, 0, byteRead);
            }
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        } finally {
            try {
                if (in != null) {
                    in.close();
                }
                if (out != null) {
                    out.close();
                }
            } catch (Exception ex) {
                ex.printStackTrace();
            }
        }
        return true;
    }

//    public static void main(String[] args) {
//        FileObject[] fileObjects = new FileObject[]{
//                new FileObject("src\\main\\resources\\templates\\lib", "genserver\\lib","fastdfs-client-java-1.27-SNAPSHOT.jar"),
//        };
//        for (FileObject fileObject : fileObjects) {
//            ZFileUtil.copyFile(fileObject.getSourcePath(),fileObject.getTargetPath(),fileObject.getFileName());
//        }
//    }
}
