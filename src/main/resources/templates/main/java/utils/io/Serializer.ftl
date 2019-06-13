package ${gen.ioPackage?replace("/",".")};

public interface Serializer {

<#if (gen.showComment==true)>
    /**
     * Serialize method
     *
     * @param object
     * @return serialized bytes
     */
</#if>
    public byte[] serialize(Object object);

<#if (gen.showComment==true)>
    /**
     * UnSerialize method
     *
     * @param bytes
     * @return unSerialized object
     */
</#if>
    public Object deserialize(byte[] bytes);

}
