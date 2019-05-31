package poly.persistance.mapper;

import java.util.ArrayList;

import config.Mapper;
import poly.dto.PagingDTO;
import poly.dto.PerDTO;
import poly.dto.UDTO;

@Mapper("MainMapper")
public interface MainMapper {

	void SendData(PerDTO pdto) throws Exception;

	PerDTO getData();

	void SendUser(UDTO udto);

	public int getSheetTotalCount() throws Exception;

	ArrayList<PerDTO> getallsheet(PagingDTO paging);

	ArrayList<PerDTO> getallsheetlist();

	int getusercount() throws Exception;

	ArrayList<PerDTO> getalluser(PagingDTO paging) throws Exception;

	void UpdateUser(UDTO udto) throws Exception;

}
