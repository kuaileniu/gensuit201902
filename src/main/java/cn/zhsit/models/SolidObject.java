package cn.zhsit.models;

import cn.zhsit.enums.FileType;

/**
 * 固态对象，对象内容不动态变化的
 */
public class SolidObject extends ClassBase {
//    public SolidObject(String className,String ftlName,String packageStr){
//        this.setClassName(className);
//        this.setFtlName(ftlName);
//        this.setPackageStr(packageStr);
//    }

    public SolidObject(String className,String ftlName,String packageStr,FileType fileType){
        this.setClassName(className);
        this.setFtlName(ftlName);
        this.setPackageStr(packageStr);
        this.setFileType(fileType);
    }
}
