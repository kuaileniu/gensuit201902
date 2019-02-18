<#--package ${gen.ioPackage?replace("/",".")};-->

<#--import org.slf4j.Logger;-->
<#--import org.slf4j.LoggerFactory;-->
<#--import org.springframework.data.redis.serializer.RedisSerializer;-->
<#--import com.esotericsoftware.reflectasm.MethodAccess;-->

<#--import java.io.*;-->

<#--public enum ProtoBufSerializer implements Serializer, RedisSerializer {-->
    <#--INSTANCE;-->
    <#--private Logger log = LoggerFactory.getLogger(this.getClass());-->

    <#--private ProtoBufSerializer() {-->
    <#--}-->

    <#--@Override-->
    <#--public byte[] serialize(Object t) {-->
        <#--MethodAccess access = MethodAccess.get(t.getClass());-->
        <#--return (byte[]) access.invoke(t, "toByteArray");-->
    <#--}-->

    <#--@Override-->
    <#--public Object deserialize(byte[] bytes) {-->
        <#--return null;-->
    <#--}-->

    <#--public <T> T deserialize(Class<T> t,byte[] bytes) {-->
        <#--MethodAccess access = MethodAccess.get(t);-->
        <#--return (T)access.invoke(t, "parseFrom",bytes);-->
    <#--}-->
<#--}-->
