package robot;

import org.springframework.stereotype.Component;

@Component("run")
public class RunMove implements Moveable {
	public void move() {
		System.out.println("뛰어서 이동!!");
	}
}
