import java.awt.BorderLayout;
import java.awt.Font;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.util.Arrays;
import java.util.Random;

import javax.swing.JButton;
import javax.swing.JFrame;
import javax.swing.JPanel;
import javax.swing.JScrollPane;
import javax.swing.JTextArea;

public class Lotto {
	// ������Ʈ ����(����)
	JFrame frame;
	JPanel panel;
	JTextArea output;
	JButton startBtn;
	JButton clearBtn;
	
	// ������ �޼��� : �ڵ� ����
	public Lotto() {
		// ������Ʈ ��ü ����
		frame = new JFrame();
		panel = new JPanel();
		output = new JTextArea();
		startBtn = new JButton("��ȣ ����");
		clearBtn = new JButton("��ȣ �����");
		
		// startBtn�� clearBtn�� panel�� �����ش�
		panel.add(startBtn);
		panel.add(clearBtn);
		
		// ���â(output)�� �۲� ��Ÿ�� ����
		output.setFont(new Font("����", Font.BOLD, 15));
		
		// frame�� output�� panel�� ��ġ
		frame.getContentPane().add(new JScrollPane(output), BorderLayout.CENTER);
		frame.getContentPane().add(panel, BorderLayout.SOUTH);
		
		// frame �Ӽ� ����
		frame.setTitle("Lotto Game!!!");	// �۾�ǥ���ٿ� ���̴� �̸�
		frame.setSize(300, 200);			// ������ ������
		frame.setVisible(true);				// �������� ����
		frame.setLocationRelativeTo(null);	// �������� ȭ�� �߾ӿ�
		frame.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);	// �ݱ� ��ư���� ����
		
		// �̺�Ʈ ó���� ���� Listener�� ����
		startBtn.addActionListener(new StartBtnListener());
		clearBtn.addActionListener(new ClearBtnListener());
	} // Lotto()
	
	// ��ȣ ����
	class StartBtnListener implements ActionListener {
		@Override
		public void actionPerformed(ActionEvent e) {
			Random random = new Random();	// ���� ��ü ����
			int[] lotto = new int[6];		// ��ȣ�� ����� �迭 ����
			
			for (int i = 0; i < lotto.length; i++) {
				lotto[i] = random.nextInt(45) + 1;	// 1 ~ 45 ���� ���� ��ȣ�� �Ҵ�
				for (int j = 0; j < i; j++) {		// ��ȣ �ߺ� �˻�
					if (lotto[i] == lotto[j]) {
						i = i - 1; // i -= 1;
						break;
					} // if
				} // for j
			} // for i
			
			Arrays.sort(lotto);
			
			for (int i = 0; i < lotto.length; i++) {
				if(lotto[i] < 10) {
					output.append("0" + lotto[i] + "  ");
				} else {
					output.append(lotto[i] + "  ");
				} // if else
			} // for
			output.append("\n");
		} // actionPerformed()
	} // class
	
	
	// ��ȣ �����
	class ClearBtnListener implements ActionListener {
		@Override
		public void actionPerformed(ActionEvent e) {
			output.setText("");
		}
	}
	public static void main(String[] args) {
		new Lotto();
	} // main()
} // class
