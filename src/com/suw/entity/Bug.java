package com.suw.entity;

import java.util.Date;
import java.util.List;

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

import org.hibernate.annotations.GeneratorType;
import org.hibernate.annotations.GenericGenerator;
import org.hibernate.annotations.Type;
import org.springframework.stereotype.Component;
@Component 
@Entity
@Table(name="bugs")
public class Bug {
//	idPosts	Id	PostTypeId	AcceptedAnswerId	ParentID	CreationDate	
//	Score	ViewCount	Body	OwnerUserId	Title	Tags	AnswerCount	
//	CommentCount												
	private int bug_id;
	private int viewCount;
	private String creation_ts;
	private String short_desc;
	private String delta_ts;
	private String reporter;
	private String assigned_to;
	private String resolution;
	private String cc;
	private String op_sys;
	
	public String getOp_sys() {
		return op_sys;
	}
	public void setOp_sys(String op_sys) {
		this.op_sys = op_sys;
	}
	private List<Comments> comments;
	
	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	@Column(name="bug_id",unique=true,nullable=false)
	public int getBug_id() {
		return bug_id;
	}
	public void setBug_id(int bug_id) {
		this.bug_id = bug_id;
	}
	
	@Column(name="viewCount")
	public int getViewCount() {
		return viewCount;
	}
	public void setViewCount(int viewCount) {
		this.viewCount = viewCount;
	}
	
	@Column(name="creation_ts")
	public String getCreation_ts() {
		return creation_ts;
	}
	public void setCreation_ts(String creation_ts) {
		this.creation_ts = creation_ts;
	}
	
	
	@Column(name="short_desc")
	public String getShort_desc() {
		return short_desc;
	}
	public void setShort_desc(String short_desc) {
		this.short_desc = short_desc;
	}
	
	@Column(name="delta_ts")
	public String getDelta_ts() {
		return delta_ts;
	}
	public void setDelta_ts(String delta_ts) {
		this.delta_ts = delta_ts;
	}
	
	@Column(name="reporter")
	public String getReporter() {
		return reporter;
	}
	public void setReporter(String reporter) {
		this.reporter = reporter;
	}
	
	@Column(name="assigned_to")
	public String getAssigned_to() {
		return assigned_to;
	}
	public void setAssigned_to(String assigned_to) {
		this.assigned_to = assigned_to;
	}
	
	@Column(name="resolution")
	public String getResolution() {
		return resolution;
	}
	public void setResolution(String resolution) {
		this.resolution = resolution;
	}
	
	@Column(name="cc")
	public String getCc() {
		return cc;
	}
	public void setCc(String cc) {
		this.cc = cc;
	}
	@Override
	public String toString() {
		return "Bug [bug_id=" + bug_id + ", viewCount=" + viewCount
				+ ", creation_ts=" + creation_ts + ", short_desc=" + short_desc
				+ ", delta_ts=" + delta_ts + ", reporter=" + reporter
				+ ", assigned_to=" + assigned_to + ", resolution=" + resolution
				+ ", cc=" + cc + "]";
	}
	
	
	@Transient 
	public List<Comments> getComments() {
		return comments;
	}
	public void setComments(List<Comments> comments) {
		this.comments = comments;
	}
	public void assign(Bug bug) {
		this.assigned_to = bug.getReporter();
		
	}
	
}
