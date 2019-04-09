package poly.service;

import java.util.ArrayList;

import poly.dto.PerDTO;
import poly.dto.UDTO;
import poly.util.Block;

public interface IMainService {

	void SendData(PerDTO pdto) throws Exception;

	ArrayList<PerDTO> getallsheet();

	void SendUser(UDTO udto) throws Exception;

}
