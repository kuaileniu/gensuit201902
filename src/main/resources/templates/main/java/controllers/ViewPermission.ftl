package ${gen.controllerPackage?replace("/",".")};

import ${gen.poPackage?replace("/",".")}.*;
import java.util.HashSet;
import java.util.Set;

/**
 *  @Component
 *  public class GenViewPermission {
 *     static {
 *       ViewPermission.viewPermissions.add(new Permission().setCode("").setLink("").setText("").setDescr(""));
 *     }
 *   }
 */
public enum ViewPermission {
    Instance;

    public final static Set<Permission> viewPermissions = new HashSet<>();

}
