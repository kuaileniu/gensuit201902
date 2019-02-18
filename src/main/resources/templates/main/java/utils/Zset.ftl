package ${gen.utilPackage?replace("/",".")};

import java.util.HashSet;

public class Zset<E> extends HashSet<E> {

    public Zset() {
        super();
    }

    @Override
    public boolean add(E e) {
        if (e != null) {
            return super.add(e);
        }
        return false;
    }
}
