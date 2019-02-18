package ${gen.ioPackage?replace("/",".")};

import java.util.Arrays;
import java.util.HashSet;

import org.springframework.data.redis.serializer.RedisSerializer;
import com.esotericsoftware.kryo.Kryo;
import com.esotericsoftware.kryo.io.Input;
import com.esotericsoftware.kryo.io.Output;

/**
 * SerializeUtil with Kryo
 */
public enum KryoSerializer implements Serializer, RedisSerializer {
    INSTANCE;

    private Kryo kryo;
    private Output output;
    private Input input;
    /**
     * Classes which can not resolved by default kryo serializer,
     * which occurs very rare(https://github.com/EsotericSoftware/kryo#using-standard-java-serialization)
     * For these classes, we will use fallbackSerializer(use JDKSerializer now) to resolve.
     */
    private HashSet<Class<?>> unnormalClassSet;

    /**
     * Hash codes of unnormal bytes which can not resolved by default kryo serializer,
     * which will be resolved by  fallbackSerializer
     */
    private HashSet<Integer> unnormalBytesHashCodeSet;
    private Serializer fallbackSerializer;

    private KryoSerializer() {
        kryo = new Kryo();
        output = new Output(200, -1);
        input = new Input();
        unnormalClassSet = new HashSet<Class<?>>();
        unnormalBytesHashCodeSet = new HashSet<Integer>();
        fallbackSerializer = JDKSerializer.INSTANCE;//use JDKSerializer as fallback
    }

    @Override
    public byte[] serialize(Object object) {
        output.clear();
        if (!unnormalClassSet.contains(object.getClass())) {
            /**
             * In the following cases:
             * 1. This class occurs for the first time.
             * 2. This class have occurred and can be resolved by default kryo serializer
             */
            try {
                kryo.writeClassAndObject(output, object);
                return output.toBytes();
            } catch (Exception e) {
                // For unnormal class occurred for the first time, exception will be thrown
                unnormalClassSet.add(object.getClass());
                return fallbackSerializer.serialize(object);//use fallback Serializer to resolve
            }
        } else {
            //For unnormal class
            return fallbackSerializer.serialize(object);
        }
    }

    @Override
    public Object deserialize(byte[] bytes) {
        if (bytes == null) {
            return null;
        }
        int hashCode = Arrays.hashCode(bytes);
        if (!unnormalBytesHashCodeSet.contains(hashCode)) {
            /**
             * In the following cases:
             * 1. This bytes occurs for the first time.
             * 2. This bytes have occurred and can be resolved by default kryo serializer
             */
            try {
                input.setBuffer(bytes);
                return kryo.readClassAndObject(input);
            } catch (Exception e) {
                // For unnormal bytes occurred for the first time, exception will be thrown
                unnormalBytesHashCodeSet.add(hashCode);
                return fallbackSerializer.deserialize(bytes);//use fallback Serializer to resolve
            }
        } else {
            //For unnormal bytes
            return fallbackSerializer.deserialize(bytes);
        }
    }

}
