<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link type="text/css" rel="stylesheet"
	href="${pageContext.request.contextPath }/css/style.css" />
<link type="text/css" rel="stylesheet"
	href="${pageContext.request.contextPath }/css/popout_form_style.css" />
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link href="${pageContext.request.contextPath }/css/bootstrap.min.css"
	rel="stylesheet" type="text/css">
<script src="${pageContext.request.contextPath }/js/bootstrap.min.js"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<body>
	<input id="path" type="hidden"
		value="${pageContext.request.contextPath }" />
	<div class="container">
		<div id="header">
			<div id="titleName">
				<a href="./home.html"><img
					src="${pageContext.request.contextPath }/img/bug.png" id="uniIcon" /></a>
			</div>
			<nav>
				<ul>
					<s:if test="#session.user2==null">
						<li><a href="#" id="sign-in" data-toggle="modal"
							data-target="#login-modal"> Sign in</a></li>
						<li><a href="#" id="sign-up" data-toggle="modal"
							data-target="#signup-modal"> Sign up</a></li>
					</s:if>
					<s:if test="#session.user2!=null">
						<li><a
							href="${pageContext.request.contextPath }/user2/detail.action"
							id="user_name" data-toggle="modal"> Profile</a></li>
						<li><a
							href="${pageContext.request.contextPath }/user2/logout.action"
							id="user_name" data-toggle="modal">Logout</a></li>
					</s:if>
				</ul>

			</nav>
		</div>
		<div class="modal fade" id="login-modal" tabindex="-1" role="dialog"
			aria-labelledby="myModalLabel" aria-hidden="true"
			style="display: none;">
			<div class="modal-dialog">
				<div class="loginmodal-container">
					<h1>Sign in</h1>
					<br>
					<form
						action="${pageContext.request.contextPath }/user2/login.action"
						method="post">
						<input type="text" name="user2.email" id="login_user_name"
							placeholder="Username"> <input type="password"
							name="user2.password" id="login_assword" placeholder="Password">
						<input type="submit" name="login" class="login loginmodal-submit"
							value="Login">
					</form>
					<div class="login-help">
						<a href="#" data-toggle="modal" data-target="#signup-modal">Register</a>
					</div>
				</div>
			</div>
		</div>
		<div class="modal fade" id="signup-modal" tabindex="-1" role="dialog"
			aria-labelledby="myModalLabel" aria-hidden="true"
			style="display: none;">
			<div class="modal-dialog">
				<div class="loginmodal-container">
					<h1>Sign up</h1>
					<br>
					<form
						action="${pageContext.request.contextPath }/user2/signup.action">
						<input type="text" name="user2.userName" id="signup_user_name"
							placeholder="Username"> <input type="text"
							name="user2.email" id="signup_email" placeholder="Email address">
						<input type="password" name="user2.password" id="signup_password"
							placeholder="Password"> <input type="password"
							name="cpass" id="signup_c_password"
							placeholder="Comfirm password"> <input type="submit"
							name="Signup" class="login loginmodal-submit" value="Signup">
					</form>
				</div>
			</div>
		</div>
		<div class="row">
			<form action="${pageContext.request.contextPath }/bug/search.action" method="POST" id="search-form">
				<div class="col-sm-6 col-sm-offset-3">
					<div id="imaginary_container">
						<div class="input-group stylish-input-group">
							<input type="text" class="form-control" name="bug.short_desc" placeholder="Search">
							<span class="input-group-addon">
								<button type="submit">
									<span class="glyphicon glyphicon-search"></span>
								</button>
							</span>
						</div>
					</div>
				</div>
			</form>
		</div>
		
		<div class="row">
			<s:iterator var="q" value="#request.bugs" status="st">
				<div class="col-sm-6 col-md-12">
				<div class="thumbnail">
					<div class="caption">
						<div class="media-body">
							<h4 class="media-heading"><a href="${pageContext.request.contextPath }/bug/scan.action?bug.bug_id=<s:property value="#q.bug_id" />"><s:property value="#q.bug_id" /></a></h4>
							<p>Short Description:  <s:property value="#q.short_desc" escape="false" /></p>
							<p>Reported by:  <s:property value="#q.reporter" escape="false" /></p>
							<p>Creation Time:  <s:property value="#q.creation_ts" escape="false" /></p>
						</div>
					</div>
				</div>
			</div>
			</s:iterator>
					

			<nav>
				<ul class="pager">
					<li class="previous disabled"><a href="#"><span
							aria-hidden="true">&larr;</span> Older</a></li>
					<li class="next"><a href="#">Newer <span
							aria-hidden="true">&rarr;</span></a></li>
				</ul>
			</nav>

		</div>

</body>
</html>