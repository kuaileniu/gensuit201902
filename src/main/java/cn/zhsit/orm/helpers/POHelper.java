package cn.zhsit.orm.helpers;

import cn.zhsit.configs.Gen;
import cn.zhsit.constants.GenConstants;
import cn.zhsit.models.PO;
import cn.zhsit.models.POProperty;
import cn.zhsit.models.dbinfo.Field;
import cn.zhsit.models.dbinfo.Table;
import cn.zhsit.typemap.JavaPropPackage;
import cn.zhsit.typemap.Jdbc2JavaTypeMap;
import cn.zhsit.rdb.DBCollection;
import cn.zhsit.utils.ZhsStringUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import java.util.List;
import java.util.Map;

@Component
public class POHelper extends BaseHelper {


    public PO createPO(Table table) {
        PO po = new PO();
        addClassNameInfo(table, po);
        addPackageInfo(po);
        addPropertyInfo(po);
        addAnnotation(table, po);
        addClassRemarkInfo(po);
        addProperRemarkInfo(po);
        addImportsInfo(po);
        return po;
    }

    /**
     * 添加po名称(类名)信息
     *
     * @param table
     * @param po
     */
    private void addClassNameInfo(Table table, PO po) {
        String tableName = table.getName();
        po.setTableName(tableName);
        po.setTable(table);
        String entityName = gen.tableEntity.get(tableName);
        if (entityName == null || entityName.trim().equals("")) {
            throw new RuntimeException("未设置表：[" + tableName + "]对应的实体类名称");
        }
        po.setClassName(entityName + gen.poPostfix);
        po.setEntityName(entityName);
    }

    /**
     * 添加@Mine等注解
     *
     * @param table
     * @param po
     */
    private void addAnnotation(Table table, PO po) {
        List<Field> fieldList = dbCollection.findFieldByTable(po.getTableName());
        String tableComment = table.getComment();
        if (tableComment != null) {
            if (tableComment.contains(GenConstants.comment_AFile_prefix)) {//[![AFile]!]
                commonTableAnnotation(po,table,GenConstants.annotation_AFile,GenConstants.comment_AFile_prefix);
            }
            if (tableComment.contains(GenConstants.comment_ARole_prefix)) {//[![ARole]!]
                commonTableAnnotation(po,table,GenConstants.annotation_ARole,GenConstants.comment_ARole_prefix);
            }
            if (tableComment.contains(GenConstants.comment_AUser_prefix)) {//[![AUser]!]
                commonTableAnnotation(po,table,GenConstants.annotation_AUser,GenConstants.comment_AUser_prefix);
            }
            if (tableComment.contains(GenConstants.comment_AOrg_prefix)) {//[![AOrg]!]
                commonTableAnnotation(po,table,GenConstants.annotation_AOrg,GenConstants.comment_AOrg_prefix);
            }
            if (tableComment.contains(GenConstants.comment_APermission_prefix)) {//[![APermission]!]
                commonTableAnnotation(po,table,GenConstants.annotation_APermission,GenConstants.comment_APermission_prefix);
            }
            if (tableComment.contains(GenConstants.comment_ALessee_prefix)) {//[![ALessee]!]
                commonTableAnnotation(po,table,GenConstants.annotation_ALessee,GenConstants.comment_ALessee_prefix);
            }
            if (tableComment.contains(GenConstants.comment_ADict_prefix)) {//[![ADict]!]
                commonTableAnnotation(po,table,GenConstants.annotation_ADict,GenConstants.comment_ADict_prefix);
            }
            if (tableComment.contains(GenConstants.comment_ADictModule_prefix)) {//[![ADict]!]
                commonTableAnnotation(po,table,GenConstants.annotation_ADictModule,GenConstants.comment_ADictModule_prefix);
            }
            if (tableComment.contains(GenConstants.comment_IndexMessage_prefix)) {//[![IndexMessage]!]
                commonTableAnnotation(po,table,GenConstants.annotation_IndexMessage,GenConstants.comment_IndexMessage_prefix);
            }


        }
        for (Field field : fieldList) {
            String comment = field.getComment();
            if (comment.contains(GenConstants.comment_Mine_prefix)) {// [![Mine]!]
                commonFieldAnnotation(po, field, GenConstants.annotation_Mine, GenConstants.comment_Mine_prefix);
            }
            if (comment.contains(GenConstants.comment_Hidden_prefix)) {// [![Hidden]!]
                commonFieldAnnotation(po, field, GenConstants.annotation_Hidden, GenConstants.comment_Hidden_prefix);
            }
            if (comment.contains(GenConstants.comment_Pwd_prefix)) {// [![Pwd]!]
                commonFieldAnnotation(po, field, GenConstants.annotation_Pwd, GenConstants.comment_Pwd_prefix);
            }
            if (comment.contains(GenConstants.comment_Rong_prefix)) {// [![Rong]!]
                commonFieldAnnotation(po, field, GenConstants.annotation_Rong, GenConstants.comment_Rong_prefix);
            }
            if (comment.contains(GenConstants.comment_ZFastDFS_prefix)) {// [![ZFastDFS]!]
                commonFieldAnnotation(po, field, GenConstants.annotation_ZFastDFS, GenConstants.comment_ZFastDFS_prefix);
            }
            if (comment.contains(GenConstants.comment_DefaultEqual_prefix)) {// [![DefaultEqual]!]
                commonFieldAnnotation(po, field, GenConstants.annotation_DefaultEqual, GenConstants.comment_DefaultEqual_prefix);
            }
            if (comment.contains(GenConstants.comment_LesseeId_prefix)) {// [![LesseeId()]!]
                commonFieldAnnotation(po, field, GenConstants.annotation_LesseeId, GenConstants.comment_LesseeId_prefix);
            }
            if (comment.contains(GenConstants.comment_UserId_prefix)) {// [![UserId()]!]
                commonFieldAnnotation(po, field, GenConstants.annotation_UserId, GenConstants.comment_UserId_prefix);
            }
            if (comment.contains(GenConstants.comment_DictModuleCode_prefix)) {// [![DictModuleCode()]!]
                commonFieldAnnotation(po, field, GenConstants.annotation_DictModuleCode, GenConstants.comment_DictModuleCode_prefix);
            }
            if (comment.contains(GenConstants.comment_SystemCode_prefix)) {// [![SystemCode()]!]
                commonFieldAnnotation(po, field, GenConstants.annotation_SystemCode, GenConstants.comment_SystemCode_prefix);
            }
        }
    }

