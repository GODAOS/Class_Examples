import com.hanul.finalanimal.Ex04_Final_Action;
import com.hanul.finalanimal.Ex04_Final_Cat;
import com.hanul.finalanimal.Ex04_Final_Dog;
import com.hanul.finalanimal.Ex04_Final_Duck;
import com.hanul.finalanimal.Ex04_Final_Tiger;

public class Ex04_Final_Animal_Main {
	public static void main(String[] args) {
		Ex04_Final_Dog dog = new Ex04_Final_Dog();
		Ex04_Final_Cat cat = new Ex04_Final_Cat();
		Ex04_Final_Tiger tiger = new Ex04_Final_Tiger();
		Ex04_Final_Duck duck = new Ex04_Final_Duck();
		
		dog.name = "������";
		cat.name = "�߿���";
		tiger.name = "ȣ����";
		duck.name = "����";
		
		Ex04_Final_Action action = new Ex04_Final_Action();
		action.action(dog);
		System.out.println("==============");
		action.action(cat);
		System.out.println("==============");
		action.action(tiger);
		System.out.println("==============");
		action.action(duck);
	} // main()
} // class