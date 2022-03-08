package kr.letech;

import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class Test {

	public static void main(String[] args) {

		String str = "115.136.113.53 - - [14/Feb/2022:20:53:35 +0900] \"GET /letech/EgovContent.do HTTP/1.1\" 302 -";
		
		String pattern = "\s(/.*?)\\s";			
		
		Pattern p = Pattern.compile(pattern);
		Matcher m = p.matcher(str);
		System.out.println(m);
		while(m.find()) {
			System.out.println(m.group(1));
			System.out.println(m.group(1).isEmpty());
		}
	}

}
