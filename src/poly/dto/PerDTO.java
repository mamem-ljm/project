package poly.dto;

public class PerDTO {
	private String S_SEQ;
	private String S_U_SEQ;
	private String name;
	private String pnumber;
	private String content;
	private String date;
	private String license;
	private String dname;
	private String hash;
	
	public String getS_SEQ() {
		return S_SEQ;
	}
	public void setS_SEQ(String s_SEQ) {
		S_SEQ = s_SEQ;
	}
	public String getS_U_SEQ() {
		return S_U_SEQ;
	}
	public void setS_U_SEQ(String s_U_SEQ) {
		S_U_SEQ = s_U_SEQ;
	}
	public String getHash() {
		return hash;
	}
	public void setHash(String hash) {
		this.hash = hash;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getPnumber() {
		return pnumber;
	}
	public void setPnumber(String pnumber) {
		this.pnumber = pnumber;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getDate() {
		return date;
	}
	public void setDate(String date) {
		this.date = date;
	}
	public String getLicense() {
		return license;
	}
	public void setLicense(String license) {
		this.license = license;
	}
	public String getDname() {
		return dname;
	}
	public void setDname(String dname) {
		this.dname = dname;
	}
}
