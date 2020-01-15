package App;

public class Test {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
Registeres reg=new Registeres();
reg.dob="20-5-2018";
reg.Title="hello";
reg.title="number";
String res= JsonUtil.convertJavaToJson(reg);
System.out.println(res);
System.out.println("___________________________");
Registeres res11= JsonUtil.convertJsonToJava(res, Registeres.class);
System.out.println(res11.title);
System.out.println(res11.Title);
	}

}
