package ${gen.controllerPackage?replace("/",".")};

import org.junit.*;
import static io.restassured.RestAssured.*;
import static io.restassured.matcher.RestAssuredMatchers.*;
import static org.hamcrest.Matchers.*;
import static io.restassured.module.jsv.JsonSchemaValidator.*;
//import static io.restassured.module.mockmvc.RestAssuredMockMvc.*;


public class CommonControllerTest extends BaseControllerTest {


    @Test
    public void testCollectAuthority(){
        post("/api/common/collectauthority").
        then().
            body("status",equalTo(0));
    }

}