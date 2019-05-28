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
import poly.util.CmmUtil;

@Controller
public class SNSLoginController {

	private Logger log = Logger.getLogger(this.getClass());

	@Resource(name = "LoginService")
	private ILoginService loginService;

	@RequestMapping(value = "kakao/login")
	public String kakao_login(HttpSession session, HttpServletRequest req) throws Exception {
		
		log.info("welcome kakao login");
		
		String id = req.getParameter("UserID");
		String name = req.getParameter("name");

		UDTO udto = new UDTO();

		String match = "[^\uAC00-\uD7A3xfe0-9a-zA-Z\\s]";
		name = name.replaceAll(match, "");

		log.info(name);

		udto.setId(id);
		udto.setName(name);

		String findid = "";
		
		log.info("findid : " + findid);
		
		findid = CmmUtil.nvl(loginService.selectid(id));

		String url = "";
		if (findid == "") {
			session.setAttribute("id", id);
			session.setAttribute("name", name);
			url =  "/login/userinfoinsert";
			
		} else if (findid != "") {
			session.setAttribute("id", id);
			session.setAttribute("name", name);
			url = "redirect:/home.do";
		}
		
		log.info(url);
		
		return url;

	}
	
	@RequestMapping(value="kakao/userinfo", method=RequestMethod.POST)
	public String userinfo(HttpSession session, HttpServletRequest req) throws Exception{
		log.info("welcome userinfo");
		
		String name = req.getParameter("name");
		String id = req.getParameter("id");
		String addr = req.getParameter("addr");
		String hp = req.getParameter("hp");
		String pnumber = req.getParameter("pnumber");
		String gender = req.getParameter("gender");
		
		UDTO udto = new UDTO();
		
		udto.setAddr(addr);
		udto.setGender(gender);
		udto.setHp(hp);
		udto.setId(id);
		udto.setName(name);
		udto.setPnumber(pnumber);
		
		loginService.Signupinsert(udto);
		
		session.setAttribute("id", id);
		session.setAttribute("name", name);
		
		return "redirect:/home.do";
	}
	
	@RequestMapping(value="logout")
	public String logout(HttpSession session) throws Exception{
		session.invalidate();
		return "redirect:/home.do";
	}
}
