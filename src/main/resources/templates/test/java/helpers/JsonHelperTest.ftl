package ${gen.helperPackage?replace("/",".")};


import ${gen.basePackage?replace("/",".")}.GenApplication;
import org.junit.runner.RunWith;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.stereotype.Component;
import org.springframework.test.context.junit4.SpringRunner;
import org.junit.Test;

import java.sql.Timestamp;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

@RunWith(SpringRunner.class)
@SpringBootTest(classes =
        {
                GenApplication.class,
        })
@Component
public class JsonHelperTest {


    @Test
    public void toJson() {
        Map map = new HashMap<>();
        map.put("name", "bjzhs");

        Map org = new HashMap<>();
        org.put("address", "北京市");
        org.put("createTime", new Date());
        org.put("emp", 298);
        org.put("createTime", new Date(Timestamp.valueOf("2015-03-02 09:00:00.0").getTime()));//json中时间输出错误,需配置time-zone: GMT+8 解决
        org.put("zhan", Timestamp.valueOf("2017-05-06 15:54:21.0")); //json中时间输出错误，需配置time-zone: GMT+8 解决

        map.put("org", org);

        String json = JsonHelper.toJson(map);
        System.out.println(json);   //{"org":{"zhan":"2017-05-06 15:54:21","address":"北京市","createTime":"2015-03-02 09:00:00","emp":298},"name":"bjzhs"}
    }

}