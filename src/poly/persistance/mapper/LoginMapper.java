package poly.persistance.mapper;

import config.Mapper;
import poly.dto.UDTO;

@Mapper("LoginMapper")
public interface LoginMapper {

	int Signupinsert(UDTO udto) throws Exception;

	String selectid(String id) throws Exception;;

}
