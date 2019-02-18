package ${gen.ioPackage?replace("/",".")};

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import org.springframework.data.redis.serializer.RedisSerializer;
import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.ObjectInputStream;
import java.io.ObjectOutputStream;
import java.io.IOException;

public enum JDKSerializer implements Serializer, RedisSerializer {
    INSTANCE;
    private Logger log = LoggerFactory.getLogger(this.getClass());

    private JDKSerializer() {
    }

    @Override
    public byte[] serialize(Object obj) {
        byte[] bytes = null;
        ByteArrayOutputStream bos = new ByteArrayOutputStream();
        ObjectOutputStream os = null;
        try {
            os = new ObjectOutputStream(bos);
            os.writeObject(obj);
            os.flush();
            bytes = bos.toByteArray();
        } catch (Exception e) {
            log.error("对象转换成字节时异常", e);
        } finally {
            try {
                if (os != null)
                    os.close();
            } catch (IOException e) {
                log.error("关闭ObjectOutputStream时异常", e);
            }
            try {
                if (bos != null)
                    bos.close();
            } catch (IOException e) {
                log.error("关闭ByteArrayOutputStream时异常", e);
            }
            return bytes;
        }
    }

    @Override
    public Object deserialize(byte[] bytes) {
        if (bytes == null) {
            throw new RuntimeException("参数值为null");
        }
        Object obj = null;
        ByteArrayInputStream is = null;
        ObjectInputStream os = null;
        try {
            is = new ByteArrayInputStream(bytes);
            os = new ObjectInputStream(is);
            obj = os.readObject();
        } catch (Exception e) {
            log.error("将字节转换成Java对象时异常", e);
        } finally {
            try {
                if (os != null)
                    os.close();
            } catch (IOException e) {
                log.error("关闭ObjectInputStream时异常", e);
            }
            try {
                if (is != null)
                    is.close();
            } catch (IOException e) {
                log.error("关闭ByteArrayInputStream时异常", e);
            }
            return obj;
        }
    }

}
