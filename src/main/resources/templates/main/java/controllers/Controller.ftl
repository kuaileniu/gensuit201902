package ${gen.controllerPackage?replace("/",".")};

import java.util.*;
import ${gen.utilPackage?replace("/",".")}.*;
import ${gen.poPackage?replace("/",".")}.*;
<#--import ${gen.helperPackage?replace("/",".")}.*;-->
import ${gen.modelPackage?replace("/",".")}.*;
import ${gen.annotationPackage?replace("/",".")}.*;
import ${gen.handlerPackage?replace("/",".")}.*;
import ${gen.constantsPackage?replace("/",".")}.*;
import ${gen.queryPackage?replace("/",".")}.*;
import ${gen.removePackage?replace("/",".")}.*;
import ${gen.enumPackage?replace("/",".")}.*;
import org.springframework.stereotype.Controller;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import org.springframework.util.MultiValueMap;
import org.springframework.web.multipart.*;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import javax.servlet.http.*;

@Controller
@RequestMapping("api/gen${entityName?lower_case}")
public class Gen${entityName}${gen.controllerPostfix} {
    private Logger log = LoggerFactory.getLogger(this.getClass());

    <#--@Autowired-->
    <#--private CacheHelper cacheHelper;-->

    @Autowired
    private BaseController bc;

    @APermission(code = "form/gen${entityName?lower_case}${AuthoritySeparator}addone", text = "添加单个${info.po.table.comment}(Form)")
    @PostMapping("/form/addone")
    @ResponseBody
    private ResponseModel formAddOne(${entityName}${gen.poPostfix} o) {
        if ("local".equals(bc.runEnv)) {
            log.info("gen${entityName?lower_case}_form_addone" + StringUtil.toJson(o));
        }
        return this.addOne(o);
    }

    @APermission(code = "gen${entityName?lower_case}${AuthoritySeparator}addone", text = "添加单个${info.po.table.comment}")
    @PostMapping("/addone")
    @ResponseBody
    public ResponseModel addOne(@RequestBody ${entityName}${gen.poPostfix} o) {
        if ("local".equals(bc.runEnv)) {
            log.info("gen${entityName?lower_case}_addone" + StringUtil.toJson(o));
        }
        return bc.gen${entityName}${gen.servicePostfix}.add(o);
    }
<#if javaCollection.getAAnnotationMapPO("ALessee")??>
    <#if javaCollection.getAnnotationByName("LesseeId")??>
        <#list javaCollection.getAnnotationByName("LesseeId") as POproperty>
            <#if POproperty.po.entityName=="${entityName}">

    @APermission(code = "gen${entityName?lower_case}${AuthoritySeparator}addonesamelessee", text = "添加同租户的单个${info.po.table.comment}")
    @PostMapping("/addonesamelessee")
    @ResponseBody
    public ResponseModel addOneSameLessee(@RequestBody ${entityName}${gen.poPostfix} o) {
        ${javaCollection.getAAnnotationMapPO("ALessee").entityName} lessee = (${javaCollection.getAAnnotationMapPO("ALessee").entityName}) ContextHandler.Instance.getLessee();
        if (lessee != null) {
            o.set${POproperty.property?cap_first}(lessee.getId());
        }
        <#list javaCollection.getAnnotationByName("SystemCode") as SystemCodePOproperty>
            <#if SystemCodePOproperty.po.entityName=="${entityName}">
        String syscode = ContextHandler.Instance.getSystemCode();
        o.set${SystemCodePOproperty.property?cap_first}(syscode);
                <#break>
            </#if>
        </#list>
        return bc.gen${entityName}${gen.servicePostfix}.add(o);
    }
            <#break>
            </#if>
        </#list>
    </#if>
</#if>
<#if javaCollection.getAAnnotationMapPO("AUser")??>
    <#if javaCollection.getAnnotationByName("UserId")??>
        <#list javaCollection.getAnnotationByName("UserId") as POproperty>
            <#if POproperty.po.entityName=="${entityName}">

