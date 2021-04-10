package com.Basic.Controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Locale;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.Basic.Domain.UserVO;
import com.Basic.Service.UserService;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
public class HomeController {
	
	@Inject
    private UserService UService;
	
	//각 화면 JSP이동
	//메인화면
	@RequestMapping(value = "/Main", method = RequestMethod.GET)
	public String Main(Locale locale, Model model) {
		
		return "/Main";
	}
	
	//회원가입화면
	@RequestMapping(value = "/Join", method = RequestMethod.GET)
	
	public String Join(Locale locale, Model model) {
		
		return "/Join";
	}
	
	//로그인화면
	@RequestMapping(value = "/Login", method = RequestMethod.GET)
	public String Login(Locale locale, Model model) {
		
		return "/Login";
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
    public String LoginAction(UserVO uv,  HttpServletRequest req, RedirectAttributes rttr) throws Exception{
        System.out.println("/LoginAction POST방식 입니다. 왔나요?");
        
        UService.Login(uv);
        return "/Main";
    }
	
}

