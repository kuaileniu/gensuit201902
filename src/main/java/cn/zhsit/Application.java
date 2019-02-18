package cn.zhsit;

import cn.zhsit.orm.JavaManager;
import cn.zhsit.path.PathHelper;
import cn.zhsit.rdb.RDBHelper;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.CommandLineRunner;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;


/**
 * Created by Administrator on 2018/3/19.
 * 使用Maven运行Java main的3种方式 https://blog.csdn.net/qbg19881206/article/details/19850857
 */
@SpringBootApplication
public class Application  implements CommandLineRunner {
    private Logger log = LoggerFactory.getLogger(this.getClass());
//    @Autowired
//    DataSource dataSource;
    @Autowired
    PathHelper pathHelper;
    @Autowired
    RDBHelper rdbHelper;
    @Autowired
    JavaManager javaManager;

    public static void main(String[] args) {
        SpringApplication.run(Application.class, args);
    }

    @Override
    public void run(String... arg0) throws Exception {
//        if(1==1){
//            throw new RuntimeException("先备份整个工程                       Mapp.java源代码未保存");
//        }

        pathHelper.mkPackage();

        rdbHelper.getAllTableNames();
        rdbHelper.getAllTableComment();
        rdbHelper.getAllField();

        javaManager.createAllPO();  //含注解提取  cn.zhsit.orm.helpers.POHelper.addAnnotation(....)
        javaManager.translateAnnotation();//转化注解




        javaManager.createProvider();
        javaManager.createAllQuery();
        javaManager.createAllRemove();
        javaManager.createAllModify();

        javaManager.createMapper();
        javaManager.createManager();
        javaManager.createManagerImpl();
        javaManager.createService();
        javaManager.createServiceImpl();
        javaManager.createController();
//
        javaManager.createSolid();
        javaManager.createConfig();
        javaManager.copyFiles();
        System.exit(0);
        while (true) {
            Thread.currentThread().sleep(1000);
            System.exit(0);
        }
    }
}
