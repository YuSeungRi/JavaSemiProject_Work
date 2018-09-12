package kit;

import java.io.File;

public class Kit_main {

	public static void main(String[] args) {
		
		File file = new File("‪C:/Users/Ji/Desktop","GsonTest_02.java");
		System.out.println(file.exists());
		Kit kit = new Kit(file);
		
//		System.out.println(test);
		
		System.out.println(kit.getKitData());

	}

}
