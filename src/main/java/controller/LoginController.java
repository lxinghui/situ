package controller;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import entity.Operator;
import entity.User;
import service.OperatorService;
import service.UserService;
import utils.SearchInfo;

@Controller
public class LoginController {
	@Resource(name="Operator_ServiceImpl")
	OperatorService oservice;
	@Resource(name="User_ServiceImpl")
	UserService uservice;
	
	
	@ResponseBody
	@RequestMapping("login")
	private int login(String type,String niki,String pass,String code,HttpSession session) {
		session.removeAttribute("user");
		session.removeAttribute("power");
		if(type.equals("teacher")) {
			if(session.getAttribute("randomCode").toString().equalsIgnoreCase(code)) {
				Operator o = new Operator();
				o.setNiki(niki);
				o.setPass(pass);
				Operator user=oservice.login(o);
					if(user!=null) {
						if(user.getStatus()==0) {
						session.setAttribute("user",user);
						session.setAttribute("id",user.getId());
						     if(user.getPower()==0) {
							     session.setAttribute("power",3);	
						     }else{
							session.setAttribute("power",4);	
						    }
						     return 0;
						}else {
							return -3;
						}
					}else {
						return -1;	
					}
				}else {
					return -2;
				}
		}else {
			if(session.getAttribute("randomCode").toString().equalsIgnoreCase(code)) {
				User u = new User();
				u.setNiki(niki);
				u.setPass(pass);
				User user=uservice.login(u);
				if(user!=null) {
					if(user.getStatus()==0) {
					session.setAttribute("user",user);
					session.setAttribute("id",user.getId());
					if(user.getType()==1) {
						session.setAttribute("power",2);
					}else {
						session.setAttribute("power",1);
					}
					return 0;
					}else if(user.getStatus()==2){
						return -4;
					}else {
						return -3;
					}
				}else {
					return -1;	
				}
			}else {
				return -2;
			}
		
	}
	
	}
	
	@RequestMapping("toindex")
	public String toindex() {
		return "index";
	}
	}

