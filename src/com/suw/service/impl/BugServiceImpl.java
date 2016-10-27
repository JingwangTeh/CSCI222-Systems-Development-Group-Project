package com.suw.service.impl;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.mysql.jdbc.ResultSet;
import com.suw.dao.BaseDAO;
import com.suw.entity.Bug;
import com.suw.entity.Question;
import com.suw.entity.User2;
import com.suw.service.BugService;
import com.suw.service.QuestionService;

@Service("bugService")
public class BugServiceImpl implements BugService {
	
	@Resource
	private BaseDAO<Bug> baseDAO;

	@Override
	public List<Bug> findListAll(int currentPage, int i) {
		return baseDAO.find("from Bug  ", new Object[]{}, currentPage, i);
	}

	@Override
	@Transactional
	public List<Bug> search(Bug bug, int currentPage) {
//		System.out.println(bug);
		List<Object> params = new ArrayList<Object>();
		StringBuffer hql = new StringBuffer("from Bug b where ");
		if(!(null == bug.getShort_desc() || ""== bug.getShort_desc().trim())){
			String[] split = bug.getShort_desc().split(" ");
			for(int i=0;i<split.length;i++){
				if(split[i].trim() != ""){
					hql.append(" b.short_desc like ? or");
					params.add(split[i].trim());
//					System.out.println(split[i].trim());
				}
			}
		}
		
		int length = hql.length();
//		System.out.println(hql);
		if(hql.indexOf("or", length-2)>0){
			hql.delete(length-2, length);
		}
		if(hql.indexOf("and", length-3)>0){
			hql.delete(length-3, length);
		}
		System.out.println(hql);
		List<Bug> bugs = baseDAO.find(hql.toString(),params,currentPage,10,"search");
		
		return bugs;
	};
	
	public Bug find(int bugID){
		Bug q = baseDAO.get(Bug.class, bugID);
		q.setViewCount(q.getViewCount()+1);
		baseDAO.update(q);
		return q;
	}

	@Override
	public void add(Bug bug) {
		baseDAO.saveOrUpdate(bug);
		
	};
	
	@Transactional
	@Override
	public List<Bug> viewAssignBug(String username) {
		return baseDAO.find("from Bug b where b.assigned_to=?",new Object[]{username});
	}
	
	@Transactional
	@Override
	public List<Bug> viewDupBug(){
		return baseDAO.find("from Bug b where b.resolution=?",new Object[]{"duplicate"});
	}
	
	
	@Transactional
	@Override
	public List<Bug> viewUnsolvedBug(){
		return baseDAO.find("from Bug b where b.resolution=?",new Object[]{"unsolved"});
	}
	
	@Transactional
	@Override
	public void merge(int id){
		baseDAO.delete("delete from Bug b where b.bug_id=?", new Object[]{id});
	}	


}
