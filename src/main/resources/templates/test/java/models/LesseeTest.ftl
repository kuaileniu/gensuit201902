package ${gen.modelPackage?replace("/",".")};

import ${gen.basePackage?replace("/",".")}.GenApplication;
import ${gen.enumPackage?replace("/",".")}.*;
import ${gen.utilPackage?replace("/",".")}.*;
import ${gen.helperPackage?replace("/",".")}.*;
import ${gen.modelPackage?replace("/",".")}.*;
import ${gen.poPackage?replace("/",".")}.*;

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
public class LesseeTest {

    @Test
    public void toJson() {
        Lessee o = new Lessee();
        o.setName("评估中心");
        String json = JsonHelper.toJson(o);
        System.out.println(json);
    }
}