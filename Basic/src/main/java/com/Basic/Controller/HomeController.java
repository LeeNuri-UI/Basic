package com.Basic.Controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import java.util.Locale;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


import com.Basic.Domain.UserVO;
import com.Basic.Domain.BoCommentVO;
import com.Basic.Domain.BoardVO;
import com.Basic.Domain.Criteria;
import com.Basic.Domain.PageMaker;
import com.Basic.Service.BoardService;
import com.Basic.Service.CommentsService;
import com.Basic.Service.UserService;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
public class HomeController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	@Inject
    private UserService uService;
	@Inject
    private BoardService bService;
	@Inject
    private CommentsService cService;
	
	
	//@RequestMapping(value="/unameChk", method = RequestMethod.POST) ->@PostMapping("/")로 바꿈 GET도 마찬가지
	
	@GetMapping("/")
	public String intro() {
		return "redirect:/Main";
	}	

	//각 화면 JSP이동
	//메인 화면
	@GetMapping("/Main")
	public String main(@ModelAttribute("cri") Criteria cri, Model model)throws Exception {
		logger.info(cri.toString());
	       
        model.addAttribute("BoardList", bService.listAll(cri));
        
        PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(bService.listCount());
		
		model.addAttribute("pageMaker", pageMaker);
		return "/Main";
	}
	
	//회원가입 화면
	@GetMapping("/Join")
	public String join(Locale locale, Model model) {
		
		return "/Join";
	}
	
	//로그인 화면
	@GetMapping("/Login")
	public String login(Locale locale, Model model) {
		
		return "/Login";
	}
	
	//글 작성하기 화면
	@GetMapping("/Write")
	public String write(Locale locale, Model model) {
		
		return "/Write";
	}
	
	
	//User 관리
	//회원가입
	@GetMapping("/JoinAction")
    public String joinAction(UserVO uv, HttpServletRequest request, HttpServletResponse response)throws IOException,Exception{
        System.out.println("/JoinAction POST방식 입니다. 왔나요?");
        
      //Inject된 UserService를 실행.
        uService.insert(uv);
		
        //회원가입되었음을 출력
        response.setContentType("text/html; charset=UTF-8");
		
        PrintWriter out = response.getWriter();
		out.println("<script>alert('회원가입이 완료되었습니다.');</script>");
		out.println("<script>document.location.href='"+request.getContextPath()+"/Login';</script>");
		out.close();
        
		return null;
    }

	//아이디 중복 체크
	@ResponseBody
	@PostMapping("/idChk")
	public int idChk(UserVO uv) throws Exception {
		
		int result = uService.idChk(uv);
		
		System.out.println("왔나요?"+result);
		return result;
	}
	
	//닉네임 중복 체크
	@ResponseBody
	@PostMapping("/unameChk")
	public int unameChk(UserVO uv) throws Exception {
		
		int result = uService.unameChk(uv);
		
		System.out.println("왔나요?"+result);
		return result;
	}
	
	//로그인
	@PostMapping("/LoginAction")
    public String loginAction(UserVO uv, HttpSession session, HttpServletResponse response)throws IOException,Exception{
		response.setContentType("text/html; charset=UTF-8");
        
		uService.login(uv);
        UserVO UserVO = uService.login(uv);
        
        if(UserVO==null) {
        	System.out.println("로그인실패");
    		PrintWriter out = response.getWriter();
    		out.println("<script>alert('아이디 또는 비밀번호를 확인하세요.');history.go(-1)</script>");
        }else {       	
        	
        	//HttpSession의 "UserVO" 속성에 User 정보저장
        	session.setAttribute("UserVO", UserVO);
 
            PrintWriter out = response.getWriter();
    		out.println("<script>document.location.href='/Board/Main';</script>");
    		out.close();          
        }
        return null;
    }
	
	//로그아웃
	@RequestMapping(value = "/LoginoutAction")
    public String LoginoutAction(UserVO uv, HttpSession session, HttpServletResponse response)throws IOException,Exception{
			response.setContentType("text/html; charset=UTF-8"); 
        	
			session.invalidate();
    		PrintWriter out = response.getWriter();
    		out.println("<script>alert('로그아웃 되었습니다.');</script>");
    		out.println("<script>document.location.href='/Board/Main';</script>");
    		out.close();                 
        return null;
    }
	
	
	//게시판 관리
	//글쓰기
	@PostMapping("/WriteAction")
		public String writeAction(BoardVO bv, HttpSession session, RedirectAttributes rttr) throws Exception{
		    System.out.println(bv);
		    
		    //session 부르고 값 BoardVO에 저장하기
			UserVO user = (UserVO)session.getAttribute("UserVO");
			int unum = user.getUnum();
			String uname = user.getUname();
			bv.setUnum(unum);
			bv.setUname(uname);
		
			bService.boardInsert(bv);
		
			rttr.addFlashAttribute("msg", "성공");
		
		return "redirect:/List";
	}
	
	//리스트화면
	@GetMapping("/List")
    public String listAll(@ModelAttribute("cri") Criteria cri, Model model) throws Exception{
        System.out.println("전체목록 페이지");
        logger.info(cri.toString());
       
        model.addAttribute("BoardList", bService.listAll(cri));
        
        PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(bService.listCount());
		
		model.addAttribute("pageMaker", pageMaker);
        
		return "/Main";
    }
	
	//글 상세보기
	@GetMapping("/View")
    public void detail(@RequestParam("bnum") int bnum,Model model) throws Exception{
		System.out.println(bnum);
			
		BoardVO BoardVO = bService.detail(bnum);
		
		String str1 = BoardVO.getContent();
		str1 = str1.replace("\r\n", "<br>");
		BoardVO.setContent(str1);
		
        model.addAttribute("BoardVO",BoardVO); 
        
        //댓글 조회
        List<BoCommentVO> BoCommentVO = null;
        BoCommentVO = cService.list(bnum);
        model.addAttribute("BoCommentVO", BoCommentVO);
        
        return;
    }
	
	//글 수정하기 화면
	@GetMapping("/BoardModi")
	public String boardModi(int bnum,Model model) throws Exception {
       
		BoardVO BoardVO = bService.detail(bnum);
		model.addAttribute("BoardVO",BoardVO);
        
		return "/BoardModi";
	}
	
	//글 수정하기 POST
	@PostMapping("/UpdateAction")
    public String updateAction(BoardVO bv,Model model) throws Exception{
		bService.update(bv);
		
        return "redirect:/List";
    }
	
	//글 삭제하기
	@GetMapping("/deleteBoard")
	public String getDelete(@RequestParam("bnum") int bnum) throws Exception{
		System.out.println("bnum?"+bnum);
		bService.delete(bnum);
		
		return "redirect:/List";
	}
	
	//이전글
	@GetMapping("/Before")
	public void before(@RequestParam("bnum") int bnum, HttpServletRequest request, HttpServletResponse response)throws IOException,Exception{
		response.setContentType("text/html; charset=UTF-8"); 
			
		Integer board = bService.before(bnum);		
		
		if(board == null) {
			PrintWriter out = response.getWriter();
			out.println("<script>alert('가장 처음 글입니다.');history.go(-1)</script>");
			out.close();
		}else if(board != null) {
			response.sendRedirect(request.getContextPath()+"/View?bnum="+board);
		}
	}
	
	//다음글
	@GetMapping("/After")
	public void after(@RequestParam("bnum") int bnum, HttpServletRequest request, HttpServletResponse response)throws IOException,Exception{
		response.setContentType("text/html; charset=UTF-8"); 
			
		Integer board = bService.after(bnum);		
		
		if(board == null) {
			PrintWriter out = response.getWriter();
			out.println("<script>alert('가장 마지막 글입니다.');history.go(-1)</script>");
			out.close();
		}else if(board != null) {
			response.sendRedirect(request.getContextPath()+"/View?bnum="+board);
		}
	}
	
	//댓글작성
	@PostMapping("/CommentsAction")
	public String commentsAction(BoCommentVO bcv, HttpSession session, RedirectAttributes rttr)throws Exception{
		System.out.println("여기왔나요?");
		
		cService.commentsIsert(bcv);
		
		return "redirect:/View?bnum="+bcv.getBnum();
	}
	
	//댓글 수정하기 화면
	@GetMapping("/View2")
    public void detailCMT(@RequestParam("bnum") int bnum,@RequestParam("conum") int conum,Model model, HttpServletRequest request) throws Exception{
		System.out.println(bnum);
		System.out.println(conum);
		
		BoardVO BoardVO = bService.detail(bnum);
		
		String str1 = BoardVO.getContent();
		str1 = str1.replace("\r\n", "<br>");
		BoardVO.setContent(str1);
		
        model.addAttribute("BoardVO",BoardVO); 
        
        //댓글 조회
        List<BoCommentVO> BoCommentVO = null;
        BoCommentVO = cService.list(bnum);
        model.addAttribute("BoCommentVO", BoCommentVO);
        
        //수정하기 위한 값 출력
        int value = Integer.parseInt(request.getParameter("conum"));
        System.out.println(value);
        model.addAttribute("value", value);
                
        return;
    }
	
	//댓글 수정하기
	@PostMapping("/CommentsModiAction")
	public String CommentsModiAction(BoCommentVO bcv,Model model) throws Exception{
	
		cService.updateComments(bcv);
		
		return "redirect:/View?bnum="+bcv.getBnum();
	}
	
	//댓글 삭제하기
	@GetMapping("/CommentsDelAction")
	public void commentsDelAction(@RequestParam("conum") int conum,Model model,HttpServletRequest request,HttpServletResponse response) throws Exception{
		response.setContentType("text/html; charset=UTF-8");
		
		//메소드
		cService.deleteComments(conum);
		
		//삭제됨을 알린 후 내가 보던 해당 리스트로 이동시킨다.
		PrintWriter out = response.getWriter();
		out.println("<script>alert('댓글이 삭제되었습니다.');history.go(-3)</script>");
		out.close();
	}
}

