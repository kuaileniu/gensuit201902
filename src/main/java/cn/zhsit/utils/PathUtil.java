package cn.zhsit.utils;

import java.io.File;

/**
 * Created by Administrator on 2018/4/12.
 */
public class PathUtil {
    //    项目的根路径。例如 D:\src\gen-suite\gensuite
    public final static String RootPath = new File("").getAbsolutePath();
    //D:\src\gen-suite
    public final static String RootParentPath = ZhsStringUtil.beforeLast(RootPath, File.separator);



}
