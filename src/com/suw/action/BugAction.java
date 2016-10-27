package com.suw.action;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.struts2.json.annotations.JSON;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.socket.sockjs.transport.handler.SockJsWebSocketHandler;

import com.opensymphony.xwork2.ActionContext;
import com.suw.entity.User2;
import com.suw.entity.Bug;
import com.suw.service.CommentsService;
import com.suw.service.User2Service;
import com.suw.service.BugService;
import com.suw.util.Util;
@Controller
public class BugAction {
	
	@Autowired
	private Bug bug;
	
	Map<String, Object> session;
	Map<String, Object> request;
	
	@Resource
	private BugService bugService;
	@Resource
	private CommentsService commentsService;
	private int currentPage;
	private List<Bug> bugs;
	private boolean fa;
	
	public String all(){
		bugs = bugService.findListAll(currentPage, 16);
		return "success";
	}
	
	
	public String viewAssignBug(){
		initSessionAndRequest();
		User2 user = (User2)session.get("user2");
		bugs = bugService.viewAssignBug(user.getUserName());
		return "success";
	}
	
	public String viewDupBug(){
		initSessionAndRequest();
		bugs = bugService.viewDupBug();
		return "success";
	}
	
	public String viewUnsolvedBug(){
		initSessionAndRequest();
		bugs = bugService.viewUnsolvedBug();
		return "success";
	}
	
	@JSON(serialize=false)
	public int getCurrentPage() {
		return currentPage;
	}
	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
	}
	public List<Bug> getBugs() {
		return bugs;
	}
	public void setBugs(List<Bug> bugs) {
		this.bugs = bugs;
	}
	@JSON(serialize=false)
	public BugService getBugService() {
		return bugService;
	}
	public void setBugService(BugService bugService) {
		this.bugService = bugService;
	}
	
	private void initSessionAndRequest(){
		session = ActionContext.getContext().getSession(); 
		request = (Map)ActionContext.getContext().get("request");
	}
	
	public String search(){
		bug.setReporter(bug.getShort_desc());
		List<Bug> bugs = bugService.search(bug, currentPage);
		initSessionAndRequest();
		request.put("bugs", bugs);
		return "success";
	}
	public Bug getBug() {
		return bug;
	}
	public void setBug(Bug bug) {
		this.bug = bug;
	}
	@SuppressWarnings("deprecation")
	public String add(){
		System.out.print(bug);
		Date date = new Date();
		int year = date.getYear();
		int month = date.getMonth();
		int day = date.getDay();
		System.out.println(year+"-"+month+"-"+day);
		bug.setResolution("unsolved");
		bug.setCreation_ts(year+"-"+month+"-"+day);
		bugService.add(bug);
		return "success";
	}
	public String scan(){
		if(null == bug){
			return "false";
		}
		bug = bugService.find(bug.getBug_id());
		
		bug.setComments(commentsService.findCommentsByBugId(bug.getBug_id()));
		return "success";
	}

	public String merge(){
		bugService.merge(bug.getBug_id());
		return "success";
	}
	
}
