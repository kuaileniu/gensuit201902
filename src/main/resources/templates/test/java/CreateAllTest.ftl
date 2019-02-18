package ${gen.basePackage?replace("/",".")};

import ${gen.mapperPackage?replace("/",".")}.*;
import org.junit.runner.RunWith;
import org.junit.*;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.stereotype.Component;
import org.springframework.test.context.junit4.SpringRunner;
import org.springframework.beans.factory.annotation.*;


@RunWith(SpringRunner.class)
@SpringBootTest(classes =
        {
                GenApplication.class,
//                UserMapperTest.class,
        })
@Component
public class CreateAllTest extends BaseTest {
//    @Autowired
//    UserMapperTest userMapperTest;

    @Override
    @Test
    public void createAll() {

    }
}