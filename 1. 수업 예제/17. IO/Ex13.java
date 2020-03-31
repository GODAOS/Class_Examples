import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.FileReader;
import java.io.FileWriter;

public class Ex13 {
	// member.txt ���Ͽ��� ���� ����(readLine())�� ������ �о
	// membercopy.txt ���Ͽ� ����(���)
	// ���� ���� : member.txt �� membercopy.txt
	public static void main(String[] args) {
		try {
			// ���� �Է��� ���� �غ� �ܰ� : FileReader, BufferedReader
			String inputPath = "D:\\Study_Java\\workspace\\17. IO\\member.txt";
			FileReader fr = new FileReader(inputPath);
			BufferedReader br = new BufferedReader(fr);
			
			// ���� ����� ���� �غ� �ܰ� : FileWriter, BufferedWriter
			String outputPath = "D:\\Study_Java\\workspace\\17. IO\\membercopy.txt";
			FileWriter fw = new FileWriter(outputPath);
			BufferedWriter bw = new BufferedWriter(fw);
			
			// ������ ������ ������ �о ������ ����(line)�� �ʱ�ȭ
			String line = null;
			
			// ������ ������ �а� ����ϴ� ����
			while((line = br.readLine()) != null) {	// readLine() �޼���� ���� �ձ����� �о ���͸� ���д´�.
				bw.write(line);
				bw.newLine();		// bw.write("\n"); �ٹٲ��ϴ� �޼���
			}
			if (line == null) {
				System.out.println("membercopy.txt ������ ����Ǿ����ϴ�.");
				
			}
			// ������ ������ ������ ���� ����(flush()) �� ����(close())
			bw.flush();
			bw.close();
			br.close();
			fw.close();
			fr.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	} // main()
} // class