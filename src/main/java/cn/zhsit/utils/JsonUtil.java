package cn.zhsit.utils;

import com.google.gson.Gson;

import java.lang.reflect.Type;

/**
 * Created by Administrator on 2018/4/6.
 */
public class JsonUtil {
    static Gson gson = new Gson();

    public static <T> T toObject(String json, Class<T> clazz) {
        return gson.fromJson(json, clazz);
    }

    public static <T> T toObject(String json, Type type) {
        return gson.fromJson(json, type);
    }

    public static String toJson(Object obj) {
        return gson.toJson(obj);
    }
}
