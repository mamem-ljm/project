package poly.service.impl;

import java.util.ArrayList;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import poly.dto.PagingDTO;
import poly.dto.PerDTO;
import poly.dto.UDTO;
import poly.persistance.mapper.MainMapper;
import poly.service.IMainService;
import poly.util.Block;

@Service("MainService")
public class MainService implements IMainService{

	@Resource(name="MainMapper")
	private MainMapper mainMapper;
	
	/*sheet insert*/
	@Override
	public void SendData(PerDTO pdto) throws Exception {
		
		PerDTO getpdto = new PerDTO();
		
		//이전 데이터를 가져옴
		getpdto = mainMapper.getData();
		
		System.out.println("get hash : " + getpdto.getHash());
		
		//가져온 데이터로 해시값 생성
		Block block = new Block(pdto.getContent(), getpdto.getHash());
		
		pdto.setHash(block.getHash());
		
		mainMapper.SendData(pdto);
		
	}

	@Override
	public void SendUser(UDTO udto) throws Exception {
		// TODO Auto-generated method stub
		
	}

	//시트 리스트 토탈 카운트 가져오기
	@Override
	public int getSheetTotalCount() throws Exception {
		// TODO Auto-generated method stub
		return mainMapper.getSheetTotalCount();
	}


	@Override
	public ArrayList<PerDTO> getallsheet(PagingDTO paging) {
		// TODO Auto-generated method stub
		
		return mainMapper.getallsheet(paging);
	}

	//블록 체크를 위한 메서드
	@Override
	public ArrayList<PerDTO> getallsheetlist() {
		// TODO Auto-generated method stub
		return mainMapper.getallsheetlist();
	}

	@Override
	public int getusercount() throws Exception {
		// TODO Auto-generated method stub
		return mainMapper.getusercount();
	}

	@Override
	public ArrayList<PerDTO> getalluser(PagingDTO paging) throws Exception {
		// TODO Auto-generated method stub
		return mainMapper.getalluser(paging);
	}
	
	
}
