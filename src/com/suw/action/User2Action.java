package com.suw.action;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.struts2.ServletActionContext;
import org.apache.struts2.json.annotations.JSON;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.opensymphony.xwork2.ActionContext;
import com.suw.entity.User;
import com.suw.entity.User2;
import com.suw.service.User2Service;
import com.suw.util.CookieUtils;
import com.suw.util.Util;

@Controller
public class User2Action{
	@Resource
	private User2Service user2Service;
	
	@Autowired
	private User2 user2;
	
	private List<User2> list;
	
	
	Map<String, Object> session;
	Map<String, Object> request;
	

	public String signup(){
		initSessionAndRequest();
		user2.setPassword(Util.md5Encryption(user2.getPassword()));
		user2.setRole("developer");
		user2Service.saveUser(user2);
		session.put("user", user2);
		return "success";
	}
	public String login(){
	
		initSessionAndRequest();
		user2.setPassword(Util.md5Encryption(user2.getPassword()));
		User2 userLogin = user2Service.findUserByEmailAndPWD(user2.getEmail(), user2.getPassword());
		if(null ==  userLogin){
			return "false";
		}else{
			session.put("user2", userLogin);	
			return "success";
		}
	}
	public String logout(){
		initSessionAndRequest();
		session.remove("user2");
		CookieUtils.delCookie(ServletActionContext.getRequest(),ServletActionContext.getResponse());
		return "success";
	}
	public String add(){
		initSessionAndRequest();
		user2.setPassword(Util.md5Encryption(user2.getPassword()));
		user2Service.saveUser(user2);
		return "success";
	}
	
	public String modify(){
		initSessionAndRequest();
		user2.setStatus("deactive");
		user2.setRole("triager");
		user2Service.modify(user2);
		
		return "success";
	}
	public String list(){
		initSessionAndRequest();
		list = user2Service.list();
		return "success";
	}
	public String detail(){
		initSessionAndRequest();
		User2 u = (User2) session.get("user2");
		System.out.print(u);
		if(null==u){
			return "false";
		}
		else{
			if(u.getRole().equals("admin"))
				return "admin";
			else if(u.getRole().equals("developer"))
				return "developer";
			else if(u.getRole().equals("receiver"))
				return "receiver";
			else if(u.getRole().equals("triager"))
				return "triager";
				
		}
		return "false";
	}
	
	public User2Service getUser2Service() {
		return user2Service;
	}
	public void setUser2Service(User2Service user2Service) {
		this.user2Service = user2Service;
	}
	public User2 getUser2() {
		return user2;
	}
	public void setUser2(User2 user) {
		this.user2 = user;
	}
	private void initSessionAndRequest(){
		session = ActionContext.getContext().getSession(); 
		request = (Map)ActionContext.getContext().get("request");
	}
	@JSON(serialize=true)
	public List<User2> getList() {
		return list;
	}
	public void setList(List<User2> list) {
		this.list = list;
	}
	
	
}