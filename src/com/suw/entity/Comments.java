package com.suw.entity;

import java.util.Date;


import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Lob;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.persistence.Transient;

import org.hibernate.annotations.Type;
import org.springframework.stereotype.Component;
@Component
@Entity
@Table(name="comments")
public class Comments {
//	idPosts	Id	PostTypeId	AcceptedAnswerId	ParentID	CreationDate	
//	Score	ViewCount	Body	OwnerUserId	Title	Tags	AnswerCount	
//	CommentCount												
	private int commentid;
	private int bug_id;
	private int attachid;
	private String who;
	private String bug_when;
	private String thetext;
	

	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	@Column(name="commentid",unique=true,nullable=false)
	public int getCommentid() {
		return commentid;
	}

	public void setCommentid(int commentid) {
		this.commentid = commentid;
	}
	
	@Column(name="bug_id")
	public int getBug_id() {
		return bug_id;
	}

	public void setBug_id(int bug_id) {
		this.bug_id = bug_id;
	}

	@Column(name="attachid")
	public int getAttachid() {
		return attachid;
	}

	public void setAttachid(int attachid) {
		this.attachid = attachid;
	}

	@Column(name="who")
	public String getWho() {
		return who;
	}

	public void setWho(String who) {
		this.who = who;
	}

	@Column(name="bug_when")
	public String getBug_when() {
		return bug_when;
	}

	public void setBug_when(String bug_when) {
		this.bug_when = bug_when;
	}

	@Column(name="thetext")
	public String getThetext() {
		return thetext;
	}

	public void setThetext(String thetext) {
		this.thetext = thetext;
	}

	@Override
	public String toString() {
		return "Comments [commentid=" + commentid + ", bug_id=" + bug_id
				+ ", attachid=" + attachid + ", who=" + who + ", bug_when="
				+ bug_when + ", thetext=" + thetext + "]";
	}

	
	
}
