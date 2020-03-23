package com.hanul.fruit;

import java.text.DecimalFormat;

public class FruitDAOAnswer {

	private FruitDTO[]	fruit;
	public FruitDAOAnswer(FruitDTO[] fruit) {
		this.fruit = fruit;
	}
	
	// ���� ���
	public void getPrice() {
		for (int i = 0; i < fruit.length; i++) {
			fruit[i].setPrice(fruit[i].getCost() * fruit[i].getQuantity());
		}
	} // getPrice()
	
	// ������ �������� ����
	public void priceDescSort() {
		for (int i = 0; i < fruit.length; i++) {
			for (int j = 0; j < fruit.length; j++) {
				if(fruit[i].getPrice() > fruit[j].getPrice()) {
					FruitDTO temp = fruit[i];
					fruit[i] = fruit[j];
					fruit[j] = temp;
				} // if
			} // for j
		} // for i
	} // priceDescSort()

	// ���
	public void display() {
		System.out.println("���ϸ�\t�ܰ�\t����\t����");
		System.out.println("==============================");
		DecimalFormat df = new DecimalFormat("��#,##0");	// �� ����
		for (int i = 0; i < fruit.length; i++) {
			System.out.print(fruit[i].getName() + "\t");
			System.out.print(df.format(fruit[i].getCost()) + "\t");
			System.out.print(fruit[i].getQuantity() + "\t");
			System.out.print(df.format(fruit[i].getPrice()) + "\n");
		} // for
	} // display()
} // class