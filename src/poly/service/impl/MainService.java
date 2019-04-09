package poly.service.impl;

import java.util.ArrayList;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

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
	public ArrayList<PerDTO> getallsheet(){
		// TODO Auto-generated method stub
		
		return mainMapper.getallsheet();
	}

	@Override
	public void SendUser(UDTO udto) throws Exception {
		// TODO Auto-generated method stub
		
	}
	
	
}
