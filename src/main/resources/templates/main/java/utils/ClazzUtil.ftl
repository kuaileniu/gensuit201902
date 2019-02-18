package ${gen.utilPackage?replace("/",".")};

import java.lang.annotation.Annotation;
import java.util.*;
import java.lang.reflect.*;
import java.io.*;
import org.apache.commons.io.FileUtils;

/**
 * Class 反射工具类
 */
public class ClazzUtil {

    public final static String TestRootPath = new File("").getAbsolutePath() + File.separator + "src" + File.separator + "test" + File.separator + "java" + File.separator;

    // maven工程下的test路径
    public static String testSourcePath(Class clazz) {
        String packagePath = TestRootPath;
        String className = clazz.getName().toString();
        String javaPath = className.substring(0, className.lastIndexOf(".")).replace(".", File.separator);
        packagePath += javaPath + File.separator;
        return packagePath;
    }

    //取来测试包下的源文件
    public static File fetchTestSourceFile(String fileName, Class clazz) {
        String path = testSourcePath(clazz);
        File file = new File(path + fileName);
        return file;
    }

    //根据json文件生成对象
    public static <T> T fromFile(String fileName, Class<T> reflectClass, Class positionClass) throws IOException {
        String json = FileUtils.readFileToString(ClazzUtil.fetchTestSourceFile(fileName, positionClass));
        return StringUtil.fromJson(json, reflectClass);
    }

    //根据json文件生成List列表
    //List<ZMenu> menuList =  ClazzUtil.listFromFile("menu.json",new TypeToken<List<ZMenu>>(){}.getType(),this.getClass());
    public static <T> List<T> listFromFile(String fileName,Type type, Class positionClass) throws IOException {
        String json = FileUtils.readFileToString(ClazzUtil.fetchTestSourceFile(fileName, positionClass));
        return StringUtil.fromJson(json, type);
    }

    public static List<Method> getMethodWithAnnotation(Class clazz, Class<? extends Annotation> annotationType) {
        List<Method> list = new ArrayList<>();
        Method[] methods = clazz.getDeclaredMethods();
        for (Method method : methods) {
            Annotation an = method.getDeclaredAnnotation(annotationType);
            if (null != an) {
                list.add(method);
            }
        }
        return list;
    }

    
    /**
     * 注意：只能设置本类属性的值
     *
     * @param obj
     * @param propertyName
     * @param newVal
     */
    public static void setFieldValue(Object obj, String propertyName, Object newVal) {
        Class clazz = obj.getClass();
        for (Field field : clazz.getDeclaredFields()) {
            boolean fieldAccessible = field.isAccessible();
            field.setAccessible(true);
            try {
                if (field.getName().equals(propertyName)) {
                    field.set(obj, newVal);
                    break;
                }
            } catch (Throwable throwable) {
                System.err.println("ClazzUtil.setFieldValue  error,name:" + clazz.getName() + ",propertyName:" + propertyName + ",newVal:" + newVal);
            } finally {
                field.setAccessible(fieldAccessible);
            }
        }
    }

    /**
     * 注意：只能获取本类、父类、爷级类属性的值,不能获取更高别类的属性值
     *
     * @param obj
     * @param propertyName
     * @return
     */
    public static Object getFieldValue(final Object obj, final String propertyName) {
        Class clazz = obj.getClass();
        {
            Object val = getFieldVal(clazz, obj, propertyName);
            if (null != val) {
                return val;
            }
        }
        clazz = clazz.getSuperclass();
        {
            if (null != clazz) {
                Object val = getFieldVal(clazz, obj, propertyName);
                if (null != val) {
                    return val;
                }
            }
        }
        clazz = clazz.getSuperclass();
        {
            if (null != clazz) {
                Object val = getFieldVal(clazz, obj, propertyName);
                if (null != val) {
                    return val;
                }
            }
        }
        return null;
    }

    public static Object getFieldVal(final Class clazz, final Object obj, final String propertyName) {
        for (Field field : clazz.getDeclaredFields()) {
            boolean fieldAccessible = field.isAccessible();
            field.setAccessible(true);
            try {
                if (field.getName().equals(propertyName)) {
                    return field.get(obj);
                }
            } catch (Throwable throwable) {
                System.err.println("ClazzUtil.getObject  error,name:" + clazz.getName() + ",propertyName:" + propertyName);
            } finally {
                field.setAccessible(fieldAccessible);
            }
        }
        return null;
    }
    
    public static void copy(Object src, Object target) {
        Field[] fields = src.getClass().getDeclaredFields();
        for (Field field : fields) {
            boolean fieldAccessible = field.isAccessible();
            field.setAccessible(true);
            try {
                String propertyName = field.getName();
                Object val = getFieldValue(src, propertyName);
                if (val == null) {
                    continue;
                }
                setFieldValue(target, propertyName, val);
            } catch (Throwable throwable) {
                System.err.println("copy bean error");
            } finally {
                field.setAccessible(fieldAccessible);
            }
        }
    }
}