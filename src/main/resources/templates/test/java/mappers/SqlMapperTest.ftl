package ${gen.mapperPackage?replace("/",".")};

import ${gen.basePackage?replace("/",".")}.GenApplication;
import ${gen.utilPackage?replace("/",".")}.*;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.stereotype.Component;
import org.springframework.test.context.junit4.SpringRunner;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by Administrator on 2018/4/28.
 */
@RunWith(SpringRunner.class)
@SpringBootTest(classes =
        {
                GenApplication.class,
        })
@Component
public class SqlMapperTest {
    @Autowired
    SqlMapper sqlMapper;


    @Test
    public void testSelectList() {
        Map<String, Object> params = new HashMap<>();
        String sql = "select * from t_user where id >= ${r"#"}{p.id}  order by ${r"#"}{p.ob} ";
        params.put("id", 1);
        params.put("ob", "id");
        List<Map> mapList = sqlMapper.selectList(sql, params);
        System.out.println(mapList.size());
        for (Map map : mapList) {
            System.out.println(map);
        }
    }

    
    @Test
    public void testSelectOne() {
        Map<String, Object> params = new HashMap<>();
        String sql = "select * from t_user where id = ${r"#"}{p.id}";
        params.put("id", 1);
        Map map = sqlMapper.selectOne(sql, params);
        System.out.println(map); //{login_name=a, user_type=2, create_time=2018-04-09 23:23:58.0, org_id=2, modify_time=2018-04-25 23:23:55.0, name=b, id=1, pwd=1, org_name=2}
    }

    
    @Test
    public void testSelectOneAs() {
        Map<String, Object> params = new HashMap<>();
        String sql = "select login_name loginName, user_type userType from t_user where id = ${r"#"}{p.id}";
        params.put("id", 1);
        Map map = sqlMapper.selectOne(sql, params);
        System.out.println(map); //{loginName=a, userType=2}
    }


    @Test
    public void testFenHaoInjection() {
        Map<String, Object> params = new HashMap<>();
        String sql = "select * from t_user where id = 1;drop table t_my";
        Map map = sqlMapper.selectOne(sql, params);  // 防注入成功
        System.out.println(map); 
    }
    
    
    @Test
    public void testWhereInjection() {
        Map<String, Object> params = new HashMap<>();
        String param = "12 or 1=1"; //界面用户录入的参数
        String sql = "select * from t_user where id = "+ param;
        Map map = sqlMapper.selectOne(sql, params);  // 注入成功
        System.out.println(map);
    }

    @Test
    public void testConvertMap(){
        Map<String, Object> params = new HashMap<>();
        String sql = "select * from t_user where id = ${r"#"}{p.id}";
        params.put("id", 1);
        Map source = sqlMapper.selectOne(sql, params);
        System.out.println(source); //{login_name=a, user_type=2, create_time=2018-04-09 23:23:58.0, org_id=2, modify_time=2018-04-25 23:23:55.0, name=b, id=1, pwd=1, org_name=2}
        Map rule = new HashMap<>();
        rule.put("login_name","loginName");
        rule.put("user_type","userType");
        rule.put("create_time","createTime");
        rule.put("org_id","orgId");
        Map result = JdbcUtil.convert(source,rule);
        System.out.println(result); //{createTime=2018-04-09 23:23:58.0, loginName=a, modify_time=2018-04-25 23:23:55.0, name=b, userType=2, id=1, pwd=1, org_name=2, orgId=2}
    }
}