    @APermission(code = "form/gen${entityName?lower_case}${AuthoritySeparator}addmineone", text = "添加自己的单个${info.po.table.comment}(Form)")
    @PostMapping("/form/addmineone")
    @ResponseBody
    public ResponseModel formAddMineOne(${entityName}${gen.poPostfix} o) {
        if ("local".equals(bc.runEnv)) {
            log.info("gen${entityName?lower_case}_form_addmineone" + StringUtil.toJson(o));
        }
        return addMineOne(o);
    }
            <#break>
            </#if>
        </#list>
    </#if>
</#if>
<#if javaCollection.getAAnnotationMapPO("AUser")??>
    <#if javaCollection.getAnnotationByName("UserId")??>
        <#list javaCollection.getAnnotationByName("UserId") as POproperty>
            <#if POproperty.po.entityName=="${entityName}">

    @APermission(code = "gen${entityName?lower_case}${AuthoritySeparator}addmineone", text = "添加自己的单个${info.po.table.comment}")
    @PostMapping("/addmineone")
    @ResponseBody
    public ResponseModel addMineOne(@RequestBody ${entityName}${gen.poPostfix} o) {
        if ("local".equals(bc.runEnv)) {
            log.info("gen${entityName?lower_case}_addmineone" + StringUtil.toJson(o));
        }
        o.set${POproperty.property?cap_first}((${POproperty.propertyType}) ContextHandler.Instance.getUserId());
        <#list javaCollection.getAnnotationByName("SystemCode") as SystemCodePOproperty>
            <#if SystemCodePOproperty.po.entityName=="${entityName}">
        String syscode = ContextHandler.Instance.getSystemCode();
        o.set${SystemCodePOproperty.property?cap_first}(syscode);
                <#break>
            </#if>
        </#list>
        ResponseModel responseModel = bc.gen${entityName}${gen.servicePostfix}.add(o);
        <#--if (ResponseModel.SUCCESS == responseModel.getStatus()) {-->
            <#--responseModel.setMsg(o.getId());-->
        <#--}-->
        return responseModel;
    }
            <#break>
            </#if>
        </#list>
    </#if>
</#if>
<#if javaCollection.getAnnotationByName("Mine")??>
    <#list javaCollection.getAnnotationByName("Mine") as POproperty>
        <#if POproperty.po.entityName=="${entityName}">

    @APermission(code = "gen${entityName?lower_case}${AuthoritySeparator}addmineone", text = "添加本人的单个${info.po.table.comment}")
    @PostMapping("/addmineone")
    @ResponseBody
    public Response addMineOne(@RequestBody ${entityName}${gen.poPostfix} o) {
        if ("local".equals(bc.runEnv)) {
            log.info("gen${entityName?lower_case}_addmineone" + StringUtil.toJson(o));
        }
        boolean r = bc.gen${entityName}${gen.servicePostfix}.addMine(o);
        return Response.ok();
    }
            <#break>
        </#if>
    </#list>
</#if>

    @APermission(code = "gen${entityName?lower_case}${AuthoritySeparator}addmany", text = "添加多个${info.po.table.comment}")
    @PostMapping("/addmany")
    @ResponseBody
    public ResponseModel addMany(@RequestBody ${entityName}${gen.poPostfix}[] os) {
        if ("local".equals(bc.runEnv)) {
            log.info("gen${entityName?lower_case}_addmany" + StringUtil.toJson(os));
        }
        return bc.gen${entityName}${gen.servicePostfix}.add(os);
    }
<#if javaCollection.getAAnnotationMapPO("ALessee")??>
    <#if javaCollection.getAnnotationByName("LesseeId")??>
        <#list javaCollection.getAnnotationByName("LesseeId") as POproperty>
            <#if POproperty.po.entityName=="${entityName}">

