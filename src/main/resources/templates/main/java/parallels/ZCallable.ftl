package ${gen.parallelPackage?replace("/",".")};


import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import java.util.concurrent.Callable;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Semaphore;

@Component
@Scope(value = "prototype")
public class ZCallable implements Callable {
    private Logger log = LoggerFactory.getLogger(this.getClass());
    private ForParal forParal;
    private Runnable r;
    private ExecutorService pool;

    public ZCallable setForParal(ForParal para) {
        this.forParal = para;
        return this;
    }

    public ZCallable setR(Runnable r) {
        this.r = r;
        return this;
    }

    public ZCallable setPool(ExecutorService pool) {
        this.pool = pool;
        return this;
    }

    @Override
    @Transactional
    public Object call() throws Exception {
        try {
            forParal.semaphore.acquire();
            r.run();
            forParal.semaphore.release();
        } catch (Exception e) {
            forParal.rollback=true;
            if (forParal.shutdownNowPool) {
                if (forParal.pool != null) {
                    forParal.pool.shutdownNow();
                }
            }
            forParal.exception=e;
            throw e;
        }
        return null;
    }

    public static class ForParal {
        public boolean shutdownNowPool = false;
        public ExecutorService pool;
        public Semaphore semaphore;
        public boolean rollback = false;
        public Exception exception;
    }
}
