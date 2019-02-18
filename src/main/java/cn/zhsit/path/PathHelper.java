package cn.zhsit.path;

import cn.zhsit.configs.GenPath;
import cn.zhsit.constants.GenConstants;
import cn.zhsit.configs.Gen;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import java.io.File;
import java.util.List;

@Component
public class PathHelper {
    @Autowired
    GenPath genPath;
    @Autowired
    Gen gen;


    public boolean mkPackage() {
        delJavaProject();
        mkdirs();
        return true;
    }


    private boolean delJavaProject() {
        File f = new File(genPath.getServerPath(""));
        File[] fs = f.listFiles();
        if (fs == null) {
            return true;
        }
        for (File file : fs) {
            if (".idea".equals(file.getName()) || file.getName().endsWith(".iml")) {
                continue;
            }
            deleteDir(file);
        }
        return true;
    }

    private boolean delAll() {
        delMain();
        delTest();
        return true;
    }

    private boolean delMain() {
        File f = new File(genPath.getServerPath(GenConstants.mavenMain));
        File[] fs = f.listFiles();
        if (fs == null) {
            return true;
        }
        for (File file : fs) {
            deleteDir(file);
        }
        return true;
    }

    private boolean delTest() {
        File f = new File(genPath.getServerPath(GenConstants.mavenTest));
        File[] fs = f.listFiles();
        if (fs == null) {
            return true;
        }
        for (File file : fs) {
            deleteDir(file);
        }
        return true;
    }

    private boolean mkdirs() {
        mkMainResources();
        mkTestResources();
        mkMainJavaBasePackage();
        mkTestJavaBasePackage();
        if (gen.isInitProject()) {
            mkMainJavaApplicationPackages();
            mkTestJavaApplicationPackages();
        }
        return true;
    }

    private boolean mkMainJavaBasePackage() {
        File f = new File(genPath.getMainJavaPackage(gen.getBasePackage()));
        return f.mkdirs();
    }

    private boolean mkMainJavaApplicationPackages() {
        List<String> applicationPackages = gen.applicationPackages;
        for (String applicationPackage : applicationPackages) {
            File f = new File(genPath.getMainJavaPackage(gen.getServerApplicationPackage() +"/"+ applicationPackage));
            f.mkdirs();
        }
        return true;
    }

    private boolean mkMainResources() {
        File f = new File(genPath.getServerPath(GenConstants.mavenMainResources));
        return f.mkdirs();
    }

    private boolean mkTestResources() {
        File f = new File(genPath.getServerPath(GenConstants.mavenTestResources));
        return f.mkdirs();
    }

    private boolean mkTestJavaBasePackage() {
        File f = new File(genPath.getTestJavaPackage(gen.getBasePackage()));
        return f.mkdirs();
    }

    private boolean mkTestJavaApplicationPackages() {
        List<String> applicationPackages = gen.applicationPackages;
        for (String applicationPackage : applicationPackages) {
            File f = new File(genPath.getTestJavaPackage(gen.getServerApplicationPackage() +"/"+ applicationPackage));
            f.mkdirs();
        }
        return true;
    }


    private static boolean deleteDir(File dir) {
        if (dir.isDirectory()) {
            String[] children = dir.list();
            //递归删除目录中的子目录下
            for (int i = 0; i < children.length; i++) {
                boolean success = deleteDir(new File(dir, children[i]));
                if (!success) {
                    return false;
                }
            }
        }
        // 目录此时为空，可以删除
        return dir.delete();
    }
}
