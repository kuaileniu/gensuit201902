package ${gen.controllerPackage?replace("/",".")};

import org.junit.*;
import static io.restassured.RestAssured.*;
import static io.restassured.matcher.RestAssuredMatchers.*;
import static org.hamcrest.Matchers.*;
import static io.restassured.module.jsv.JsonSchemaValidator.*;
import io.restassured.http.ContentType;
import io.restassured.response.Response;
import ${gen.utilPackage?replace("/",".")}.*;

public class LesseeControllerTest extends BaseControllerTest {


    @Test
    public void testAddOne() throws Exception {
        given().
                contentType(ContentType.JSON).
                body(ClazzUtil.fetchTestSourceFile("lessee.json",this.getClass())).
        when().
                post("/api/zlessee/addone").
         then().
                statusCode(200).
                body("status", equalTo(0));//返回的数据json中的status 的值为0;
    }
}