    @APermission(code = "gen${entityName?lower_case}${AuthoritySeparator}addmanaysamelessee", text = "添加同租户的多个${info.po.table.comment}")
    @PostMapping("/addmanysamelessee")
    @ResponseBody
    public ResponseModel addManySameLessee(@RequestBody ${entityName}${gen.poPostfix}[] os) {
        if ("local".equals(bc.runEnv)) {
            log.info("gen${entityName?lower_case}_addmanysamelessee" + StringUtil.toJson(os));
        }
        ${javaCollection.getAAnnotationMapPO("ALessee").entityName} lessee = (${javaCollection.getAAnnotationMapPO("ALessee").entityName}) ContextHandler.Instance.getLessee();
        if (lessee != null) {
            for (${entityName}${gen.poPostfix} o : os){
                o.set${POproperty.property?cap_first}(lessee.getId());
            }
        }
        <#list javaCollection.getAnnotationByName("SystemCode") as SystemCodePOproperty>
            <#if SystemCodePOproperty.po.entityName=="${entityName}">
        String syscode = ContextHandler.Instance.getSystemCode();
        for (${entityName}${gen.poPostfix} o : os) {
            o.set${SystemCodePOproperty.property?cap_first}(syscode);
        }
                <#break>
            </#if>
        </#list>
        return bc.gen${entityName}${gen.servicePostfix}.add(os);
    }
            <#break>
            </#if>
        </#list>
    </#if>
</#if>
<#if javaCollection.getAAnnotationMapPO("AUser")??>
    <#if javaCollection.getAnnotationByName("UserId")??>
        <#list javaCollection.getAnnotationByName("UserId") as POproperty>
            <#if POproperty.po.entityName=="${entityName}">
                <#list info.po.keyList as propertyNameType>
                    <#if propertyNameType_index==0 >
                        <#list propertyNameType?keys as propertyName>

    @APermission(code = "gen${entityName?lower_case}${AuthoritySeparator}delminebyid", text = "根据id删除自己的${info.po.table.comment}")
    @PostMapping("/delminebyid/{id}")
    @ResponseBody
    public ResponseModel delMineById(@PathVariable("id") ${propertyNameType[propertyName]} id){
        if ("local".equals(bc.runEnv)) {
            log.info("gen${entityName?lower_case}_delminebyid" + StringUtil.toJson(id));
        }
        ${entityName}${gen.removePostfix} remove = new ${entityName}${gen.removePostfix}();
        remove.WHERE(${entityName}${gen.removePostfix}.COLUMN.id,WhereRelate.Equal,id);
        remove.WHERE(${entityName}${gen.removePostfix}.COLUMN.${POproperty.property},WhereRelate.Equal,ContextHandler.Instance.getUserId());
        return bc.gen${entityName}${gen.servicePostfix}.del(remove);
    }
                        </#list>
                    </#if>
                </#list>
                <#break>
            </#if>
        </#list>
    </#if>
</#if>
<#if ( info.po.keyList?size== 1 ) >
<#list info.po.keyList as propertyNameType>
    <#if propertyNameType_index==0 >
            <#list propertyNameType?keys as propertyName>

    @APermission(code = "gen${entityName?lower_case}${AuthoritySeparator}delbyid", text = "根据id删除${info.po.table.comment}")
    @PostMapping("/delbyid")
    @ResponseBody
    public ResponseModel delById(@RequestBody ${entityName}${gen.poPostfix} o){
        if ("local".equals(bc.runEnv)) {
            log.info("gen${entityName?lower_case}_delbyid" + StringUtil.toJson(o));
        }
        return bc.gen${entityName}${gen.servicePostfix}.delByIdObj(o).setMsg("操作完成！");
    }
            </#list>
    </#if>
</#list>
</#if>

    @APermission(code = "from/gen${entityName?lower_case}${AuthoritySeparator}modifybyid", text = "根据主键修改单个${info.po.table.comment}(Form)")
    @PostMapping("/form/modifybyid")
    @ResponseBody
    public ResponseModel formModifyById(${entityName}${gen.poPostfix} o) {
        if ("local".equals(bc.runEnv)) {
            log.info("gen${entityName?lower_case}_form_modifybyid" + StringUtil.toJson(o));
        }
        return this.modifyById(o);
    }

