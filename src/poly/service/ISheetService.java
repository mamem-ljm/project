package poly.service;

import java.util.ArrayList;

import poly.dto.PagingDTO;
import poly.dto.PerDTO;

public interface ISheetService {

	String getpnumber(String id) throws Exception;
	
	int getsheetcount(String pnumber) throws Exception;
	
	ArrayList<PerDTO> getsheet(PagingDTO paging) throws Exception;

	PerDTO getsheetinfo(String s_seq) throws Exception;

	

}
