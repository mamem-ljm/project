package poly.controller;

import java.util.ArrayList;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import poly.dto.PagingDTO;
import poly.dto.PerDTO;
import poly.service.ISheetService;
import poly.util.CmmUtil;

@Controller
public class SheetController {
	
	@Resource(name = "SheetService")
	private ISheetService sheetService;
	
	private Logger log = Logger.getLogger(this.getClass());
	
	@RequestMapping(value="getsheetpage")
	public String getsheetpage(HttpServletRequest req, Model model) throws Exception{
		
		String id = req.getParameter("id");
		
		log.info(id);
		
		String u_seq = sheetService.getpnumber(id);
		
		ArrayList<PerDTO> allsheet = new ArrayList<PerDTO>();
		
		int totalCount = sheetService.getsheetcount(u_seq);
		int pageNum = 1;
		int pageCount = 5;
		
		pageCount = Integer.parseInt(CmmUtil.nvl(req.getParameter("pageCount"),"5"));
		pageNum = Integer.parseInt(CmmUtil.nvl(req.getParameter("pageNum"),"1"));
		
		PagingDTO paging = new PagingDTO();
		
		paging.setTotalCount(totalCount);
		paging.setPageCount(pageCount);
		paging.setPageNum(pageNum);
		paging.setU_seq(u_seq);
		
		allsheet = sheetService.getsheet(paging);
		
		model.addAttribute("allsheet",allsheet);
		
		model.addAttribute("paging",paging);
		
		allsheet = null;
		
		log.info("get allsheet end!!");
		
		/*페이지 만들어야함*/
		return "/getsheetpage";
	}
	
	@RequestMapping(value="sheetinfo")
	public String sheetinfo(HttpServletRequest req, Model model) throws Exception{
		
		String s_seq = CmmUtil.nvl(req.getParameter("s_seq"));
		
		PerDTO pdto = new PerDTO();
		
		pdto = sheetService.getsheetinfo(s_seq);
		
		model.addAttribute("pdto",pdto);
		
		return "/sheet/sheetinfo";
	}
}