    @APermission(code = "gen${entityName?lower_case}${AuthoritySeparator}modifybyid", text = "修改单个${info.po.table.comment}")
    @PostMapping("/modifybyid")
    @ResponseBody
    public ResponseModel modifyById(@RequestBody ${entityName}${gen.poPostfix} o) {
        if ("local".equals(bc.runEnv)) {
            log.info("gen${entityName?lower_case}_modifybyid" + StringUtil.toJson(o));
        }
        return bc.gen${entityName}${gen.servicePostfix}.modifyByKey(o);
    }

    @APermission(code = "gen${entityName?lower_case}${AuthoritySeparator}modifywithoutnullbyid", text = "修改单个${info.po.table.comment},空值的属性不修改(Form)")
    @PostMapping("/form/modifywithoutnullbyid")
    @ResponseBody
    public ResponseModel formModifyWithOutNullById(${entityName}${gen.poPostfix} o) {
        if ("local".equals(bc.runEnv)) {
            log.info("gen${entityName?lower_case}_form_modifywithoutnullbyid" + StringUtil.toJson(o));
        }
        return this.modifyWithOutNullById(o);
    }

    @APermission(code = "gen${entityName?lower_case}${AuthoritySeparator}modifywithoutnullbyid", text = "修改单个${info.po.table.comment},空值的属性不修改")
    @PostMapping("/modifywithoutnullbyid")
    @ResponseBody
    public ResponseModel modifyWithOutNullById(@RequestBody ${entityName}${gen.poPostfix} o) {
        if ("local".equals(bc.runEnv)) {
            log.info("gen${entityName?lower_case}_modifywithoutnullbyid" + StringUtil.toJson(o));
        }
        return bc.gen${entityName}${gen.servicePostfix}.modifyWithOutNullByKey(o);
    }

<#if javaCollection.getAnnotationByName("Mine")??>
    <#list javaCollection.getAnnotationByName("Mine") as POproperty>
        <#if POproperty.po.entityName=="${entityName}">
            <#if ( info.po.keyList?size== 1 ) >
                <#list info.po.keyList as propertyNameType>
                    <#if propertyNameType_index==0 >
                        <#list propertyNameType?keys as propertyName>
    @APermission(code = "gen${entityName?lower_case}${AuthoritySeparator}queryminebyid", text = "根据id查询自己的${info.po.table.comment}")
    @GetMapping("/queryminebyid/{id}")
    @ResponseBody
    public ResponseModel queryMineById(@PathVariable("id") ${propertyNameType[propertyName]} id){
        if ("local".equals(bc.runEnv)) {
            log.info("gen${entityName?lower_case}_queryminebyid" + StringUtil.toJson(id));
        }
                            ${entityName}${gen.queryPostfix}.WhereItem idItem = new ${entityName}${gen.queryPostfix}.WhereItem(${entityName}${gen.queryPostfix}.COLUMN.${propertyName}, Comparative.Equal, id);
        ${entityName}${gen.queryPostfix}.WhereItem mine = new ${entityName}${gen.queryPostfix}.WhereItem(${entityName}${gen.queryPostfix}.COLUMN.${propertyName}, Comparative.Equal, id);
        return bc.orderService.findMineOneByWhere(idItem,mine);
    }
                        </#list>
                    </#if>
                </#list>
            </#if>
            <#break>
        </#if>
    </#list>
</#if>
<#if ( info.po.keyList?size== 1 ) >
<#list info.po.keyList as propertyNameType>
    <#if propertyNameType_index==0 >
            <#list propertyNameType?keys as propertyName>

