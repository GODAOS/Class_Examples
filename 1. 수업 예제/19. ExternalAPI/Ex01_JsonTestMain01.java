import java.io.BufferedWriter;
import java.io.FileWriter;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

public class Ex01_JsonTestMain01 {
	public static void main(String[] args) {
		Ex01_JsonDTO dto1 = new Ex01_JsonDTO(10, "ȫ�浿", 33, "���ֽ� ���� �󼺵�", "010-1111-1111");
		Ex01_JsonDTO dto2 = new Ex01_JsonDTO(20, "�ڹ���", 30, "���ֽ� ���� ������", "010-2222-2222");
		Ex01_JsonDTO dto3 = new Ex01_JsonDTO(30, "�̼���", 50, "���ֽ� �ϱ� �����", "010-3333-3333");
		// 10, ȫ�浿, ��� - json value
		// dto1 : json object
		// [dto1, dto2, dto3] : json array 
		
		JSONArray array = new JSONArray();		// JSON Array ��ü ����
		JSONObject object = new JSONObject();	// JSON Object ��ü ����
		
		object.put("member", dto1);	// DTO ��ü�� JSON Object ��ü�� ��ȯ
		array.add(object);	// JSON Obejct�� JSON Array�� ���
		
		object.put("member", dto2);
		array.add(object);

		object.put("member", dto3);
		array.add(object);
		
		String json = array.toString();	// JSON ������ ������ ȭ�鿡 ���
		System.out.println(json);
		
		//����� ȭ�鿡 ���
		for (int i = 0; i < array.size(); i++) {		// array�� ���ѹ迭�̱� ������ length�� �ƴ� size ���
			JSONObject obj = array.getJSONObject(i);	// {"member" :  {addr : 10 ~~~
			obj = obj.getJSONObject("member");			// {addr : 10 ~~~
			Ex01_JsonDTO dto = (Ex01_JsonDTO) JSONObject.toBean(obj, Ex01_JsonDTO.class);	// ����� JSON Object�� �ڹ� ��ü�� �������
			System.out.print(dto.getNum() + "\t");
			System.out.print(dto.getName() + "\t");
			System.out.print(dto.getAge() + "\t");
			System.out.print(dto.getAddr() + "\t");
			System.out.print(dto.getTel() + "\n");
		}
		
		//����� ���Ϸ� ����
		try {
			FileWriter fw = new FileWriter("member.json");	// �ѱ��� ���Ƿ� FileWriter ���
			BufferedWriter bw = new BufferedWriter(fw);		// �ѱ��� ���Ƿ� BufferedWriter ���
			bw.write(json);
			bw.flush();
			bw.close();
			fw.close();
			System.out.println("member.json ������ �����Ǿ����ϴ�.");
			// json ������ ��� Ctrl + Shift + f�� ������ �ڵ����� �鿩���� ���ش�.
		} catch (Exception e) {
			e.printStackTrace();
		} // try catch
	} // main()
} // class