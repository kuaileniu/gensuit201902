package ${gen.enumPackage?replace("/",".")};

/**
 * rest接口返回状态码
 */
public enum ResponseCode {
    dataSuccess(0,"数据正确返回"),
    dataFailure(1,"未正确返回数据"),


    ;
    private int code; //状态码
    private String content;

    private ResponseCode(int code, String content) {
        this.code = code;
        this.content = content;
    }

    public int code() {
        return code;
    }

    public String content() {
        return content;
    }
}
