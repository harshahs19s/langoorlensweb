package App;
import java.io.IOException;

import  org.codehaus.jackson.map.ObjectMapper;
public class JsonUtil {
private static ObjectMapper mapper;
static
{
	mapper=new ObjectMapper();
}

public static String convertJavaToJson(Object object)
{
	String jsonResult="";
	try {
		jsonResult = mapper.writeValueAsString(object);
	
	} catch (IOException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
	
	return jsonResult;
}

public static <T>T convertJsonToJava(String jsonString, Class<T> cls)
{
	T result=null;
	try {
		result= mapper.readValue(jsonString, cls);
	} catch (IOException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
	return result;
}
}
