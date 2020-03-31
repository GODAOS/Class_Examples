import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.FileReader;
import java.io.FileWriter;
import java.util.ArrayList;

import com.hanul.study.MemberDTO;

public class Ex13_MemberCopyMain {
	// member.txt ���Ͽ��� ���� ����(readLine())�� ������ �о
	// membercopy2.txt ������ ���� �� member.txt �� membercopy2.txt ���� ����
	// ���� ������ �� �׸��� TAB���� ���еǾ� �ִ� �� split("\t");
	// MemberDTO Ÿ���� ���� ArrayList<> ���� �� ArrayList<MemberDTO> list;
	public static void main(String[] args) {
		try {
			// ���� �Է��� ���� �غ� �ܰ� : FileReader, BufferedReader
			String inputPath = "D:\\Study_Java\\workspace\\17. IO\\member.txt";
			FileReader fr = new FileReader(inputPath);
			BufferedReader br = new BufferedReader(fr);
			
			// ������ ������ ������ �о�(readLine())�� ������ ������ �ʱ�ȭ
			// TAB���� split()�� ��, MemberDTO ��ü ����
			// ArrayList<MemberDTO> list ��ü ����
			// ������ �а� ArrayList<> ����(add())
			String line = null;
			MemberDTO dto = null;
			ArrayList<MemberDTO> list = new ArrayList<>();
			
			while((line = br.readLine()) != null) {
				String[] sp = line.split("\t");
				/*
				dto = new MemberDTO();
				dto.setNum(Integer.parseInt(sp[0]));
				dto.setName(sp[1]);
				dto.setAge(Integer.parseInt(sp[2]));
				dto.setAddr(sp[3]);
				dto.setTel(sp[4]);
				�� ����� ���Ѱ��� ��� �ϸ� �ȴ� */
				dto = new MemberDTO(Integer.parseInt(sp[0]), sp[1],
									Integer.parseInt(sp[2]), sp[3], sp[4]);
				
				list.add(dto);
			}

			// ArrayList<> ������ ȭ�鿡 ���
			for (MemberDTO dto2 : list) {
				System.out.print(dto2.getNum() + "\t");
				System.out.print(dto2.getName() + "\t");
				System.out.print(dto2.getAge() + "\t");
				System.out.print(dto2.getAddr() + "\t");
				System.out.print(dto2.getTel() + "\n");
			}
			
			// ���� ����� ���� �غ�ܰ� : FileWriter, BufferedWriter
			String outputPath = "D:\\Study_Java\\workspace\\17. IO\\membercopy2.txt";
			FileWriter fw = new FileWriter(outputPath);
			BufferedWriter bw = new BufferedWriter(fw);
			
			// ArrayList<>�� ����� ������ ���Ͽ� ���
			int index = 0;	// ���� ������ ������ ����
			for (MemberDTO dto2 : list) {
				if(index < list.size() -1) {	// ���� ������ �ε����� ��ü ������ �ε��� �� : �ٹٲ�
					String line2 = dto2.getNum() + "\t" + dto2.getName() + "\t";
					line2 = dto2.getAge() + "\t" + dto2.getAddr() + "\t" + dto2.getTel() + "\n";
					index++;
					bw.write(line2);
					bw.flush();
				} else {	// ������ ���� : �ٹٲ��� ���� �����
					String line2 = dto2.getNum() + "\t" + dto2.getName() + "\t";
					line2 = dto2.getAge() + "\t" + dto2.getAddr() + "\t" + dto2.getTel();
					bw.write(line2);
					bw.flush();
					System.out.println();
				}
			}
			// ��Ʈ�� ����
			bw.close();
			fw.close();
			br.close();
			fr.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	} // main()
} // class