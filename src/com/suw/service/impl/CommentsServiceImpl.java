package com.suw.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.suw.dao.BaseDAO;
import com.suw.entity.Comment;
import com.suw.entity.Comments;
import com.suw.entity.Bug;
import com.suw.service.CommentService;
import com.suw.service.CommentsService;

@Service("commentsService")
public class CommentsServiceImpl implements CommentsService{

	@Resource
	private BaseDAO<Comments> baseDAO;

	@Override
	public List<Comments> findCommentsByBugId(int bugID) {
		return baseDAO.find("from Comments com where com.bug_id = ?",new Object[]{bugID});
	}
	
	@Override
	public Comments addComments(Comments comment) {
		return baseDAO.save(comment);
	}
	
	
	@Override
	@Transactional
	public List<Comments> viewComments(int bugID) {
		return baseDAO.find("from Comments where bug_id= ?", new Object[]{bugID});
	}
}
