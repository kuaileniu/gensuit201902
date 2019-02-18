package ${gen.ioPackage?replace("/",".")};

public interface Serializer {

    /**
     * Serialize method
     *
     * @param object
     * @return serialized bytes
     */
    public byte[] serialize(Object object);

    /**
     * UnSerialize method
     *
     * @param bytes
     * @return unSerialized object
     */
    public Object deserialize(byte[] bytes);

}
