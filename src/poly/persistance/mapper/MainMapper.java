package poly.persistance.mapper;

import java.util.ArrayList;

import config.Mapper;
import poly.dto.PagingDTO;
import poly.dto.PerDTO;
import poly.dto.UDTO;
import poly.util.Block;

@Mapper("MainMapper")
public interface MainMapper {

	void SendData(PerDTO pdto) throws Exception;

	PerDTO getData();

	void SendUser(UDTO udto);

	public int getSheetTotalCount() throws Exception;

	ArrayList<PerDTO> getallsheet(PagingDTO paging);

	ArrayList<PerDTO> getallsheetlist();

}
