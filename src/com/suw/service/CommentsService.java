package com.suw.service;

import java.util.List;

import com.suw.entity.Comment;
import com.suw.entity.Comments;

public interface CommentsService {
	
	public List<Comments> findCommentsByBugId(int bugID);
	public Comments addComments(Comments comment);
	public List<Comments> viewComments(int bugID);
}
