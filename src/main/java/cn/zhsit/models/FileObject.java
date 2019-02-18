package cn.zhsit.models;

/**
 * copy文件对象例如jar包等，对象内容不动态变化的
 */
public class FileObject extends ClassBase {
    private String sourcePath;
    private String fileName;
    private String targetPath;

//    public FileObject(String sourcePath, String targetPath) {
//        this.sourcePath = sourcePath;
//        this.targetPath = targetPath;
//    }

    public FileObject(String sourcePath, String targetPath, String fileName) {
        this.sourcePath = sourcePath;
        this.targetPath = targetPath;
        this.fileName = fileName;
    }

    public String getSourcePath() {
        return sourcePath;
    }

    public String getFileName() {
        return fileName;
    }

    public String getTargetPath() {
        return targetPath;
    }
}
