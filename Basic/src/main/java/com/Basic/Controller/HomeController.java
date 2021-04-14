package com.Basic.Controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Locale;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


import com.Basic.Domain.UserVO;
import com.Basic.Domain.BoardVO;
import com.Basic.Service.BoardService;
import com.Basic.Service.UserService;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;


@Controller
public class HomeController {
	
	@Inject
    private UserService UService;
	@Inject
    private BoardService BService;
    

	//각 화면 JSP이동
	//메인 화면
	@RequestMapping(value = "/Main", method = RequestMethod.GET)
	public String Main(Locale locale, Model model) {
		
		return "/Main";
	}
	
	//회원가입 화면
	@RequestMapping(value = "/Join", method = RequestMethod.GET)
	public String Join(Locale locale, Model model) {
		
		return "/Join";
	}
	
	//로그인 화면
	@RequestMapping(value = "/Login", method = RequestMethod.GET)
	public String Login(Locale locale, Model model) {
		
		return "/Login";
	}
	
	//글 작성하기 화면
	@RequestMapping(value = "/Write", method = RequestMethod.GET)
	public String write(Locale locale, Model model) {
		
		return "/Write";
	}
	
	//글 수정하기 화면
	@RequestMapping(value = "/BoardModi", method = RequestMethod.GET)
	public String BoardModi(int bnum,Model model) throws Exception {
       
		BoardVO BoardVO = BService.Detail(bnum);
		model.addAttribute("BoardVO",BoardVO);
        
		return "/BoardModi";
	}
	
	
	//User 관리
	//회원가입
	@RequestMapping(value = "/JoinAction",method=RequestMethod.POST )
    public String JoinAction(UserVO uv, HttpServletRequest request, HttpServletResponse response)throws IOException,Exception{
        System.out.println("/JoinAction POST방식 입니다. 왔나요?");
        
        //Inject된 UserService를 실행.
        UService.Insert(uv);
		
        //회원가입되었음을 출력
        response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
		out.println("<script>alert('회원가입이 완료되었습니다.');</script>");
		out.println("<script>document.location.href='"+request.getContextPath()+"/Login';</script>");
		out.close();
        
		return null;
    }
	
	//로그인
	@RequestMapping(value = "/LoginAction",method=RequestMethod.POST )
    public String LoginAction(UserVO uv, HttpSession session, HttpServletResponse response)throws IOException,Exception{
		response.setContentType("text/html; charset=UTF-8");
        
        UService.Login(uv);
        UserVO UserVO = UService.Login(uv);
        
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
	@RequestMapping(value = "/WriteAction",method=RequestMethod.POST )
		public String WriteAction(BoardVO bv, HttpSession session, RedirectAttributes rttr) throws Exception{
		    System.out.println(bv);
		    
		    //session 부르고 값 BoardVO에 저장하기
			UserVO user = (UserVO)session.getAttribute("UserVO");
			int unum = user.getUnum();
			String uname = user.getUname();
			bv.setUnum(unum);
			bv.setUname(uname);
		
			BService.BoardInsert(bv);
		
			rttr.addFlashAttribute("msg", "성공");
		
		return "redirect:/List";
	}
	
	//리스트화면
	@RequestMapping(value = "/List", method=RequestMethod.GET)
    public void ListAll(BoardVO bv,Model model) throws Exception{
        
        System.out.println("전체목록 페이지");
        
        model.addAttribute("BoardList", BService.ListAll());
    }
	
	//글 상세보기
	@RequestMapping(value = "/View", method=RequestMethod.GET)
    public void Detail(@RequestParam("bnum") int bnum,Model model) throws Exception{
		System.out.println(bnum);
		
		BoardVO BoardVO = BService.Detail(bnum);
				
        model.addAttribute("BoardVO",BoardVO); 
        
        return;
    }
	
	//글 수정하기 POST
	@RequestMapping(value = "/UpdateAction", method=RequestMethod.POST)
    public String UpdateAction(BoardVO bv,Model model) throws Exception{
		BService.Update(bv);
		
        return "redirect:/List";
    }
	
	//글 삭제하기
	@RequestMapping(value = "/delete", method=RequestMethod.GET)
	public String getDelete(@RequestParam("bnum") int bnum) throws Exception{
		
		BService.delete(bnum);
		
		return "redirect:/List";
	}
	
}

