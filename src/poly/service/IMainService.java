package poly.service;

import java.util.ArrayList;

import poly.dto.PagingDTO;
import poly.dto.PerDTO;
import poly.dto.UDTO;

public interface IMainService {

	void SendData(PerDTO pdto) throws Exception;

	ArrayList<PerDTO> getallsheet(PagingDTO paging);

	void SendUser(UDTO udto) throws Exception;

	int getSheetTotalCount() throws Exception;

	ArrayList<PerDTO> getallsheetlist();

	int getusercount() throws Exception;

	ArrayList<PerDTO> getalluser(PagingDTO paging) throws Exception;

	void UpdateUser(UDTO udto) throws Exception;

	void DeleteUser(String chk_seq) throws Exception;

}
