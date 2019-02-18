package ${gen.controllerPackage?replace("/",".")};

import org.junit.*;
import static io.restassured.RestAssured.*;
import static io.restassured.matcher.RestAssuredMatchers.*;
import static org.hamcrest.Matchers.*;
import static io.restassured.module.jsv.JsonSchemaValidator.*;
//import static io.restassured.module.mockmvc.RestAssuredMockMvc.*;
import io.restassured.http.ContentType;
import io.restassured.response.Response;
import ${gen.utilPackage?replace("/",".")}.*;

public class UserControllerTest extends BaseControllerTest {

//  {
//        Response response = get("").thenReturn();
//        response.body().asString();
//        response.getHeader("");
//        response.sessionId();
//  }


    @Test
    public void testAddone() throws Exception {
        given().
                contentType(ContentType.JSON).
                body(ClazzUtil.fetchTestSourceFile("user.json",this.getClass())).
        when().
                post("/api/zuser/addone").
        then().
                statusCode(200).
                body("status",equalTo(0));//返回的数据json中的status 的值为0;

    }
}