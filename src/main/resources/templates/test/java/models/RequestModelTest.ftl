package ${gen.modelPackage?replace("/",".")};

import ${gen.basePackage?replace("/",".")}.GenApplication;
import ${gen.enumPackage?replace("/",".")}.*;
import ${gen.utilPackage?replace("/",".")}.*;
import ${gen.helperPackage?replace("/",".")}.*;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.stereotype.Component;
import org.springframework.test.context.junit4.SpringRunner;

import java.util.*;

/**
 * 测试RequestModel
 */
@RunWith(SpringRunner.class)
@SpringBootTest(classes =
        {
                GenApplication.class,
        })
@Component
public class RequestModelTest {

    @Test
    public void toJson() {
        RequestModel model = new RequestModel();
//        model.setOp(Op.Query);
        Map<String,Object> data = new LinkedHashMap<>();
        data.put("pwd","123456");
        data.put("lesseeId","abcd");
        model.setData(data);
        <#--model.setSeq("u-c");-->
        List<RequestModel.WhereItem> whereItems = new ArrayList<>();
        model.setWhereItems(whereItems);

        whereItems.add(new RequestModel.WhereItem().setProp("id").setWhereRelate(WhereRelate.In).setVals("a","b"));
        whereItems.add(new RequestModel.WhereItem().setOrInner(true).setProp("name").setWhereRelate(WhereRelate.Equal).setVals("zhangsan"));
        String json = JsonHelper.toJson(model);
        System.out.println(json);
//      {"seq":"u-c","back":null,"sameReturn":null,"dtype":0,"data":{"pwd":"123456","lesseeId":"abcd"},"whereItems":[{"or":false,"prop":"id","whereRelate":"In","vals":["a","b"]},{"or":true,"prop":"name","whereRelate":"Equal","vals":["zhangsan"]}]}

        List<RequestModel> models = new ArrayList<>();
        models.add(model);
        String listJson = JsonHelper.toJson(models);
        System.out.println(listJson);
//     [{"seq":"u-c","back":null,"sameReturn":null,"dtype":0,"data":{"pwd":"123456","lesseeId":"abcd"},"whereItems":[{"or":false,"prop":"id","whereRelate":"In","vals":["a","b"]},{"or":true,"prop":"name","whereRelate":"Equal","vals":["zhangsan"]}]}]
    }

    @Test
    public void fromJson() {
//        String json = null;// 为null时抛异常
//        String json = "ab"; //非json时 不抛异常
        String json = "{}";

        RequestModel mode = JsonHelper.fromJson(json, RequestModel.class);
        System.out.println(mode.toString());
    }
}