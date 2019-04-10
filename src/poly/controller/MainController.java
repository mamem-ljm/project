package poly.controller;

import java.util.ArrayList;
import java.util.Timer;
import java.util.TimerTask;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
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


	Timer t = new Timer();
	Timer t2 = new Timer();
	
	
	
	@Resource(name = "MainService")
	private IMainService mainService;
	
	IsChainValid checkchain = new IsChainValid();

	
	//홈페이지
	@RequestMapping(value = "home")
	public String home() throws Exception {

		log.info("welcome homepage");
		
		//블록 체크 10초 마다 실행
		TimerTask m_task = new TimerTask() {
			
			@Override
			public void run() {
				/*log.info("welcome timer");*/
				
				blockchain = mainService.getallsheet();

				checkchain.setBlockchain(blockchain);
				
				checkchain.run();
				
				blockchain = null;

			}
		};
		
		/*t2.schedule(m_task, 0, 10000);*/

		return "/home";
	}
	
	@RequestMapping(value="Userlist")
	public String Userlist(HttpServletRequest req)throws Exception{
		
		log.info("Welcome Userlist");
		
		ArrayList<PerDTO> allsheet = new ArrayList<PerDTO>();
		
		req.setAttribute("allsheet",allsheet);
		
		int totalCount = mainService.getSheetTotalCount();
		int pageNum = 1;
		int pageCount = 10;
		
		pageCount = Integer.parseInt(CmmUtil.nvl(req.getParameter("pageCount"),"10"));
		pageNum = Integer.parseInt(CmmUtil.nvl(req.getParameter("pageNum"),"1"));
		
		PagingDTO paging = new PagingDTO();
		
		paging.setTotalCount(totalCount);
		paging.setPageNum(pageNum);
		paging.setPageCount(pageCount);
		
		allsheet = mainService.getallsheet(paging);
		
		return "/main/Userlist";
	}

	//진단서 작성
	@RequestMapping(value = "WritePage")
	public String write() throws Exception {

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
	@RequestMapping(value="SendUser")
	public String SendUser(HttpServletRequest req) throws Exception{
		log.info("welcome senduser");
		
		String name = req.getParameter("name");
		String addr = req.getParameter("addr");
		String hp = req.getParameter("hp");
		String pnumber = req.getParameter("pnumber");
		String gender = req.getParameter("gender");
		
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
	@RequestMapping(value = "SendData", method = RequestMethod.POST)
	public String SendData(HttpServletRequest req) throws Exception {

		log.info("welcome senddata");

		String name = req.getParameter("name");
		String pres = req.getParameter("Pres");
		String content = req.getParameter("content");
		String date = req.getParameter("date");
		String license = req.getParameter("license");
		String dname = req.getParameter("dname");
		

		PerDTO pdto = new PerDTO();

		pdto.setName(name);
		pdto.setPres(pres);
		pdto.setContent(content);
		pdto.setDate(date);
		pdto.setLicense(license);
		pdto.setDname(dname);
		
		
		mainService.SendData(pdto);

		return "redirect:/home.do";
	}
	
}
