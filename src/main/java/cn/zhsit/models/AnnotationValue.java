package cn.zhsit.models;

import cn.zhsit.utils.JsonUtil;
import com.google.gson.Gson;
import com.google.gson.reflect.TypeToken;

import java.util.Arrays;
import java.util.List;

/**
 * 注解中的值对应的java对象
 * 姓名[![Rong([{"same":"t_user.name=t_order.user_name","key":"t_user.id=t_order.user_id"}])]!]
 * 原表的信息在等号左侧，目标的信息在等号右侧
 */
public class AnnotationValue {

    //外键关系，例："key":"t_user.id=t_order.user_id"
    private String key;
    //冗余字段名称，例："same":"t_user.name=t_order.user_name",
    private String same;

    public String getKey() {
        return key;
    }

    public void setKey(String key) {
        this.key = key;
    }

    public String getSame() {
        return same;
    }

    public void setSame(String same) {
        this.same = same;
    }

    public static void main(String[] args) {
        AnnotationValue av = new AnnotationValue();
        av.setKey("id=t_order.user_id");
        av.setSame("name=user_name");
        AnnotationValue av2 = new AnnotationValue();

        av2.setKey("id=t_login_log.user_id");
        av2.setSame("name=user_name");
        List list = Arrays.asList(av, av2);
        System.out.println(JsonUtil.toJson(list));

//        String s = "[{\"key\":\"id\\u003dt_order.user_id\",\"same\":\"name\\u003duser_name\"},{\"key\":\"id\\u003dt_login_log.user_id\",\"same\":\"name\\u003duser_name\"}]";
//        JsonUtil.toObject(s, List < AnnotationValue.class >.getClass());

        String s = "{\"key\":\"id=t_order.user_id\",\"same\":\"name=user_name\"}";
        AnnotationValue aaa = JsonUtil.toObject(s, AnnotationValue.class);
        System.out.println(aaa.getKey());
        System.out.println(aaa.getSame());
        String json = "[{\"same\":\"name=t_order.user_name\",\"key\":\"id=t_order.user_id\"}]";

        List<AnnotationValue> annotationValueList = JsonUtil.toObject(json,new TypeToken<List<AnnotationValue>>(){}.getType());
        for (AnnotationValue annotationValue : annotationValueList) {
            System.out.println(annotationValue.getSame());
            System.out.println(annotationValue.getKey());
        }
    }
}
