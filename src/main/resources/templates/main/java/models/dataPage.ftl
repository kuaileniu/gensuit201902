package ${gen.modelPackage?replace("/",".")};

import java.util.List;
import com.fasterxml.jackson.annotation.JsonInclude;

@JsonInclude(JsonInclude.Include.NON_NULL)
public class DataPage {
//    //每页多少条
//    private int pageSize;
//    //当前是第几页
//    private int currentPage;
    //总条数
    private long total;
    //数据
    private List data;

//    public int getPageSize() {
//        return pageSize;
//    }
//
//    public DataPage setPageSize(int pageSize) {
//        this.pageSize = pageSize;
//        return this;
//    }
//
//    public int getCurrentPage() {
//        return currentPage;
//    }
//
//    public DataPage setCurrentPage(int currentPage) {
//        this.currentPage = currentPage;
//        return this;
//    }

    public long getTotal() {
        return total;
    }

    public DataPage setTotal(long total) {
        this.total = total;
        return this;
    }

    public List getData() {
        return data;
    }

    public DataPage setData(List data) {
        this.data = data;
        return this;
    }
}