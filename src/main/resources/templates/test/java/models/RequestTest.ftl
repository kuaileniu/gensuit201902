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


@RunWith(SpringRunner.class)
@SpringBootTest(classes =
        {
                GenApplication.class,
        })
@Component
public class RequestTest {

    @Test
    public void toJson() {
        Request req = new Request();
        RequestModel model = new RequestModel();
        req.setZproto("1");
        Map params = new HashMap<>();
        params.put("name","马云");
        model.setData(params);

        List<RequestModel.WhereItem> whereItems = new ArrayList<>();
        whereItems.add(new RequestModel.WhereItem().setProp("orgId").setWhereRelate(WhereRelate.Equal).setVals("Abc"));
        model.setWhereItems(whereItems);
        List data = new ArrayList<>();
        data.add(model);
        req.setData(data);
        String json = JsonHelper.toJson(req);
        System.out.println(json);
    }

    @Test
    public void fromJson() {
        String json = "{\"data\":[{\"zproto\":\"1\",\"seq\":null,\"data\":{\"name\":\"马云\"},\"relates\":[{\"prop\":\"orgId\",\"whereRelate\":\"Equal\",\"vals\":[\"Abc\"]}]}]}";
        Request req = JsonHelper.fromJson(json, Request.class);
        System.out.println(JsonHelper.toJson(req));
    }
}

