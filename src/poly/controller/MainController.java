package poly.controller;

import java.util.ArrayList;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import poly.dto.PagingDTO;
import poly.dto.PerDTO;
import poly.dto.UDTO;
import poly.service.IMainService;
import poly.util.CmmUtil;
import poly.util.IsChainValid;

@Controller
public class MainController {

	public ArrayList<PerDTO> blockchain = new ArrayList<PerDTO>();

	private Logger log = Logger.getLogger(this.getClass());

	/*
	 * 비즈니스 로직(중요 로직을 수행하기 위해 사용되는 서비스를 메모리에 적재(싱글톤패턴 적용됨)
	 */
	
	@Resource(name = "MainService")
	private IMainService mainService;
	
	IsChainValid checkchain = new IsChainValid();

	
	//홈페이지
	@RequestMapping(value = "home")
	public String home() throws Exception {

		log.info("welcome homepage");
		
		blockchain = mainService.getallsheetlist();

		checkchain.setBlockchain(blockchain);
		
		blockchain = null;
		
		Thread.State state = checkchain.getState();
		
		//if thread not stating
		if(!(state == Thread.State.RUNNABLE)) {
			System.out.println("not run thread");
			checkchain.start();
		}
		
		return "/home";
	}
	
	

	//진단서 작성
	@RequestMapping(value = "WritePage")
	public String write(HttpServletRequest req) throws Exception {
		
		String u_seq = req.getParameter("chk_seq");
		
		req.setAttribute("chk_seq", u_seq);
		
		log.info("Welcome WritePage");

		return "/main/WritePage";

	}
	
	
	//환자등록 페이지
	@RequestMapping(value = "Uinsert")
	public String uinsert(HttpServletRequest req) throws Exception {

		log.info("Welcome Uinsert");

		return "/main/Uinsert";
	}
	
	//환자등록
	@RequestMapping(value="SendUser", method = RequestMethod.POST)
	public String SendUser(HttpServletRequest req) throws Exception{
		log.info("welcome senduser");
		
		String name = req.getParameter("name");
		String addr = req.getParameter("addr");
		String hp = req.getParameter("hp");
		String pnumber = req.getParameter("pnumber");
		String gender = req.getParameter("gender");
		
		log.info("name : " + CmmUtil.nvl(name));
		
		UDTO udto = new UDTO();
		
		udto.setName(name);
		udto.setPnumber(pnumber);
		udto.setAddr(addr);
		udto.setHp(hp);
		udto.setGender(gender);
		
		mainService.SendUser(udto);
		
		return "redirect:/home.do";
	}
	
	//진단서 등록
	@RequestMapping(value = "SendData", method = {RequestMethod.POST,RequestMethod.GET})
	public String SendData(HttpServletRequest req) throws Exception {

		log.info("welcome senddata");

		String name = req.getParameter("name");
		String pres = req.getParameter("Pres");
		String content = req.getParameter("content");
		String date = req.getParameter("date");
		String license = req.getParameter("license");
		String dname = req.getParameter("dname");
		String u_seq = req.getParameter("chk_seq");
		String pnumber = req.getParameter("pnumber");
		
		log.info(u_seq);
		PerDTO pdto = new PerDTO();
		
		pdto.setPnumber(pnumber);
		pdto.setName(name);
		pdto.setPres(pres);
		pdto.setContent(content);
		pdto.setDate(date);
		pdto.setLicense(license);
		pdto.setDname(dname);
		pdto.setS_U_SEQ(u_seq);
		
		mainService.SendData(pdto);

		return "redirect:/home.do";
	}
	
	/*유저들 가져오기*/
	@RequestMapping(value="Userlist")
	public String ulist(HttpServletRequest req, Model model) throws Exception{
		
		log.info("Welcome Userlist");
		
		ArrayList<PerDTO> alluser = new ArrayList<PerDTO>();
		
		int totalCount = mainService.getusercount();
		int pageNum = 1;
		int pageCount = 5;
		
		pageCount = Integer.parseInt(CmmUtil.nvl(req.getParameter("pageCount"),"5"));
		pageNum = Integer.parseInt(CmmUtil.nvl(req.getParameter("pageNum"),"1"));
		
		PagingDTO paging = new PagingDTO();
		
		paging.setTotalCount(totalCount);
		paging.setPageCount(pageCount);
		paging.setPageNum(pageNum);
		
		alluser = mainService.getalluser(paging);
		
		model.addAttribute("alluser",alluser);
		
		model.addAttribute("paging",paging);
		
		alluser = null;
		
		log.info("get allsheet end!!");
		
		return "/main/Userlist";
	}
	
	
	/*유저 업데이트 페이지 반환*/
	@RequestMapping(value="UpdateuserPage")
	public String updateuser(HttpServletRequest req) throws Exception{
		log.info("Welcome UpdateuserPage");
		
		String chk_seq = CmmUtil.nvl(req.getParameter("chk_seq"));
		
		req.setAttribute("chk_seq", chk_seq);
		
		return "/main/UpdateuserPage";
	}
	
	/*유저 업데이트*/
	@RequestMapping(value="UpdateUser", method = RequestMethod.POST)
	public String UpdateUser(HttpServletRequest req) throws Exception{
		log.info("Welcome UpdateUser");
		String chk_seq = CmmUtil.nvl(req.getParameter("chk_seq"));
		String addr = CmmUtil.nvl(req.getParameter("addr"));
		String name = CmmUtil.nvl(req.getParameter("name"));
		String hp = CmmUtil.nvl(req.getParameter("hp2"));
		String pnumber = CmmUtil.nvl(req.getParameter("pnumber"));
		
		log.info("hp : " + hp);
		log.info("addr : " + addr);
		log.info("name : " + name);
		log.info("pnumber : " + pnumber);
		
		UDTO udto = new UDTO();
		
		udto.setU_seq(chk_seq);
		udto.setAddr(addr);
		udto.setName(name);
		udto.setHp(hp);
		udto.setPnumber(pnumber);
		
		mainService.UpdateUser(udto);
		
		return "redirect:/home.do";
	}
	
	@RequestMapping(value="DeleteUser")
	public String DeleteUser(HttpServletRequest req)throws Exception{
		log.info("Welcome DeleteUser");
		
		String chk_seq = CmmUtil.nvl(req.getParameter("chk_seq"));
		
		mainService.DeleteUser(chk_seq);
		
		return "redirect:/home.do";
	}
	
}
