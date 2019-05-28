package poly.persistance.mapper;

import java.util.ArrayList;

import config.Mapper;
import poly.dto.PagingDTO;
import poly.dto.PerDTO;

@Mapper("SheetMapper")
public interface SheetMapper {

	String getpnumber(String id) throws Exception;

	int getsheetcount(String pnumber) throws Exception;
	
	ArrayList<PerDTO> getsheet(PagingDTO paging) throws Exception;

	PerDTO getsheetinfo(String s_seq) throws Exception;

	

}
