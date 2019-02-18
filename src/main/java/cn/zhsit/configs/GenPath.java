package cn.zhsit.configs;

import cn.zhsit.constants.GenConstants;
import cn.zhsit.utils.PathUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import java.io.File;

/**
 * Created by Administrator on 2018/4/12.
 */
@Component
public class GenPath {
    @Autowired
    Gen gen;
//
//    //maven工程main 路径
//    private String mavenMain;
//    //maven工程main java 路径
//    private String mavenMainJava;
//    //maven工程main resources 路径
//    private String mavenMainResources;
//    //maven工程test resources 路径
//    private String mavenTestResources;
//    //maven工程test 路径
//    private String mavenTest;
//    //maven工程test java 路径
//    private String mavenTestJava;
//    //main下java的基础路径
//    private String mainJavaBasePackage;
//    //test下java的基础路径
//    private String testJavaBasePackage;

    //从服务端根路径算起（服务端）
    public String getServerPath(String path){
        if(gen.isInitProject()){
            return PathUtil.RootParentPath + File.separator + gen.getServer() + File.separator + path ;
        }
        return PathUtil.RootParentPath + File.separator + gen.getGenServer() + File.separator + path ;
    }

    //从main下的java路径开始算起(服务端)
    public String getMainJavaPackage(String pack){
        if(gen.isInitProject()){
            return PathUtil.RootParentPath + File.separator + gen.getServer() + File.separator +GenConstants.mavenMainJava + pack;
        }
        return PathUtil.RootParentPath + File.separator + gen.getGenServer() + File.separator +GenConstants.mavenMainJava + pack;
    }

    //从test下的java路径开始算起(服务端)
    public String getTestJavaPackage(String pack){
        if(gen.isInitProject()){
            return PathUtil.RootParentPath + File.separator + gen.getServer() + File.separator +GenConstants.mavenTestJava + pack;
        }
        return PathUtil.RootParentPath + File.separator + gen.getGenServer() + File.separator +GenConstants.mavenTestJava + pack;
    }

}
