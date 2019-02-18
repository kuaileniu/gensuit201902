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
import java.util.ArrayList;
import java.util.Map;
import javax.sql.*;
import java.sql.SQLException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;

/**
 * 测试数据源
 */
@RunWith(SpringRunner.class)
@SpringBootTest(classes =
        {
                GenApplication.class,
        })
@Component
public class DataSourceTest {
    @Autowired
    DataSource dataSource;

    @Test
    public void testConnect() throws Exception {
        Connection conn =dataSource.getConnection();
        PreparedStatement preparedStatement =conn.prepareStatement("select * from t_user");
        ResultSet result = preparedStatement.executeQuery();

        while (result.next()) {
            System.out.println(" login_name: " + result.getString("login_name"));
        }
    }


    @Test
    public void testAlis() throws Exception {
        Connection conn =dataSource.getConnection();
        PreparedStatement preparedStatement =conn.prepareStatement("select login_name loginName from t_user");
        ResultSet result = preparedStatement.executeQuery();

        while (result.next()) {
            // System.out.println(" login_name: " + result.getString("login_name"));   //java.sql.SQLException: Column 'login_name' not found.
            System.out.println(" loginName: " + result.getString("loginName"));
        }
    }

    @Test
    public void testSetObject() throws Exception {
        Connection conn =dataSource.getConnection();
        PreparedStatement preparedStatement =conn.prepareStatement("select login_name loginName from t_user where pwd=?");
        preparedStatement.setObject(1,"1a");  // setObject 为通用型
        ResultSet result = preparedStatement.executeQuery();
        while (result.next()) {
            System.out.println(" loginName: " + result.getString("loginName"));
        }
    }

    @Test
    public void testSetObjectNull() throws Exception {
        Connection conn =dataSource.getConnection();
        PreparedStatement preparedStatement =conn.prepareStatement("select login_name loginName from t_user where pwd=?");
        preparedStatement.setObject(1,null);  // setObject 为通用型,可以传入null
        ResultSet result = preparedStatement.executeQuery();
        while (result.next()) {
            System.out.println(" loginName: " + result.getString("loginName"));
        }
    }

    @Test
    public void testYuJuInjection() throws Exception {
        Connection conn =dataSource.getConnection();
        PreparedStatement preparedStatement =conn.prepareStatement("select * from t_user;drop TABLE t_mytest"); //可以防住此类sql注入
        ResultSet result = preparedStatement.executeQuery();
        while (result.next()) {
            System.out.println(" login_name: " + result.getString("login_name"));
        }
    }

    @Test
    public void testParamInjection() throws Exception {
        Connection conn =dataSource.getConnection();
        String param = "12 or 1=1"; //界面用户录入的参数
        String sql = "select * from t_user where id = "+ param;
        PreparedStatement preparedStatement =conn.prepareStatement(sql); //注入成功
        ResultSet result = preparedStatement.executeQuery();
        while (result.next()) {
            System.out.println(" login_name: " + result.getString("login_name"));
        }
    }
    
    @Test
    public void testResult2Map() throws Exception {
        Connection conn = dataSource.getConnection();
        PreparedStatement preparedStatement = conn.prepareStatement("select * from t_user");
        ResultSet result = preparedStatement.executeQuery();
        List<Map<String, Object>> list = JdbcUtil.resultSetToList(result);
        for (Map<String, Object> stringObjectMap : list) {
            stringObjectMap.forEach((key, val) -> {
                if (val == null){
                    System.out.println("key为" + key + "的值为空");
                    return;
                }
                System.out.println("key:" + key + "     val:" + val + "      type:" + val.getClass());
                //key:org_name     val:2      type:class java.lang.String
                //key:create_time     val:2018-04-09 23:23:58.0      type:class java.sql.Timestamp
            });
        }
    }

    <#--public static List<Map<String, Object>> ResultSetToList(ResultSet rs) throws SQLException {-->
        <#--List<Map<String, Object>> results = new ArrayList<>();-->
        <#--ResultSetMetaData rsmd = rs.getMetaData();-->
        <#--int colCount = rsmd.getColumnCount();-->
        <#--List<String> colNameList = new ArrayList<String>();-->
        <#--for (int i = 0; i < colCount; i++) {-->
            <#--colNameList.add(rsmd.getColumnName(i + 1));-->
        <#--}-->
        <#--while (rs.next()) {-->
            <#--for (int i = 0; i < colCount; i++) {-->
                <#--Map map = new HashMap<String, Object>();-->
                <#--String key = colNameList.get(i);-->
                <#--Object value = rs.getObject(colNameList.get(i));-->
                <#--map.put(key, value);-->

                <#--results.add(map);-->
            <#--}-->
        <#--}-->
        <#--return results;-->
    <#--}-->
}
