package poly.controller;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import poly.dto.UDTO;
import poly.service.ILoginService;


@Controller
public class SNSLoginController {
	
	private Logger log = Logger.getLogger(this.getClass());

	@Resource(name = "LoginService")
	private ILoginService loginService;
	
	@RequestMapping(name="kakao/login", produces = "application/json", method= {RequestMethod.GET, RequestMethod.POST})
	public String kakao_login(HttpSession session, HttpServletRequest req)throws Exception{
		
		String id = req.getParameter("UserID");
		String name = req.getParameter("name");
		
		UDTO udto = new UDTO();
		
		udto.setId(id);
		udto.setName(name);
		
		
		
		
		return "redirect:/home.do";
	}

}