    @APermission(code = "gen${entityName?lower_case}${AuthoritySeparator}querybyid", text = "根据ID查询${info.po.table.comment}")
    @GetMapping("/querybyid/{id}")
    @ResponseBody
    public ResponseModel queryById(@PathVariable("id") ${propertyNameType[propertyName]} id) {
        if ("local".equals(bc.runEnv)) {
            log.info("gen${entityName?lower_case}_querybyid" + StringUtil.toJson(id));
        }
        return bc.gen${entityName}${gen.servicePostfix}.findExcludeHiddenByKey(id);
    }
            </#list>
    </#if>
</#list>
</#if>

    @APermission(code = "gen${entityName?lower_case}${AuthoritySeparator}query", text = "查询${info.po.table.comment}列表")
    @PostMapping("/query")
    @ResponseBody
    public ResponseModel query(@RequestBody RequestModel requestModel) {
        <#--if (requestModel.getWhereItems() == null) {-->
            <#--return ResponseModel.ok().setCode(0);-->
        <#--}-->
        if ("local".equals(bc.runEnv)) {
            log.info("gen${entityName?lower_case}_query" + StringUtil.toJson(requestModel));
        }
        return bc.gen${entityName}${gen.servicePostfix}.findList(requestModel);
    }

<#if javaCollection.getAAnnotationMapPO("ALessee")??>
    <#if javaCollection.getAnnotationByName("LesseeId")??>
        <#list javaCollection.getAnnotationByName("LesseeId") as POproperty>
            <#if POproperty.po.entityName=="${entityName}">

    @APermission(code = "gen${entityName?lower_case}${AuthoritySeparator}querysamelessee", text = "查询同租户的${info.po.table.comment}")
    @PostMapping("/querysamelessee")
    @ResponseBody
    public ResponseModel querySameLessee(@RequestBody RequestModel requestModel) {
        if ("local".equals(bc.runEnv)) {
            log.info("gen${entityName?lower_case}_querysamelessee" + StringUtil.toJson(requestModel));
        }
        if (requestModel.getWhereItems() == null) {
            return ResponseModel.error();
        }
        ${javaCollection.getAAnnotationMapPO("ALessee").entityName} lessee = (${javaCollection.getAAnnotationMapPO("ALessee").entityName}) ContextHandler.Instance.getLessee();
        if (lessee != null) {
            requestModel.getWhereItems().add(new RequestModel.WhereItem().setProp(${entityName}${gen.queryPostfix}.COLUMN.${POproperty.property}.name()).setWhereRelate(WhereRelate.Equal).setVals(lessee.getId()));
        }
        return bc.gen${entityName}${gen.servicePostfix}.findList(requestModel);
    }
                <#break>
            </#if>
        </#list>
    </#if>
</#if>
<#if javaCollection.getAnnotationByName("Mine")??>
    <#list javaCollection.getAnnotationByName("Mine") as POproperty>
        <#if POproperty.po.entityName=="${entityName}">

    @APermission(code = "gen${entityName?lower_case}${AuthoritySeparator}querymine", text = "查询自己的${info.po.table.comment}列表")
    @PostMapping("/querymine")
    @ResponseBody
    public ResponseModel queryMine(@RequestBody List<Map> o) {
        if ("local".equals(bc.runEnv)) {
            log.info("gen${entityName?lower_case}_querymine" + StringUtil.toJson(o));
        }
        List<${entityName}${gen.poPostfix}> ls = bc.gen${entityName}${gen.servicePostfix}.findMineList(o);
        return ResponseModel.ok().setCode(0);
    }
        <#break>
        </#if>
    </#list>
</#if>

    @APermission(code = "gen${entityName?lower_case}${AuthoritySeparator}count", text = "查询${info.po.table.comment}总数")
    @PostMapping("/count")
    @ResponseBody
    public ResponseModel count(@RequestBody RequestModel requestModel) {
        if ("local".equals(bc.runEnv)) {
            log.info("gen${entityName?lower_case}_count" + StringUtil.toJson(requestModel));
        }
        if (requestModel.getWhereItems() == null) {
            return ResponseModel.error();
        }
        return bc.gen${entityName}${gen.servicePostfix}.count(requestModel);
    }

