package poly.service.impl;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import poly.dto.UDTO;
import poly.persistance.mapper.LoginMapper;
import poly.service.ILoginService;

@Service("LoginService")
public class LoginService implements ILoginService {
	@Resource(name="LoginMapper")
	private LoginMapper loginMapper;
	
	@Override
	public int Signupinsert(UDTO udto) throws Exception {
		// TODO Auto-generated method stub
		return loginMapper.Signupinsert(udto);
	}

	@Override
	public String selectid(String id) throws Exception {
		// TODO Auto-generated method stub
		System.out.println("service id : "+id);
		return loginMapper.selectid(id);
	}
	
}
