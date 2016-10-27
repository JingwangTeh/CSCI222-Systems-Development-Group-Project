package com.suw.action;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.struts2.ServletActionContext;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.opensymphony.xwork2.ActionContext;
import com.suw.entity.Answer;
import com.suw.entity.Question;
import com.suw.entity.User;
import com.suw.service.AnswerService;
import com.suw.service.CommentService;
import com.suw.service.QuestionService;
import com.suw.service.UserService;
import com.suw.util.CookieUtils;
import com.suw.util.Util;

@Controller
public class UserAction{
	@Resource
	private UserService userService;
	@Resource
	private QuestionService questionService;
	@Resource
	private CommentService commentService;
	@Resource
	private AnswerService answerService;
	@Autowired
	private User user;
	
	private int remember;
	private int age;
	private String returnPath;
	private String displayName;
	private String password;
	
	
	Map<String, Object> session;
	Map<String, Object> request;
	
	List<User> users;
	List<List<Question>> questions;
	
	int currentPage;
	public String signup(){
		String message = "";
		initSessionAndRequest();
		user.setCreationDate(new Date());
		user.setPassword(Util.md5Encryption(user.getPassword()));
		userService.saveUser(user);
		session.put("user", user);
		System.out.println(user);
		return "success";
	}
	public String login(){
//		returnPath = returnPath.substring(4);

		
		initSessionAndRequest();
		user.setPassword(Util.md5Encryption(user.getPassword()));
		user.setEmail(user.getDisplayName());
		user = 	userService.findUser(user);
		if(remember==1){
			ServletActionContext.getResponse().addCookie(CookieUtils.addCookie(user.getDisplayName()));
		}
		
		if(user==null){
			return "false";
		}
		if(user.getId()!=0){
			
			session.put("user", user);
			if(null != returnPath && returnPath.indexOf("question")>=0){
				return "question";
			}
			return "success";
		}
		return "false";
	}
	public String autoLogin(){
		
		String displayName = CookieUtils.getUserNameFromCookie(ServletActionContext.getRequest());
		user = userService.findUserByDisplayName(displayName);
		initSessionAndRequest();
		session.put("user", user);
		session.put("time", 2);
		return "success";
	}
	public String logout(){
		initSessionAndRequest();
		session.remove("user");
		CookieUtils.delCookie(ServletActionContext.getRequest(),ServletActionContext.getResponse());
		return "success";
	}
	public String checkuser(){
		User temp;
		if(user.getPassword()!="" && user.getPassword()!=null){
			temp = userService.findUser(user);
		}else{
			temp = userService.findUserByEmail(user.getEmail());
		}
		if(users==null){
			users = new ArrayList<User>();
		}
		if(temp!=null){
			users.add(temp);
		}else{
			temp = new User();
			users.add(temp);
		}
		return "success";
	}
	public String detail(){
		initSessionAndRequest();
		User u = (User) session.get("user");
		if(null==u){
			return "false";
		}
		
		return "success";
	}
	public String more(){
		initSessionAndRequest();
		User u = (User) session.get("user");
		if(null==u){
			return "false";
		}
		List<Question> lquestion = questionService.finQuestionsByUserId(u.getId(), currentPage);
		List<Question> lanswer = questionService.finQuestionsForAnswerByUserId(u.getId(), currentPage);
		if(null == questions){
			questions = new ArrayList<List<Question>>();
		}
		questions.add(lquestion);
		questions.add(lanswer);
		return "success";
	}
	public String update(){
		initSessionAndRequest();
		User u = (User) session.get("user");
		if(null==u){
			return "false";
		}
		u.setDisplayName(displayName);
		if(!password.equals("********")){
			u.setPassword(Util.md5Encryption(password));
		}
		u.setAge(age);
		userService.updateUser(u);
		
		session.put("user", u);
		return "success";
	}
	public UserService getUserService() {
		return userService;
	}

	public void setUserService(UserService userService) {
		this.userService = userService;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}
	private void initSessionAndRequest(){
		session = ActionContext.getContext().getSession(); 
		request = (Map)ActionContext.getContext().get("request");
	}
	public List<User> getUsers() {
		return users;
	}
	public void setUsers(List<User> users) {
		this.users = users;
	}
	
	public String getReturnPath() {
		return returnPath;
	}
	public void setReturnPath(String returnPath) {
		this.returnPath = returnPath;
	}
	public int getRemember() {
		return remember;
	}
	public void setRemember(int remember) {
		this.remember = remember;
	}
	public List<List<Question>> getQuestions() {
		return questions;
	}
	public void setQuestions(List<List<Question>> questions) {
		this.questions = questions;
	}
	public int getCurrentPage() {
		return currentPage;
	}
	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
	}
	public void setCurrentPage(String currentPage) {
		this.currentPage = Integer.parseInt(currentPage.trim());
	}
	public int getAge() {
		return age;
	}
	public void setAge(int age) {
		this.age = age;
	}
	public String getDisplayName() {
		return displayName;
	}
	public void setDisplayName(String displayName) {
		this.displayName = displayName;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	
	
	
}