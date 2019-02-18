package ${gen.modelLayuiPackage?replace("/",".")};


/**
 *
 */
public class LayResponseModel {
    //状态编码
    private int code;
    //返回消息
    private String msg;
    //返回数据，单个对象或数组
    private Object data;

    public int getCode() {
        return code;
    }

    public LayResponseModel setCode(int code) {
        this.code = code;
        return this;
    }

    public String getMsg() {
        return msg;
    }

    public LayResponseModel setMsg(String msg) {
        this.msg = msg;
        return this;
    }

    public Object getData() {
        return data;
    }

    public LayResponseModel setData(Object data) {
        this.data = data;
        return this;
    }
}
