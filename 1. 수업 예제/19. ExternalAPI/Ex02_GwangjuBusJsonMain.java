import java.io.BufferedReader;
import java.io.FileReader;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
import net.sf.json.JSONSerializer;

public class Ex02_GwangjuBusJsonMain {
	public static void main(String[] args) {
		String jsonData = getJsonData();
//		System.out.println(jsonData);
		try {
			JSONArray array = JSONArray.fromObject(jsonData);
			// ���� JSONObject�� jsonData�� �ٷ� JSONArray�� �����
			for (Object object : array) {	// Ÿ���� �𸦶��� Object�� ����Ѵ�.
				JSONObject obj = (JSONObject) JSONSerializer.toJSON(object);
				// Ÿ���� ��Ȯ�� �� �� ���� object�� foreach���� ����ϱ� ���� JSONSerializer�� ����ؼ� JSON�������� �ٲ��ش�.
				System.out.print("�뼱 �̸� : " + obj.get("LINE_NAME") + "\t");
				System.out.print("����� : " + obj.get("DIR_UP_NAME") + "\t");
				System.out.print("������ : " + obj.get("DIR_DOWN_NAME") + "\n\n");
			}
		} catch (Exception e) {
			e.printStackTrace();
		} // try catch
	} // main()
	
	// gjbus.json ������ ������ �о, JSON ���� ���·� ����� �ش�.
	public static String getJsonData() {
		String json = null;
		String jsonData = "";
		try {
			FileReader fr = new FileReader("gjbus.json");
			BufferedReader br = new BufferedReader(fr);
			while (true) {
				json = br.readLine();
				if(json == null) {	// json�� �� ���� ���� ������ ����������
					break;
				} else {
					jsonData += json;	// ���� �����Ͱ� ������ jsonData�� ��ƶ�
				} // if else
			} // while
			br.close();
		} catch (Exception e) {
			e.printStackTrace();
		} // try catch
		return jsonData;
	} // getJsonData()
} // class