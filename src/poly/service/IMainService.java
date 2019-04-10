package poly.service;

import java.util.ArrayList;

import poly.dto.PagingDTO;
import poly.dto.PerDTO;
import poly.dto.UDTO;
import poly.util.Block;

public interface IMainService {

	void SendData(PerDTO pdto) throws Exception;

	ArrayList<PerDTO> getallsheet(PagingDTO paging);

	void SendUser(UDTO udto) throws Exception;

	int getSheetTotalCount() throws Exception;

}
