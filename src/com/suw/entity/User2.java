package com.suw.entity;

import java.util.Date;


import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import org.hibernate.annotations.GenericGenerator;
import org.springframework.stereotype.Component;
@Component 
@Entity
@Table(name="user2")
public class User2 {
//	Id	Reputation	CreationDate	DisplayName	LastAccessDate	Location	Views	UpVotes	DownVotes	Age
	private int id;
	private String password;
	private String userName;
	private int reputation;
	private String email;
	private String role;
	private String status;

	
	@Column(name="status")
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	@Column(name="id",unique=true,nullable=false)
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	
	@Column(name="reputation")
	public int getReputation() {
		return reputation;
	}
	public void setReputation(int reputation) {
		this.reputation = reputation;
	}
	
	@Column(name="password",length=100)
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	
	
	@Column(name="user_name")
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	
	
	
	@Column(name="email",length=100)
	public String getEmail() {
		return email;
	}
	
	public void setEmail(String email) {
		this.email = email;
	}

	@Column(name="role")
	public String getRole(){
		return role;
	}
	public void setRole(String role){
		this.role = role;
	}
	@Override
	public String toString() {
		return "User2 [id=" + id + ", password=" + password + ", user_name="
				+ userName + ", reputation=" + reputation + ", email=" + email
				+ ", role=" + role + "]";
	}

	
}
