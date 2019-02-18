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
public class ResponseTest {

    @Test
    public void testResponseMulti() {
        ResponseModel model = ResponseModel.ok();
        model.setSeq("u-c");
        model.setData(9);
        Response response = Response.ok().addData(model);
        String json = JsonHelper.toJson(response);
        System.out.println(json);
//        {"msg":[{"seq":"u-c","content":9}],"code":0}
        
        ResponseModel model2 = ResponseModel.ok();
        model2.setSeq("page-d");
        List<Map> dataList = new ArrayList<>();
        for (int i = 0; i < 2; i++) {
            Map data = new HashMap<>();
            data.put("userName", "bjzhs" + i);
            data.put("id", "abcdefg" + i);
            dataList.add(data);
        }

        model2.setData(new DataPage().setTotal(100).setData(dataList));
        Response response2 = Response.ok().addData(model,model2);
        String json2 = JsonHelper.toJson(response2);
        System.out.println(json2);
//        {"msg":[{"seq":"u-c","content":9},{"seq":"page-d","content":{"pageSize":0,"currentPage":0,"total":100,"data":[{"id":"abcdefg0","userName":"bjzhs0"},{"id":"abcdefg1","userName":"bjzhs1"}]}}],"code":0}
    }
}