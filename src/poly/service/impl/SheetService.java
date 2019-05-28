package poly.service.impl;

import java.util.ArrayList;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import poly.dto.PagingDTO;
import poly.dto.PerDTO;
import poly.persistance.mapper.SheetMapper;
import poly.service.ISheetService;

@Service("SheetService")
public class SheetService implements ISheetService {

	@Resource(name="SheetMapper")
	private SheetMapper sheetMapper;
	
	@Override
	public String getpnumber(String id) throws Exception {
		// TODO Auto-generated method stub
		return sheetMapper.getpnumber(id);
	}

	@Override
	public int getsheetcount(String pnumber) throws Exception {
		// TODO Auto-generated method stub
		return sheetMapper.getsheetcount(pnumber);
	}
	
	@Override
	public ArrayList<PerDTO> getsheet(PagingDTO paging) throws Exception {
		// TODO Auto-generated method stub
		return sheetMapper.getsheet(paging);
	}

	@Override
	public PerDTO getsheetinfo(String s_seq) throws Exception {
		// TODO Auto-generated method stub
		return sheetMapper.getsheetinfo(s_seq);
	}

	

}
