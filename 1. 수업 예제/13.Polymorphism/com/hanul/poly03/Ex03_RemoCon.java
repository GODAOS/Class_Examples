package com.hanul.poly03;

public interface Ex03_RemoCon {
	public abstract void volUp();	// �߻� �޼ҵ� : abstract Ű����, �޼ҵ�(), �ٵ� ��� X
	public abstract void volDown();
	public void internet();	// abstract Ű���尡 �����Ǿ interface ������ ����� �޼ҵ�� ��� �߻� �޼ҵ��.
}

/*
�� Interface(�������̽�)
	- JAVA�� ���� ��Ӹ� ��� �� ���� ����� ������ Ȱ���� �ʿ伺 �� Interface ����
	- ��� �޼ҵ�� �߻� �޼ҵ�θ� �����ȴ�.
	- ��� ���� ���� Ŭ������ �ݵ�� ������(Override)�� �ʼ�
	- Interface�� ����� implements Ű���� ���
	
	public class A { ~~body~~ } �� �Ϲ����� Ŭ����
	public class A extends B { ~~body~~ } �� A�� B�� ��ӹ޴´� (A �� B)
	public class A extends B implements C { ~~body~~ } �� A(����)�� B(����)�� ��ӹް�, C(�������̽�)�� ����� �����Ͽ���.  
	public class A extends B implements C, D, E { ~~body~~ } �� A(����)�� B(����)�� ��ӹް�, C�� D�� E�� ����� �����Ͽ���.  
	



*/