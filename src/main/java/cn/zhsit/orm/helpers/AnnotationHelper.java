package cn.zhsit.orm.helpers;

import cn.zhsit.configs.Gen;
import cn.zhsit.constants.GenConstants;
import cn.zhsit.models.*;
import cn.zhsit.models.dbinfo.Field;
import cn.zhsit.models.dbinfo.Table;
import cn.zhsit.typemap.JavaPropPackage;
import cn.zhsit.typemap.Jdbc2JavaTypeMap;
import cn.zhsit.utils.JsonUtil;
import cn.zhsit.utils.ZhsStringUtil;
import com.google.gson.reflect.TypeToken;
import org.springframework.beans.BeanUtils;
import org.springframework.stereotype.Component;

import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Component
public class AnnotationHelper extends BaseHelper {
    boolean print = false;

    //    List<PO> allPO = javaCollection.findAllPO();
    public void translate(String annotationName, List<POProperty> propertyList) {
        switch (annotationName) {
            case GenConstants.annotation_Rong:
                rong(propertyList);
                break;
            case GenConstants.annotation_IndexMessage:
                indexMessage(propertyList);
                break;
            case GenConstants.annotation_DefaultEqual:
                defaultEqual(propertyList);
                break;
        }
    }

    private void indexMessage(List<POProperty> propertyList) {

    }

    private void defaultEqual(List<POProperty> propertyList) {
        if (propertyList == null) return;
        for (POProperty poProperty : propertyList) {
            String vals = poProperty.getValue();
            if (vals == null || vals.trim() == "") {
                continue;
            }
//            {target:source}  target为目标字段，source为源字段，将源字段赋值给目标字段，例中将id的值赋值给code
            List<HashMap> targetColSourceColList = JsonUtil.toObject(vals, new TypeToken<List<HashMap>>() {
            }.getType());
            for (HashMap targetColSourceCol : targetColSourceColList) {
//                System.out.println(poProperty.getPo().getClassName()+ ":    " + targetColSourceCol);  //User:    {code=id}
                targetColSourceCol.forEach((targetCol,sourceCol)->{
                    String sourceProperty = poProperty.getPo().getPropertyByTableField((String) sourceCol);
                    String targetProperty = poProperty.getPo().getPropertyByTableField((String) targetCol);
                    EntityProperty ep = (EntityProperty)new EntityProperty().setTargetProperty(targetProperty).setSourceProperty(sourceProperty);
                    poProperty.addEntityProperty(ep);
                });
            }
        }
    }

