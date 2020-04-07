import java.net.URL;
import java.util.List;

import net.htmlparser.jericho.Element;
import net.htmlparser.jericho.HTMLElementName;
import net.htmlparser.jericho.Source;

public class Ex03_HtmlParser {
	public static void main(String[] args) {
		String address = "https://sum.su.or.kr:8888/bible/today";
		// https:// ��������, www.naver.com ������, ��ü�� url
		try {
			URL url = new URL(address);
			Source source = new Source(url);
//			System.out.println(source);
			List<Element> list = source.getAllElements(HTMLElementName.DIV);
			// getAllElements : �ش��ϴ� HTML ��Ҹ� ��� �������� list�� ��ȯ�Ѵ�.
			// HTMLElementName.DIV : div �±� ���� ������ ����

			// list�� ��� ������ �ϳ��� ���ڿ��� ����
			String html1 = null; // ����(subject)
			String html2 = null; // ��¥(data)
			String html3 = null; // ������(strapline)
			String html4 = null; // ����(content)
			
			for (int i = 0; i < list.size(); i++) {
				String data = list.get(i).getContent().toString();
//				System.out.println(data);
				
				// ���� ���� ������ ��������
				if(data.contains("id=\"bible_text\">")) {
					html1 = data;
				}
				
				// ��¥ ���� ������ ��������
				if(data.contains("id=\"dailybible_info\">")) {
					html2 = data;
				}
				
				// ������ ���� ������ ��������
				if(data.contains("id=\"bibleinfo_box\">")) {
					html3 = data;
				}
				
				// ���� ���� ������ ��������
				if(data.contains("id=\"body_list\">")) {
					html4 = data;
				}
			}
			// �°� �����Դ��� Ȯ��
//			System.out.println(html1);
//			System.out.println(html2);
//			System.out.println(html3);
//			System.out.println(html4);
			
			// ���� ��������
			// ���� �պκ� ����
			int startPos = html1.indexOf("id=\"bible_text\">");
			String subject = html1.substring(startPos + 16);
//			System.out.println(subject);
			// ���� �޺κ� ����
			int endPos = subject.indexOf("</div>");
			subject = subject.substring(0, endPos);
			System.out.println("���� : " + subject.trim());
			
			// ��¥ ��������
			// ��¥ �պκ� ����
			startPos = html2.indexOf("id=\"dailybible_info\">");
			String date = html2.substring(startPos + 21);
			// ��¥ �޺κ� ����
			endPos = date.indexOf("</div>");
			date = date.substring(0, endPos);
			System.out.println("��¥ : " + date.trim());
			
			// ������ ��������
			// ������ �պκ� ����
			startPos = html3.indexOf("id=\"bibleinfo_box\">");
			String strapline = html3.substring(startPos + 19);
			// ������ �޺κ� ����
			endPos = strapline.indexOf("</div>");
			strapline = strapline.substring(0, endPos);
//			// ������ ���� ����� '���� : ' ���� 
//			strapline = strapline.trim();
//			strapline = strapline.substring(5);
//			System.out.println("������ : " + strapline.trim());
			System.out.println(strapline.trim());
			
			// ���� ��������
			// ���� �պκ� ����
			startPos = html4.indexOf("id=\"body_list\">");
			String content = html4.substring(startPos + 15);
//			System.out.println(content);
			// ���� �޺κ� ����
			endPos = html4.indexOf("</ul>");
			content = content.substring(0, endPos);
//			System.out.println(content);
			
			// li �ɰ��� ���� �迭�� ���
			String[] sp = content.split("</li>");
//			System.out.println(Arrays.toString(sp));
			// ���ڸ� ���ϱ�
			for (int i = 0; i < sp.length - 1; i++) {
				// ���� �պκ� ����
				int numStartPos = sp[i].indexOf("class=\"num\">");
				String num = sp[i].substring(numStartPos + 12);
//				System.out.println(num);
				// ���� �޺κ� ����
				int numEndPos = num.indexOf("</div>");
				num = num.substring(0, numEndPos);
//				System.out.println(num);
				
				// ���� �պκ� ����
				int infoStartPos = sp[i].indexOf("class=\"info\">");
				String info = sp[i].substring(infoStartPos + 13);
//				System.out.println(info);
				// ���� �޺κ� ����
				int infoEndPos = info.indexOf("</div>");
				info = info.substring(0, infoEndPos);
				
				System.out.println(num + " : " + info.trim());
			}
		} catch (Exception e) {
			e.printStackTrace();
		} // try catch
	} // main()
} // class