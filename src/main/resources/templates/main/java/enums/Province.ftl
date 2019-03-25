package ${gen.enumPackage?replace("/",".")};

public enum Province {

    beiJing("北京", "bj", "11"),
    tianJin("天津", "tj", "12"),
    heBei("河北", "hebei"),
    shanXi1("山西", "sx1"),
    neiMengGu("内蒙古", "nmg"),
    liaoNing("辽宁", "ln"),
    jiLin("吉林", "jl"),
    heiLongJiang("黑龙江", "hlj"),
    shangHai("上海", "sh"),
    jiangSu("江苏", "js"),
    zheJiang("浙江", "zj"),
    anHui("安徽", "ah"),
    fuJian("福建", "fj"),
    jiangXi("江西", "jx"),
    shanDong("山东", "sd"),
    heNan("河南", "henan"),
    huBei("湖北", "hubei"),
    huNan("湖南", "hunan"),
    guangDong("广东", "gd"),
    guangXi("广西", "gx"),
    haiNan("海南", "hainan"),
    chongQing("重庆", "cq"),
    siChuan("四川", "sc"),
    guiZhou("贵州", "gz"),
    yunNan("云南", "yn"),
    xiZang("西藏", "xz"),
    shanXi3("陕西", "sx3"),
    ganSu("甘肃", "gs"),
    qingHai("青海", "qh"),
    ningXia("宁夏", "nx"),
    xinJiang("新疆", "xj"),
    taiWan("台湾", "tw"),
    xiangGang("香港", "xg"),
    aoMen("澳门", "am"),
    guoWai("国外", "gw");

    private String num;
    private String shorName;
    private String fullName;
    private String code;
    private int orderNum;

    private Province(String shorName) {
        this.shorName = shorName;
    }

    private Province(String shorName, String code) {
        this.shorName = shorName;
        this.code = code;
    }

    private Province(String shorName, String code, int orderNum) {
        this.shorName = shorName;
        this.code = code;
        this.orderNum = orderNum;
    }

    private Province(String shorName, String code, String num) {
        this.shorName = shorName;
        this.num = num;
        this.code = code;
        this.orderNum = orderNum;
    }

    private Province(String shorName, String code, String num, int orderNum) {
        this.shorName = shorName;
        this.num = num;
        this.code = code;
        this.orderNum = orderNum;
    }

    private Province(String shorName, String code, int orderNum, String fullName) {
        this.shorName = shorName;
        this.code = code;
        this.orderNum = orderNum;
        this.fullName = fullName;
    }


    public static Province ofName(String shorName) {
        Province[] provinces = Province.values();
        for (Province p : provinces) {
            if (p.shorName.equals(shorName)) {
                return p;
            }
        }
        return null;
    }

    public static Province ofCode(String code) {
        Province[] provinces = Province.values();
        for (Province p : provinces) {
            if (p.code.equals(code)) {
                return p;
            }
        }
        return null;
    }

    public static Province ofNum(String num) {
        Province[] provinces = Province.values();
        for (Province p : provinces) {
            if (p.num.equals(num)) {
                return p;
            }
        }
        return null;
    }

    public String shorName() {
        return this.shorName;
    }

    public String code() {
        return this.code;
    }

    public String num() {
        return num;
    }
}