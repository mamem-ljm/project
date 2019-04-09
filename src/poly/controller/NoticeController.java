package poly.controller;

import java.util.logging.Logger;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import poly.service.INoticeService;
import poly.service.impl.NoticeService;



/*
 * Controller �꽑�뼵�빐�빞留� Spring �봽�젅�엫�썙�겕�뿉�꽌 Controller�씤吏� �씤�떇 媛��뒫
 * �옄諛� �꽌釉붾┸ �뿭�븷 �닔�뻾
 * */
@Controller
public class NoticeController {
	
	private Logger log = Logger.getLogger(" ");
	

	@Resource(name = "NoticeService")
	private INoticeService noticeService;
	
	
	@RequestMapping(value="main")
	public String main(HttpServletRequest request, HttpServletResponse response, Model model, HttpSession session) throws Exception{
		
		/*noticeService.insertvalue("hellodb");*/
		
		return "/index";
	}
	

	/*@RequestMapping(value="notice/NoticeList", method=RequestMethod.GET)
	public String NoticeList(HttpServletRequest request, HttpServletResponse response,
			ModelMap model) throws Exception {
		
		//濡쒓렇 李띻린(異뷀썑 李띿� 濡쒓렇瑜� �넻�빐 �씠 �븿�닔�뿉 �젒洹쇳뻽�뒗吏� �뙆�븙�븯湲� �슜�씠�븯�떎.)
		log.info(this.getClass().getName() + ".NoticeList start!");
		
		//怨듭��궗�빆 由ъ뒪�듃 媛��졇�삤湲�
		List<NoticeDTO> rList = noticeService.getNoticeList();
		
		if (rList==null){
			rList = new ArrayList<NoticeDTO>();
			
		}
		
		//議고쉶�맂 由ъ뒪�듃 寃곌낵媛� �꽔�뼱二쇨린
		model.addAttribute("rList", rList);
		
		//蹂��닔 珥덇린�솕(硫붾え由� �슚�쑉�솕 �떆�궎湲� �쐞�빐 �궗�슜�븿)
		rList = null;
		
		//濡쒓렇 李띻린(異뷀썑 李띿� 濡쒓렇瑜� �넻�빐 �씠 �븿�닔 �샇異쒖씠 �걹�궗�뒗吏� �뙆�븙�븯湲� �슜�씠�븯�떎.)
		log.info(this.getClass().getName() + ".NoticeList end!");
		
		//�븿�닔 泥섎━媛� �걹�굹怨� 蹂댁뿬以� JSP �뙆�씪紐�(/WEB-INF/view/notice/NoticeList.jsp) 
		return "/notice/NoticeList";
	}*/
}
