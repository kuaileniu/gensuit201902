package cn.zhsit.utils;

import cn.zhsit.constants.GenConstants;

import java.io.File;
import java.util.StringJoiner;

/**
 * Created by Administrator on 2018/3/30.
 */
public class ZhsStringUtil {
    /**
     * 截取最后一个 字符串之前的部分
     * @param str
     * @param search
     * @return
     */
    public static String beforeLast(final String str, String search) {
        int endIndex = str.lastIndexOf(search);
        return str.substring(0, endIndex);
    }

    /**
     * 从字符串str中查找第一个search所在的位置索引
     *
     * @param str
     * @param search
     * @return
     */
    public static int firstIndex(String str, String search) {
        return str.indexOf(search);
    }

    /**
     * 从字符串str的fromIndex位置之后查找第一个search所在的位置索引
     *
     * @param str
     * @param search
     * @param fromIndex
     * @return
     */
    public static int firstIndex(String str, String search, int fromIndex) {
        return str.indexOf(search, fromIndex);
    }

    /**
     * 将str中的 以 start开始，以end结束的部分删除
     * 操作员ID[![Mine('code')]!],一对一关系  返回： 操作员ID,一对一关系
     *
     * @param str
     * @param start
     * @param end
     * @return
     */
    public static String removeFirst(final String str, final String start, final String end) {
        StringJoiner joiner = new StringJoiner("");
        int startIndex = firstIndex(str, start);
        if (startIndex < 0) {
            return str;
//            throw new RuntimeException("语法错误，未正确开始," + start);
        }
        int endIndex = firstIndex(str, end, startIndex);
        if (endIndex <= startIndex) {
            throw new RuntimeException("语法错误，未正确结尾," + end);
        }
        endIndex += end.length();
        joiner.add(str.substring(0, startIndex));
        joiner.add(str.substring(endIndex));
        return joiner.toString();
    }

    /**
     * "姓名[![Rong(t_order.user_name,t_login_log.user_name)]!]",返回 t_order.user_name,t_login_log.user_name
     *
     * @param str
     * @param start
     * @param end
     * @return
     */
    public static String getVal(final String str, final String start, final String end) {
        int startIndex = firstIndex(str, start);
        if (startIndex < 0) {
            return null;
        }
        int endIndex = firstIndex(str, end, startIndex);
        if ((endIndex - 1) <= (startIndex + start.length() + 1)) {
            return null;
        }
        return str.substring(startIndex + start.length() + 1, endIndex - 1);
    }

    public static void main(String[] args) {
        String str = "操作员ID[![Mine('code')]!],一对一关系";
        //        String str = "[![Mine('code')]!]";
        str = "操作员[![Mine('code')]!],[![Key('code')]!]用户";
        str = "姓名[![Rong(t_order.user_name,t_login_log.user_name)]!]";

        System.out.println(removeFirst(str, GenConstants.comment_Mine_prefix, GenConstants.annotationPostFix));
        System.out.println(removeFirst(str, "[![Key", GenConstants.annotationPostFix));
        str = "姓名[![Rong(t_order.user_name,t_login_log.user_name)]!]";
        str = "姓名[![Rong()]!]";
        str = "姓名[![Rong('')]!]";
        System.out.println(getVal(str, GenConstants.comment_Rong_prefix, GenConstants.annotationPostFix));

        String path = "D:\\src\\gensuite";
        System.out.println(beforeLast(path, "\\"));
        System.out.println(beforeLast(path, File.separator));
    }

}
