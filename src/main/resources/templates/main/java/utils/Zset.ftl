package ${gen.utilPackage?replace("/",".")};

import java.util.HashSet;

public class Zset<E> extends HashSet<E> {

    public Zset() {
        super();
    }

    public Zset(E e) {
        super();
        add(e);
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

}
