import java.io.BufferedWriter;
import java.io.FileWriter;
import java.util.ArrayList;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

public class Ex01_JsonTestMain02 {
	public static void main(String[] args) {
		Ex01_JsonDTO dto1 = new Ex01_JsonDTO(10, "ȫ�浿", 33, "���ֽ� ���� �󼺵�", "010-1111-1111");
		Ex01_JsonDTO dto2 = new Ex01_JsonDTO(20, "�ڹ���", 30, "���ֽ� ���� ������", "010-2222-2222");
		Ex01_JsonDTO dto3 = new Ex01_JsonDTO(30, "�̼���", 50, "���ֽ� �ϱ� �����", "010-3333-3333");
		
		ArrayList<Ex01_JsonDTO> list = new ArrayList<>();
		list.add(dto1);
		list.add(dto2);
		list.add(dto3);
		
		// ArrayList<Ex01_JsonDTO> �� JSON ������ ��ȯ(JSON Object �� JSON Array)
		JSONArray array = JSONArray.fromObject(list);
		String json = array.toString();
		System.out.println(json);
		
		// ����� ȭ�鿡 ���
		for (int i = 0; i < array.size(); i++) {
			JSONObject obj = array.getJSONObject(i);
			Ex01_JsonDTO dto = (Ex01_JsonDTO) JSONObject.toBean(obj, Ex01_JsonDTO.class);
			System.out.print(dto.getNum() + "\t");
			System.out.print(dto.getName() + "\t");
			System.out.print(dto.getAge() + "\t");
			System.out.print(dto.getAddr() + "\t");
			System.out.print(dto.getTel() + "\n");
		} 
		
		// ����� ���Ϸ� ����
		try {
			FileWriter fw = new FileWriter("memberList.json");
			BufferedWriter bw = new BufferedWriter(fw);
			bw.write(json);
			bw.flush();
			bw.close();
			fw.close();
			System.out.println("memberList.json ������ �����Ǿ����ϴ�.");
		} catch (Exception e) {
			e.printStackTrace();
		}
	} // main()
} // class