    @APermission(code = "gen${entityName?lower_case}${AuthoritySeparator}counts", text = "查询${info.po.table.comment}总数(多个)")
    @PostMapping("/counts")
    @ResponseBody
    public ResponseModel[] counts(@RequestBody RequestModel[] requestModels) {
        if ("local".equals(bc.runEnv)) {
            log.info("gen${entityName?lower_case}_counts" + StringUtil.toJson(requestModels));
        }
        return bc.gen${entityName}${gen.servicePostfix}.counts(requestModels);
    }

    @APermission(code = "gen${entityName?lower_case}${AuthoritySeparator}findpage", text = "分页查询${info.po.table.comment}信息")
    @PostMapping("/findpage")
    @ResponseBody
    public ResponseModel findPage(@RequestBody RequestModel requestModel) {
        <#--if (requestModel.getWhereItems() == null) {-->
            <#--return ResponseModel.ok().setCode(0).paramErrorCode();-->
        <#--}-->
        if ("local".equals(bc.runEnv)) {
            log.info("gen${entityName?lower_case}${AuthoritySeparator}findpage" + StringUtil.toJson(requestModel));
        }
        return bc.gen${entityName}${gen.servicePostfix}.findPageModel(requestModel);
    }
<#if javaCollection.getAAnnotationMapPO("ALessee")??>
    <#if javaCollection.getAnnotationByName("LesseeId")??>
        <#list javaCollection.getAnnotationByName("LesseeId") as POproperty>
            <#if POproperty.po.entityName=="${entityName}">

    @APermission(code = "gen${entityName?lower_case}${AuthoritySeparator}findpagesamelessee", text = "分页查询同租户的${info.po.table.comment}")
    @PostMapping("/findpagesamelessee")
    @ResponseBody
    public ResponseModel findPageSameLessee(@RequestBody RequestModel requestModel) {
        if ("local".equals(bc.runEnv)) {
            log.info("gen${entityName?lower_case}_findpagesamelessee" + StringUtil.toJson(requestModel));
        }
        if (requestModel.getWhereItems() == null) {
            return ResponseModel.error();
        }
        ${javaCollection.getAAnnotationMapPO("ALessee").entityName} lessee = (${javaCollection.getAAnnotationMapPO("ALessee").entityName}) ContextHandler.Instance.getLessee();
        if (lessee != null) {
            requestModel.getWhereItems().add(new RequestModel.WhereItem().setProp(${entityName}${gen.queryPostfix}.COLUMN.${POproperty.property}.name()).setWhereRelate(WhereRelate.Equal).setVals(lessee.getId()));
        }
        return bc.gen${entityName}${gen.servicePostfix}.findPageModel(requestModel);
    }
                <#break>
            </#if>
        </#list>
    </#if>
</#if>
<#if javaCollection.getAnnotationByName("AFile")??>
    <#list javaCollection.getAnnotationByName("AFile") as POproperty>
        <#if POproperty.po.entityName=="${entityName}">

    @APermission(code = "gen${entityName?lower_case}${AuthoritySeparator}upload", text = "上传文件", descr = "上传文件")
    @PostMapping("upload")
    @ResponseBody
    public void upload(HttpServletRequest request) {
        MultipartHttpServletRequest mRequest = (MultipartHttpServletRequest) request;//request强制转换注意
        Map<String, String[]> parametersMap = mRequest.getParameterMap();
        MultiValueMap<String, MultipartFile> files = mRequest.getMultiFileMap();//可以获取到 fieldName与文件的一一对应关系
    }
            <#break>
        </#if>
    </#list>
</#if>
<#if javaCollection.getAnnotationByName("AFile")??>
    <#list javaCollection.getAnnotationByName("AFile") as POproperty>
        <#if POproperty.po.entityName=="${entityName}">

    @APermission(code = "gen${entityName?lower_case}${AuthoritySeparator}download", text = "下载文件", descr = "下载文件")
    @RequestMapping("download")
    @ResponseBody
    public void download() {

    }
            <#break>
        </#if>
    </#list>
</#if>
}