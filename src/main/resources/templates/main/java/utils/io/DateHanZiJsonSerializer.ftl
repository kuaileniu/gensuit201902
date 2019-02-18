package ${gen.ioPackage?replace("/",".")};

import ${gen.utilPackage?replace("/",".")}.StringUtil;
import com.fasterxml.jackson.core.JsonGenerator;
import com.fasterxml.jackson.databind.JsonSerializer;
import com.fasterxml.jackson.databind.SerializerProvider;

import java.io.IOException;
import java.util.Date;

public class DateHanZiJsonSerializer extends JsonSerializer<Date> {

    @Override
    public void serialize(Date date, JsonGenerator gen, SerializerProvider serializers) throws IOException {
        gen.writeString(StringUtil.fromDate(date, "yyyy年MM月dd日"));
    }
}