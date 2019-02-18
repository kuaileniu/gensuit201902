package cn.zhsit.rdb;

import cn.zhsit.configs.Gen;
import cn.zhsit.configs.RDB;
import cn.zhsit.constants.GenConstants;
import cn.zhsit.configs.Gen;
import cn.zhsit.configs.RDB;
import cn.zhsit.models.dbinfo.Field;
import cn.zhsit.models.dbinfo.Table;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import javax.sql.DataSource;
import java.io.UnsupportedEncodingException;
import java.sql.*;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by Administrator on 2018/3/19.
 */
@Component
public class RDBHelper {
    private Logger log = LoggerFactory.getLogger(this.getClass());
    @Autowired
    DBCollection dbCollection;
    @Autowired
    DataSource dataSource;
    @Autowired
    Gen gen;
    @Autowired
    RDB rdb;

    /**
     * 获取所有表名
     *
     * @return
     */
    public void getAllTableNames() throws Exception {
        Connection conn = dataSource.getConnection();
        DatabaseMetaData dbMetaData = conn.getMetaData();
        ResultSet tableRS = dbMetaData.getTables(null, rdb.schemaPattern, GenConstants.EMPTY_STR, new String[] { "TABLE" });;
        while (tableRS.next()) {
            // 表名 TABLE_NAME 大小写都可
            String tableName = tableRS.getString("TABLE_NAME").toLowerCase();
            if(!gen.createAll) {
                if(!gen.tableEntity.containsKey(tableName)){
                    continue;
                }
                Table table = new Table().setName(tableName);
                dbCollection.addTable(table);
            }
        }
    }

    public   void getAllTableComment() throws Exception {
        List<Table> tables = dbCollection.findAllTables();
        Connection conn = dataSource.getConnection();
        Statement stmt = conn.createStatement();
        for (Table table : tables) {
            ResultSet rs = stmt.executeQuery("SHOW CREATE TABLE " + table.getName());
            if (rs != null && rs.next()) {
                String createTableSql = rs.getString("Create Table"); // 等同  String createTableSql = rs.getString(2);
                String comment = getTableComment(createTableSql);
                table.setComment(comment);
            }
        }
    }

    private   String getTableComment(String createTableSql) {
        String comment = null;
        int index = createTableSql.indexOf("COMMENT='");
        if (index < 0) {
            return "";
        }
        comment = createTableSql.substring(index + 9);
        comment = comment.substring(0, comment.length() - 1);
        try {
            comment = new String(comment.getBytes("utf-8"));
        } catch (UnsupportedEncodingException e) {
            log.error("", e);
        }
        return comment;
    }



    public   void getAllField() throws Exception {
        Connection conn = dataSource.getConnection();
        DatabaseMetaData dbMetData = conn.getMetaData();
        List<Table> tables =dbCollection.findAllTables();


        for (Table table : tables) {
            Map<String, String> keys = new HashMap<>();
            ResultSet rs = dbMetData.getPrimaryKeys(null, null, table.getName());
            while (rs.next()) {
                keys.put(rs.getString("COLUMN_NAME"), rs.getString("COLUMN_NAME"));
//                log.info("表:{}的主键为{}", table.getName(), rs.getString(4));
//                log.info("表:{}的主键为{}", table.getName(), rs.getString("COLUMN_NAME"));
//                log.info("TABLE_CAT : " + rs.getObject(1));
//                log.info("TABLE_SCHEM: " + rs.getObject(2));
//                log.info("TABLE_NAME : " + rs.getObject(3));
//                log.info("COLUMN_NAME: " + rs.getObject(4));
//                log.info("KEY_SEQ : " + rs.getObject(5));
//                log.info("PK_NAME : " + rs.getObject(6));
            }
            ResultSet colRet = dbMetData.getColumns(null, "%", table.getName(), "%");
            int seq=1;
            while (colRet.next()) {
                Field field = new Field();
                field.setTableName(table.getName());
                field.setName(colRet.getString("COLUMN_NAME"));
                field.setType(colRet.getString("TYPE_NAME"));
                field.setNullable(colRet.getInt("NULLABLE") == 1);
                field.setSize(colRet.getInt("COLUMN_SIZE"));
                field.setDigits(colRet.getInt("DECIMAL_DIGITS"));
                field.setKey(keys.containsKey(field.getName()));
                field.setComment(colRet.getString("REMARKS"));
                field.setSeq(seq++);
                dbCollection.addField(field);
            }
        }
    }

}
