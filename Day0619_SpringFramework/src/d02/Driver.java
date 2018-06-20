package d02;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.GenericXmlApplicationContext;

public class Driver {
	public static void main(String[] args) {
		//스프링 컨테이너를 통해서 객체를 만들고 가져와보자!
		//1. 스프링 컨테이너를 만들기 위해서는 스프링 컨테이너 설정파일이 필요하다!
		// 스프링 컨테이너 설정파일 : 스프링 컨테이너 생성시 ,만들어낼 bean에 대한 설정을 포함하는 파일.
		
		//스프링 컨테이너 객체 만들기
		ApplicationContext context = new GenericXmlApplicationContext("d02/applicationContext.xml");
		
		Car myCar= (Car) context.getBean("myCar");
		myCar.drive();
		
		
		
		
	}
	
}
