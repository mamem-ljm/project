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

	@Override
	public void run() {
		
		System.out.println("start");
		
		while (!isInterrupted()) {
			try {
				String previousBlock = "";

				int i = 1;

				int size = blockchain.size();

				for (; i < size; i++) {

					// 이전 해시값
					String hash = blockchain.get(i).getHash();

					PerDTO currentBlock = new PerDTO();

					currentBlock.setContent(blockchain.get(i).getContent());

					previousBlock = blockchain.get(i - 1).getHash();

					// 블럭 해시값 체크하기
					Block block = new Block(currentBlock.getContent());

					if (block.mineBlock(previousBlock, currentBlock.getContent(), hash)) {
						/*System.out.println("equals block!!");*/
					} else {
						System.out.println(i + " Hashes not equal");
						blockchain = null;
						break;
					}

				}
			}catch(Exception e) {
				e.printStackTrace();
			}
			

		}

	}

}
