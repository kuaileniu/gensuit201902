package cn.zhsit.models.dbinfo;

/**
 * Created by Administrator on 2017/11/7.
 */
public class Table {
    private String name;
    private String comment;


    public String getName() {
        return name;
    }

    public Table setName(String name) {
        this.name = name;
        return this;
    }

    public String getComment() {
        return comment;
    }

    public Table setComment(String comment) {
        this.comment = comment;
        return this;
    }

    @Override
    public String toString() {
        return "Table{" +
                "name='" + name + '\'' +
                ", comment='" + comment + '\'' +
                '}';
    }
}
