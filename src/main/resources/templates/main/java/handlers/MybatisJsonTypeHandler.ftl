package ${gen.handlerPackage?replace("/",".")};

import com.fasterxml.jackson.annotation.JsonInclude;
import com.fasterxml.jackson.core.JsonParser;
import com.fasterxml.jackson.databind.ObjectMapper;
import org.apache.ibatis.type.BaseTypeHandler;
import org.apache.ibatis.type.JdbcType;
import org.apache.ibatis.type.MappedJdbcTypes;

import java.sql.CallableStatement;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 * mysql 官方 JSON Functions 说明 https://dev.mysql.com/doc/refman/8.0/en/json-functions.html
 * https://dev.mysql.com/doc/refman/5.7/en/json-functions.html
 * 12.17.1 JSON Function Reference
 * 12.17.2 Functions That Create JSON Values
 * 12.17.3 Functions That Search JSON Values
 * 12.17.4 Functions That Modify JSON Values
 * 12.17.5 Functions That Return JSON Value Attributes
 * 12.17.6 JSON Table Functions
 * 12.17.7 JSON Utility Functions
 * How to Use JSON Data Fields in MySQL Databases https://www.sitepoint.com/use-json-data-fields-mysql-databases/
 * MySQL5.7中新增的JSON类型的使用方法 https://www.cnblogs.com/kuangke/p/5607471.html
 * https://gitee.com/ikaven1024/codes/ko6w2z31xgrul09hdtvfq32
 * https://www.cnblogs.com/qizhelongdeyang/p/9240600.html
 * @param <T>
 * mybatis 中 TypeHandler demohttps://www.e-learn.cn/content/mysql/865020
    https://github.com/jneat/mybatis-jackson
 */
@MappedJdbcTypes(JdbcType.VARCHAR)
public class MybatisJsonTypeHandler<T extends Object> extends BaseTypeHandler<T> {

    private static final ObjectMapper mapper = new ObjectMapper();
    private Class<T> clazz;

    public MybatisJsonTypeHandler(Class<T> clazz) {
        if (clazz == null) throw new IllegalArgumentException("Type argument cannot be null");
        this.clazz = clazz;
    }

    @Override
    public void setNonNullParameter(PreparedStatement ps, int i, T parameter, JdbcType jdbcType) throws SQLException {
        ps.setString(i, this.toJson(parameter));
    }

    @Override
    public T getNullableResult(ResultSet rs, String columnName) throws SQLException {
        return this.toObject(rs.getString(columnName), clazz);
    }

    @Override
    public T getNullableResult(ResultSet rs, int columnIndex) throws SQLException {
        return this.toObject(rs.getString(columnIndex), clazz);
    }

    @Override
    public T getNullableResult(CallableStatement cs, int columnIndex) throws SQLException {
        return this.toObject(cs.getString(columnIndex), clazz);
    }

    private String toJson(T object) {
        try {
            return mapper.writeValueAsString(object);
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }

    private T toObject(String content, Class<?> clazz) {
        if (content != null && !content.isEmpty()) {
            try {
                return (T) mapper.readValue(content, clazz);
            } catch (Exception e) {
                throw new RuntimeException(e);
            }
        } else {
            return null;
        }
    }

    static {
        mapper.configure(JsonParser.Feature.ALLOW_MISSING_VALUES, false);
        mapper.setSerializationInclusion(JsonInclude.Include.NON_NULL);
    }
}
