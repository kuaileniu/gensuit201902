package cn.zhsit.orm;

import cn.zhsit.models.*;
import org.springframework.stereotype.Component;

import java.util.*;

/**
 * Created by Administrator on 2018/3/19.
 */
@Component
public class JavaCollection {
    private final List<PO> poStore = Collections.synchronizedList(new LinkedList<>());
    private final List<Query> queryStore = Collections.synchronizedList(new LinkedList<>());
    private final List<Remove> removeStore = Collections.synchronizedList(new LinkedList<>());
    private final List<Modify> modifyStore = Collections.synchronizedList(new LinkedList<>());
    private static final List<Provider> providerStore = Collections.synchronizedList(new LinkedList<>());
    private static final List<Mapper> mapperStore = Collections.synchronizedList(new LinkedList<>());
    private static final List<Manager> managerStore = Collections.synchronizedList(new LinkedList<>());
    private static final List<ManagerImpl> managerImplStore = Collections.synchronizedList(new LinkedList<>());
    private static final List<Service> serviceStore = Collections.synchronizedList(new LinkedList<>());
    private static final List<ServiceImpl> serviceImplStore = Collections.synchronizedList(new LinkedList<>());
    private static final List<Controller> controllerStore = Collections.synchronizedList(new LinkedList<>());

    /**
     * <"@Mine" List<POProperty>>
     */
    private static final Map<String, List<POProperty>> annotationMapList = new HashMap();
    /**
     * <ALessess,ALessessPO>
     */
    public static final Map<String, PO> AAnnotationMap = new HashMap();

    public static PO getAAnnotationMapPO(String annotationName){
        return AAnnotationMap.get(annotationName);
    }

    public static synchronized Map<String, List<POProperty>> addAnnotationPO(String annotationName, POProperty poProperty) {
        List<POProperty> list = annotationMapList.get(annotationName);
        if (list == null) {
            list = new ArrayList<POProperty>();
            annotationMapList.put(annotationName, list);
        }
        boolean contain = false;
        for (POProperty property : list) {

        }
        if (!contain) {
            list.add(poProperty);
        }
        return annotationMapList;
    }

    public static Map<String, List<POProperty>> getAllAnnotationPO() {
        return annotationMapList;
    }

    public static List<POProperty> getAnnotationByName(String annotationName) {
        return annotationMapList.get(annotationName);
    }

    public List<PO> addPO(PO po) {
        poStore.add(po);
        return poStore;
    }

    public List<PO> findAllPO() {
        return poStore;
    }

    public PO findPOByTableName(String tableName){
        for (PO po : poStore) {
            if (po.getTableName().equals(tableName)) return po;
        }
        return null;
    }

    public List<Query> findAllQuery() {
        return queryStore;
    }

    public List<Remove> findAllRemove() {
        return removeStore;
    }

    public List<Modify> findAllModify() {
        return modifyStore;
    }

    public List<Query> addQuery(Query query) {
        queryStore.add(query);
        return queryStore;
    }

    public List<Remove> addRemove(Remove delete) {
        removeStore.add(delete);
        return removeStore;
    }

    public List<Modify> addModify(Modify modify) {
        modifyStore.add(modify);
        return modifyStore;
    }

    public void addProvider(Provider provider) {
        providerStore.add(provider);
    }

    public List<Provider> findAllProvider() {
        return providerStore;
    }

    public void addMapper(Mapper mapper) {
        mapperStore.add(mapper);
    }

    public void addManager(Manager o) {
        managerStore.add(o);
    }

    public void addService(Service o) {
        serviceStore.add(o);
    }

    public void addServiceImpl(ServiceImpl o) {
        serviceImplStore.add(o);
    }

    public void addController(Controller o) {
        controllerStore.add(o);
    }

    public void addManagerImpl(ManagerImpl o) {
        managerImplStore.add(o);
    }

    public List<Mapper> findAllMapper() {
        return mapperStore;
    }

    public List<Manager> findAllManager() {
        return managerStore;
    }

    public List<Service> findAllService() {
        return serviceStore;
    }

    public List<ServiceImpl> findAllServiceImpl() {
        return serviceImplStore;
    }

    public List<Controller> findAllController() {
        return controllerStore;
    }

    public List<ManagerImpl> findAllManagerImpl() {
        return managerImplStore;
    }
}

