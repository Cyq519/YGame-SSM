package com.YGame.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import com.YGame.pojo.User;

public class LoginInterceptor{

	public boolean preHandle(HttpServletRequest request, HttpServletResponse response) throws Exception {
			
		HttpSession session = request.getSession(false);
        User user= (User)session.getAttribute("user");

        //ȡ�����û���Ϣ
		//��ת����¼ҳ��
		//����false
		if (user == null) {
			return false;
		}else {
			return true;
		}
			
	}



}
