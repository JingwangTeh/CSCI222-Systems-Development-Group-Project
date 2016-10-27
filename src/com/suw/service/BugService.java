package com.suw.service;

import java.util.List;

import com.suw.entity.Bug;
import com.suw.entity.Question;
import com.suw.entity.User2;

public interface BugService {

	
	public List<Bug> search(Bug bug, int currentPage);
	
	public List<Bug> findListAll(int currentPage, int i);
	
	public Bug find(int bugID);

	public void add(Bug bug);
	
	public List<Bug> viewAssignBug(String username);
	
	public List<Bug> viewDupBug();
	
	public List<Bug> viewUnsolvedBug();

	public void merge(int bug_id);
	
	

}
