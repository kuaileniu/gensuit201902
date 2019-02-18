package ${gen.commonControllerPackage?replace("/",".")};

import ${gen.servicePackage?replace("/",".")}.*;
import ${gen.controllerPackage?replace("/",".")}.*;
import ${gen.commonServicePackage?replace("/",".")}.*;
import org.springframework.stereotype.Controller;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.util.MultiValueMap;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import javax.servlet.http.HttpServletRequest;

import java.util.Map;

@Controller
public class FilesController {

    @Autowired
    private BaseController bc;
    @Autowired
    private FilesService filesService;

    @PostMapping("upload")
    @ResponseBody
    public void upload(HttpServletRequest request) {
        MultipartHttpServletRequest mRequest = (MultipartHttpServletRequest) request;//request强制转换注意
        Map<String, String[]> parametersMap = mRequest.getParameterMap();
        MultiValueMap<String, MultipartFile> files = mRequest.getMultiFileMap();//可以获取到 fieldName与文件的一一对应关系
    }

    @RequestMapping("download")
    public void download() {

    }

//    public static String setInsertGoodsData(String url,byte[] data){
//        String result=null;
//        RestClient restClient=new RestClient(WinkUtils.getClientConfig());
//        Resource resource=restClient.resource(url);
//        resource.header("X-Bmob-Application-Id", "你自己的APPID");
//        resource.header("X-Bmob-REST-API-Key",“你自己的APPKEY”);
//        resource.header("Content-Type", "image/jpeg");
//        ClientResponse response=resource.post(data);
//        int code=response.getStatusCode();
//        System.out.println("结果码:"+code);
//        if(code==201){
//            result=response.getEntity(String.class);
//        }
//        return result;
//    }
}
