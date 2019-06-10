package poly.util;

import java.util.ArrayList;

import poly.dto.PerDTO;

public class IsChainValid extends Thread {
	private ArrayList<PerDTO> blockchain = new ArrayList<PerDTO>();

	public ArrayList<PerDTO> getBlockchain() {
		return blockchain;
	}

	public void setBlockchain(ArrayList<PerDTO> blockchain) {
		this.blockchain = blockchain;
	}
	
	private boolean stop=false;
	
	void TestThread(boolean stop){
		this.stop = stop;
	}

	@Override
	public void run() {
		
		System.out.println("start");
		try {

			String previousBlock = "";
			int size = blockchain.size();
			
			while (!stop) {
				for (int i = 1; i < size; i++) {

					// 이전 해시값
					String hash = blockchain.get(i).getHash();

					PerDTO currentBlock = new PerDTO();

					currentBlock.setContent(blockchain.get(i).getContent());

					previousBlock = blockchain.get(i - 1).getHash();

					// 블럭 해시값 체크하기
					Block block = new Block(currentBlock.getContent());

					if (block.mineBlock(previousBlock, currentBlock.getContent(), hash)) {
						/*System.out.println(i + 1 + " Hashes equal");
						System.out.println("bool : " + bool);*/
					} else {
						System.out.println(i + 1 + " Hashes not equal");
						System.out.println("thread end");
						TestThread(true);
						break;
					}
				}
				
			}

		} catch (Exception e) {
			System.out.println("종료");
			e.printStackTrace();
		}
	}
}
