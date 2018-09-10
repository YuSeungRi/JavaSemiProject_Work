package kit;

import java.util.ArrayList;

public class KitData {

	private String codeTitle;
	private String content;
	private String language;
	private ArrayList<String> pasredCode;

	@Override
	public String toString() {
		return "KitData [codeTitle=" + codeTitle + ", content=" + content + ", language=" + language + ", pasredCode="
				+ pasredCode + "]";
	}
	
	public String getCodeTitle() {
		return codeTitle;
	}
	public void setCodeTitle(String codeTitle) {
		this.codeTitle = codeTitle;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getLanguage() {
		return language;
	}
	public void setLanguage(String language) {
		this.language = language;
	}
	public ArrayList<String> getPasredCode() {
		return pasredCode;
	}
	public void setPasredCode(ArrayList<String> pasredCode) {
		this.pasredCode = pasredCode;
	}

}
