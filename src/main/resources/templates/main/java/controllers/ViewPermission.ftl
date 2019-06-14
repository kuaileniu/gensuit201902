package ${gen.controllerPackage?replace("/",".")};

import ${gen.poPackage?replace("/",".")}.*;
import java.util.HashSet;
import java.util.Set;

<#if (gen.showComment==true)>
/**
 *  @Component
 *  public class GenViewPermission {
 *     static {
 *       ViewPermission.viewPermissions.add(new Permission().setCode("").setLink("").setText("").setDescr(""));
 *     }
 *   }
 */
</#if>
public enum ViewPermission {
    Instance;

    public final static Set<Permission> viewPermissions = new HashSet<>();

}
