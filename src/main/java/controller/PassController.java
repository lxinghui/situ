package controller;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import entity.Operator;
import entity.User;
import service.OperatorService;
import service.UserService;
import utils.JsonInfo;
import utils.SearchInfo;

@Controller
public class PassController {
	@Resource(name="Operator_ServiceImpl")
	OperatorService oservice;
	@Resource(name="User_ServiceImpl")
	UserService uservice;
	
	Operator o  =new Operator();
	User u = new User();
	@ResponseBody
	@RequestMapping("changePass")
	private JsonInfo changePass(String newpassword,int id,int cmd,HttpSession session) {
		/*
		 * cmd 1 ����Ա
		 * cmd 2 ѧ��
		 */
		if(cmd==1) {
			o.setPass(newpassword);
			o.setId(id);
			if(oservice.changePass(o)==1) {
				return new JsonInfo(1, "�޸ĳɹ�");
			}else {
				return new JsonInfo(-1, "�޸�ʧ��");
			}
		}else {
			u.setPass(newpassword);
			u.setId(id);
			if(uservice.changePass(u)==1) {
				return new JsonInfo(1, "�޸ĳɹ�");
			}else {
				return new JsonInfo(-1, "�޸�ʧ��");
			}
		}
	}
	/*
	 * session��ȡ��ǰ�û�id
	 * ����powerȨ���ж�cmd
	 * ����id��ȡ��ǰ���� password
	 */
	@RequestMapping("toChangePass")
	public String toChange(HttpSession session,ModelMap map) {
	    
	    int power = (Integer) session.getAttribute("power");
	    if(power==1) {
	    	map.put("cmd", 2);
	    }else   if(power==2) {
	    	map.put("cmd", 2);
	    }else  if(power==3) {
	    	map.put("cmd", 1);
	    }  if(power==4) {
	    	map.put("cmd", 1);
	    }
	    map.put("id",(Integer) session.getAttribute("id"));
	    
		return "changePass";
	}
	}