    private void commonFieldAnnotation(PO po, Field field, String annotation_name, String annotation_name_prefix) {
        String comment = field.getComment();
        String propertyName = propertyName(field.getName());
        POProperty pp = new POProperty();
        pp.setAnnotationName(annotation_name);
        pp.setPo(po);
        pp.setProperty(propertyName);
        pp.setPropertyType(po.getPropertyTypeByPropertyName(propertyName));
        String val = ZhsStringUtil.getVal(comment, annotation_name_prefix, GenConstants.annotationPostFix);
        pp.setValue(val);
        javaCollection.addAnnotationPO(annotation_name, pp);
        //去掉注释中的注解
        comment = ZhsStringUtil.removeFirst(comment, annotation_name_prefix, GenConstants.annotationPostFix);
        field.setComment(comment);
    }

    private void commonTableAnnotation(PO po, Table table, String annotation_name, String annotation_name_prefix) {
        String comment = table.getComment();
        POProperty pp = new POProperty();
        pp.setAnnotationName(annotation_name);
        pp.setPo(po);
        String val = ZhsStringUtil.getVal(comment, annotation_name_prefix, GenConstants.annotationPostFix);
        pp.setValue(val);
        javaCollection.addAnnotationPO(annotation_name, pp);
        javaCollection.AAnnotationMap.put(annotation_name,po);
        //去掉注释中的注解
        comment = ZhsStringUtil.removeFirst(comment, annotation_name_prefix, GenConstants.annotationPostFix);
        table.setComment(comment);
    }

    /**
     * 添加类package
     *
     * @param po
     */
    private void addPackageInfo(PO po) {
        String pa = gen.poPackage.replaceAll("/", ".");
        po.setPackageStr(pa);
    }

    /**
     * 添加类注释
     *
     * @param po
     */
    private void addClassRemarkInfo(PO po) {
        Table table = dbCollection.findTableByName(po.getTableName());
        String remark = table.getComment();
        po.setClassRemark(remark);
    }

    /**
     * 添加类属性
     *
     * @param po
     */
    private void addPropertyInfo(PO po) {
        List<Field> fieldList = dbCollection.findFieldByTable(po.getTableName());
        for (Field field : fieldList) {
            String fieldName = field.getName();
            String fieldType = field.getType();
            String propertyName = propertyName(fieldName);
            po.addObjectPropertyJavaTypeMap(propertyName, Jdbc2JavaTypeMap.getJavaTypeByJdbcType(fieldType));
            po.addJavaPropDbColumn(propertyName, fieldName);
            // 添加key列表
            if (field.isKey()) {
                po.addKey(propertyName, Jdbc2JavaTypeMap.getJavaTypeByJdbcType(fieldType));
            }
        }
    }

    public String propertyName(String fieldName) {
        String[] chars = fieldName.split("_");
        String prop = "";
        for (int i = 0; i < chars.length; i++) {
            String c = chars[i];
            String cc = "";
            if (i == 0) {
                cc = c.substring(0, 1).toLowerCase() + c.substring(1);
            } else {
                cc = c.substring(0, 1).toUpperCase() + c.substring(1);
            }
            prop += cc;
        }
        return prop;
    }

    private void addProperRemarkInfo(PO po) {
        List<Field> fieldList = dbCollection.findFieldByTable(po.getTableName());
        for (Field field : fieldList) {
            String fieldName = field.getName();
            String remark = field.getComment();
            String property = propertyName(fieldName);
            po.addPropertyRemark(property, remark);
        }
    }

    private void addImportsInfo(PO po) {
        Map<String, String> objectPropertyJavaTypes = po.getObjectPropertyJavaTypeMap();
        objectPropertyJavaTypes.forEach((jdbc, javaObj) -> {
            String packageStr = JavaPropPackage.packageStr(javaObj);
            po.addImport(packageStr);
        });
    }
}
