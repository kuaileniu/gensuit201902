package cn.zhsit.models;
/**
 * Created by Administrator on 2017/11/11.
 *   MyBatis 3(中文版) 第四章 使用注解配置SQL映射器
 *   http://blog.csdn.net/u013214151/article/details/52211614
 *   return new SQL()
 {
 {
 SELECT("t.tutor_id, t.name as tutor_name, email");
 SELECT("a.addr_id, street, city, state, zip, country");
 SELECT("course_id, c.name as course_name, description,
 start_date, end_date");
 FROM("TUTORS t");
 LEFT_OUTER_JOIN("addresses a on t.addr_id=a.addr_id");
 LEFT_OUTER_JOIN("courses c on t.tutor_id=c.tutor_id");
 WHERE("t.TUTOR_ID = #{id}");
 }
 } .toString();

 @One
 */
public class Provider extends ClassBase {
}
