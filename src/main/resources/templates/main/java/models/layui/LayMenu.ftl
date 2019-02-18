package ${gen.modelLayuiPackage?replace("/",".")};

import java.util.*;

/**
 需要注意的是以下几点：
 当任意级菜单有子菜单，点击该菜单都只是收缩和展开操作，而并不会跳转，只有没有子菜单的菜单才被允许跳转。
 菜单的路由地址默认是按照菜单层级的 name 来设定的。
 我们假设一级菜单的 name 是：a，二级菜单的是：b，三级菜单的 name 是 c，那么：
 三级菜单最终的路由地址就是：/a/b/c
 如果二级菜单没有三级菜单，那么二级菜单就是最终路由，地址就是：/a/b/
 如果一级菜单没有二级菜单，那么一级菜单就是最终路由，地址就是：/a/
 但如果你设置了 参数 jump，那么就会优先读取 jump 设定的路由地址，如："jump": "/user/set"
 */
public class LayMenu {

    //级菜单名称（与视图的文件夹名称和路由路径对应）
    //msgboard
    private String name;
    //菜单标题
    //留言板
    private String title;
    //菜单标题
    //layui-icon-template
    private String icon;
    // 菜单路由地址，默认按照 name 解析。一旦设置，将优先按照 jump 设定的路由跳转
    //template/addresslist
    private String jump;
    //是否默认展子菜单
    private Boolean spread = true;
    //子菜单
    private List<LayMenu> list = null;

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getIcon() {
        return icon;
    }

    public void setIcon(String icon) {
        this.icon = icon;
    }

    public String getJump() {
        return jump;
    }

    public void setJump(String jump) {
        this.jump = jump;
    }

    public Boolean isSpread() {
        return spread;
    }

    public void setSpread(Boolean spread) {
        this.spread = spread;
    }
    
    public List<LayMenu> getList() {
        return list;
    }

    public LayMenu setList(List<LayMenu> list) {
        this.list = list;
        return this;
    }

    public LayMenu addSubMenu(LayMenu layMenu) {
        if (this.list == null) {
            this.list = new ArrayList<>();
        }
        this.list.add(layMenu);
        return this;
    }
}
