package ${gen.helperPackage?replace("/",".")};

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import javax.annotation.PostConstruct;
import java.io.IOException;

@Component
public class JsonHelper {
    private static Logger log = LoggerFactory.getLogger(JsonHelper.class);

    private static JsonHelper helper;

    private static final String EMPTY = "{}";

    @Autowired
    private ObjectMapper objectMapper;

    @PostConstruct
    public void init() {
        helper = this;
    }

    public static String toJson(Object model) {
        try {
            return helper.objectMapper.writeValueAsString((model));
        } catch (JsonProcessingException e) {
            log.error("toJson error", e);
            return EMPTY;
        }
    }

    public static <T> T fromJson(String json, Class<T> clazz) {
        try {
            return helper.objectMapper.readValue(json, clazz);
        } catch (IOException e) {
            log.error("fromJson error", e);
            return null;
        }
    }

}
