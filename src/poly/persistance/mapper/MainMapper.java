package poly.persistance.mapper;

import java.util.ArrayList;

import config.Mapper;
import poly.dto.PerDTO;
import poly.dto.UDTO;
import poly.util.Block;

@Mapper("MainMapper")
public interface MainMapper {

	void SendData(PerDTO pdto) throws Exception;

	PerDTO getData();

	ArrayList<PerDTO> getallsheet();

	void SendUser(UDTO udto);

}
