package ${gen.controllerPackage?replace("/",".")};

import org.junit.Before;

import static io.restassured.RestAssured.baseURI;
import static io.restassured.RestAssured.port;
import java.io.File;

public class BaseControllerTest {

    static {
        baseURI = "http://127.0.0.1";
        port = 88;
    }

    @Before
    public void setUp() {
//        baseURI = "http://127.0.0.1";
//        port = 88;
    }

}
