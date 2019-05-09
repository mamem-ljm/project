package poly.util;

import java.util.Random;

public class Block {
	private String hash;
	
	public String getHash() {
		return hash;
	}

	public void setHash(String hash) {
		this.hash = hash;
	}

	String previousHash;
	Random random = new Random();
	private long rlong;
	private String content;
	
	// create block
	public Block(String content, String previoushash) {
		this.content = content;
		this.previousHash = previoushash;
		this.rlong = random.nextInt(25);
		this.hash = calculateHash();
		setHash(hash);
	}
	
	public Block(String content) {
		this.content = content;
	}
	
	public String calculateHash() {
		String caculatedhash = StringUtil.applySha256(
				previousHash +
				rlong+
				content			
				);
		return caculatedhash;
	}
	
	public String calculateHash(String previousHash, int rlong, String content) {
		String caculatedhash = StringUtil.applySha256(
				previousHash +
				rlong+
				content		
				);
		return caculatedhash;
	}
	
	
	
	public Boolean mineBlock(String previous, String content, String current) {
		
		/*System.out.println("previous : " + previous);
		System.out.println("content : " + content);
		System.out.println("current : " + current);*/
		String hash = "";
		int i =0;
		while(i<26) {
			i++;
			hash = calculateHash(previous, i, content);
			if(hash.equals(current)) {
				/*System.out.println("calc hash : " + hash);
				System.out.println("current hash : " + current);*/
				
				/*System.out.println("end check");*/
				return true;
			}
		}
		return false;
	}
}