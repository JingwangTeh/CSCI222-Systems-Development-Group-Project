package com.suw.action;

import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.opensymphony.xwork2.ActionContext;
import com.suw.entity.Bug;
import com.suw.entity.Comments;
import com.suw.entity.User2;
import com.suw.service.BugService;
import com.suw.service.CommentsService;
import com.suw.service.QuestionService;
import com.suw.service.User2Service;

@Controller
public class CommentsAction {
	
	@Autowired
	private Comments comments;
	
	Map<String, Object> session;
	Map<String, Object> request;
	
	@Resource
	private CommentsService commentsService;
	@Resource
	private BugService bugService;
	private List<Comments> comment;
	
	public String viewComments(int bugID){
		comment = commentsService.viewComments(bugID);
		return "success";
	}
	
	public String add(){
		System.out.println(comments);
		commentsService.addComments(comments);
		return "success";
	}

	public Comments getComments() {
		return comments;
	}

	
	public void setComments(Comments comments) {
		this.comments = comments;
	}

	public Map<String, Object> getSession() {
		return session;
	}

	public void setSession(Map<String, Object> session) {
		this.session = session;
	}

	public Map<String, Object> getRequest() {
		return request;
	}

	public void setRequest(Map<String, Object> request) {
		this.request = request;
	}

	public CommentsService getCommentsService() {
		return commentsService;
	}

	public void setCommentsService(CommentsService commentsService) {
		this.commentsService = commentsService;
	}
	

	private void initSessionAndRequest(){
		session = ActionContext.getContext().getSession(); 
		request = (Map)ActionContext.getContext().get("request");
	}
	
}