    private void rong(List<POProperty> propertyList) {
        if (propertyList == null) return;
        try {
            for (POProperty poProperty : propertyList) {
//                PO pos = poProperty.getPo();
                String vals = poProperty.getValue();
                if (vals == null || vals.trim() == "") {
                    continue;
                }
                List<AnnotationValue> annotationValueList = JsonUtil.toObject(vals, new TypeToken<List<AnnotationValue>>() {
                }.getType());
                for (AnnotationValue annotationValue : annotationValueList) {
//                * 姓名[![Rong([{"same":"t_user.name=t_order.user_name","key":"t_user.id=t_order.user_id"}])]!]

                    ////////////////////////////////////解析same////////////////////////////////////////////////////////////////
                    // t_user.name=t_order.user_name
                    String same = annotationValue.getSame();
                    if (print) {
                        System.out.println("same:" + same);
                    }
                    //[t_user.name] [t_order.user_name]
                    String[] sameArray = same.split(GenConstants.annotationEqualSeparator);
                    //t_user.name
                    String sourceSameTableColumn = sameArray[0].trim();
                    if (print) {
                        System.out.println("sourceSameTableColumn:" + sourceSameTableColumn);
                    }
                    // t_user
                    String sourceSameTableName = sourceSameTableColumn.split("\\" + GenConstants.annotationTableFieldSeparator)[0].trim();
                    if (print) {
                        System.out.println("sourceSameTableName:" + sourceSameTableName);
                    }
                    // name
                    String sourceSameColumnName = sourceSameTableColumn.split("\\" + GenConstants.annotationTableFieldSeparator)[1].trim();
                    if (print) {
                        System.out.println("sourceSameColumnName:" + sourceSameColumnName);
                    }
                    ///////////////*********************///////////////
                    //t_order.user_name
                    String targetSameTableColumn = sameArray[1].trim();
                    if (print) {
                        System.out.println("targetSameTableColumn:" + targetSameTableColumn);
                    }
                    // t_order
                    String targetSameTableName = targetSameTableColumn.split("\\" + GenConstants.annotationTableFieldSeparator)[0].trim();
                    if (print) {
                        System.out.println("targetSameTableName:" + targetSameTableName);
                    }
                    // user_name
                    String targetSameColumnName = targetSameTableColumn.split("\\" + GenConstants.annotationTableFieldSeparator)[1].trim();
                    if (print) {
                        System.out.println("targetSameColumnName:" + targetSameColumnName);
                    }

                    ////////////////////////////////////解析key//////////////////////////////////////////
                    // t_user.id=t_order.user_id
                    String key = annotationValue.getKey();
                    if (print) {
                        System.out.println("key:" + key);
                    }
                    //[t_user.id] [t_order.user_id]
                    String[] keyArray = key.split(GenConstants.annotationEqualSeparator);
                    //t_user.id
                    String sourceKeyTableColumn = keyArray[0].trim();
                    if (print) {
                        System.out.println("sourceKeyTableColumn:" + sourceKeyTableColumn);
                    }
                    // t_user
                    String sourceKeyTableName = sourceKeyTableColumn.split("\\" + GenConstants.annotationTableFieldSeparator)[0].trim();
                    if (print) {
                        System.out.println("sourceKeyTableName:" + sourceKeyTableName);
                    }
                    // id
                    String sourceKeyColumnName = sourceKeyTableColumn.split("\\" + GenConstants.annotationTableFieldSeparator)[1].trim();
                    if (print) {
                        System.out.println("sourceKeyColumnName:" + sourceKeyColumnName);
                    }
                    ///////////////*********************///////////////
                    //t_order.user_id
                    String targetKeyTableColumn = keyArray[1].trim();
                    if (print) {
                        System.out.println("targetKeyTableColumn:" + targetKeyTableColumn);
                    }
                    // t_order
                    String targetKeyTableName = targetKeyTableColumn.split("\\" + GenConstants.annotationTableFieldSeparator)[0].trim();
                    if (print) {
                        System.out.println("targetKeyTableName:" + targetKeyTableName);
                    }
                    // user_id
                    String targetKeyColumnName = targetKeyTableColumn.split("\\" + GenConstants.annotationTableFieldSeparator)[1].trim();
                    if (print) {
                        System.out.println("targetKeyColumnName:" + targetKeyColumnName);
                    }


                    PO sourceSamePO = this.javaCollection.findPOByTableName(sourceSameTableName);
                    PO targetSamePO = this.javaCollection.findPOByTableName(targetSameTableName);
                    PO sourceKeyPO = this.javaCollection.findPOByTableName(sourceKeyTableName);
                    PO targetKeyPO = this.javaCollection.findPOByTableName(targetKeyTableName);

                    if (null == sourceSamePO || null == targetSamePO || null == sourceKeyPO || null == targetKeyPO) {
                        continue;
                    }
                    EntityProperty ep = new EntityProperty();
                    ep.setSourceSameEntity(sourceSamePO.getEntityName());
                    ep.setTargetSameEntity(targetSamePO.getEntityName());
                    ep.setSourceSameProperty(sourceSamePO.getPropertyByTableField(sourceSameColumnName));
                    ep.setTargetSameProperty(targetSamePO.getPropertyByTableField(targetSameColumnName));

                    ep.setSourceKeyEntity(sourceKeyPO.getEntityName());
                    ep.setTargetKeyEntity(targetKeyPO.getEntityName());
                    ep.setSourceKeyProperty(sourceKeyPO.getPropertyByTableField(sourceKeyColumnName));
                    ep.setTargetKeyProperty(targetKeyPO.getPropertyByTableField(targetKeyColumnName));

                    poProperty.addEntityProperty(ep);
                }
            }
        } catch (Exception ex) {
            throw new RuntimeException("解析注解" + GenConstants.annotation_Rong + "时异常", ex);
        }
    }

}
