package poly.service;

import poly.dto.UDTO;

public interface ILoginService {

	int Signupinsert(UDTO udto) throws Exception;

	String selectid(String id) throws Exception;

}
