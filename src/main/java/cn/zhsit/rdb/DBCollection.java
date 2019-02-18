package cn.zhsit.rdb;

import cn.zhsit.models.dbinfo.Field;
import cn.zhsit.models.dbinfo.Table;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Component;

import java.util.ArrayList;
import java.util.Collections;
import java.util.LinkedList;
import java.util.List;
import java.util.concurrent.ConcurrentHashMap;


/**
 * Created by Administrator on 2018/3/19.
 */
@Component
public class DBCollection {
    private Logger log = LoggerFactory.getLogger(this.getClass());
    private final ConcurrentHashMap<String, Table> tableStore = new ConcurrentHashMap<>();
    private static final List<Field> fieldStore = Collections.synchronizedList(new LinkedList<>());

    public void addTable(Table table) {
        tableStore.put(table.getName(), table);
    }

    public List<Table> findAllTables() {
        List<Table> tables = new ArrayList<>();
        tableStore.forEach((name, table) -> {
            tables.add(table);
        });
        return tables;
    }

    public static void addField(Field field) {
        fieldStore.add(field);
    }

    public  Table findTableByName(String tableNme) {
        return tableStore.get(tableNme);
    }

    public List<Field> findFieldByTable(String tableName) {
        List<Field> list = new ArrayList<>();
        fieldStore.forEach(field -> {
            if (tableName.equals(field.getTableName())) {
                list.add(field);
            }
        });
        return list;
    }
}
