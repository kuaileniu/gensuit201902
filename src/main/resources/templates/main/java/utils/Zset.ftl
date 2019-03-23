package ${gen.utilPackage?replace("/",".")};

import java.util.HashSet;

public class Zset<E> extends HashSet<E> {

    public Zset() {
        super();
    }

	
    @Override
    public boolean add(E e) {
        if (e != null) {
            if (e instanceof String) {
                if (((String) e).length() < 1) {
                    return false;
                }
            }
            return super.add(e);
        }
        return false;
    }
	
   
    public boolean add_del(E e) {
        if (e != null) {
            return super.add(e);
        }
        return false;
    }
}
