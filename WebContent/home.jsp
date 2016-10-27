<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<html>
<head>
<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath }/css/style.css" />
	<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath }/css/popout_form_style.css" />
	<link type="text/css" rel="stylesheet" href="https://cdn.datatables.net/1.10.12/css/dataTables.bootstrap.min.css" />
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
  	<script src="https://code.jquery.com/jquery-1.12.3.js"></script>
  	<script src="https://cdn.datatables.net/1.10.12/js/jquery.dataTables.min.js"></script>
  	<script src="https://cdn.datatables.net/1.10.12/js/dataTables.bootstrap.min.js"></script>
  	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
  	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  	<script src="${pageContext.request.contextPath }/js/script.js"></script>

  	<script src="http://s.codepen.io/assets/libs/modernizr.js" type="text/javascript"></script>
    
    <link rel='stylesheet prefetch' href='http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css'>
	<link rel='stylesheet prefetch' href='http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap-theme.min.css'>
	<link rel='stylesheet prefetch' href='http://cdnjs.cloudflare.com/ajax/libs/jquery.bootstrapvalidator/0.5.0/css/bootstrapValidator.min.css'>
<title>BugTrack</title>
<script type="text/javascript">
  	 $(document).ready(function(){
  			var path = $("#path").val();
  			$.ajax({  
  	           url:path+'/bug/all.action?currentPage=0',  
  	           type:'POST',  
  	           data:"",  
  	           dataType:'json',  
  	           success:function (data) {
  	        	 $("#smallGroup").html("<button type='button' class='btn  btn-info pull-left  ' id='fun_hot' value='1' >Hot</button>"+   
	             	"<button type='button' class='btn btn-default  pull-left' id='fun_recommend' value='2'>Recommend</button>");
  	           	$(data.bugs).each(function (i, value) {  
  	           	 $("#myTable").append(
  	           			 "<tr>"+
  	           			"<td><span class='badge ' id='asd_b'> <input class='badge' value='"+value.bug_id+"'>"+value.bug_id+"</span></td>"+
		                "<td><span class='badge ' id='asd_v'> <input class='badge' value='"+value.viewCount+"'>"+value.viewCount+"</span></td>"+
		                "<th scope=\"row\"><a href=\""+path+"/bug/scan.action?bug.bug_id="+value.bug_id+"\">"+value.short_desc+"'>"+value.short_desc+"</span></th>"+
		                "<td><span class='badge ' id='asd_c'> <input class='badge' value='"+value.resolution+"'>"+value.resolution+"</span></td>"+
		                "<td><span class='badge ' id='asd_c'> <input class='badge' value='"+value.reporter+"'>"+value.reporter+"</span></td>"+
		                "<td><span class='badge ' id='asd_c'> <input class='badge' value='"+value.creation_ts+"'>"+value.creation_ts+"</span></td>"+
		                "</tr>");  
  	           }); 
	  	          var htmlValue = "<tr>"+
	              "<td><span class='badge '> <input class='badge' ></input></span></td>"+
	              "<td><span class='badge ' > <input class='badge' ></input></span></td>"+
	              "<td><span class='badge ' > <input class='badge' ></input></span></td>"+
	              "<td>" ;
	          	htmlValue += "<button id='page_next' type='button' class='btn btn-default  pull-right'>Next</button>";
	          		if(pageNumber!=1){
		            		htmlValue +="<button id='page_last' type='button' class='btn btn-default  pull-right'>Last</button>";
		            	 }
	          		htmlValue += "</td></tr>";
	          	$("#tbody").append(htmlValue);
	          	$("#currentPage").val(pageNumber);
  	           }
  	           
  	       }); 
  	 });
  	</script>
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
				<form action="${pageContext.request.contextPath }/user2/login.action" method="post">
					<input type="text" name="user2.email" id="login_user_name"
						placeholder="Username"> <input type="password"
						name="user2.password" id="login_assword" placeholder="Password">
					<input type="submit" name="login" class="login loginmodal-submit"
						value="Login">
				</form>
					<%-- <form method="post" role="form" id="login-form" autocomplete="off" action="${pageContext.request.contextPath }/user2/login.action"
						method="post">
					        <div class="form-body">
					    		<div class="form-group">
								    <div class="input-group input_box">
								    	<div class="input-group-addon"><span class="glyphicon glyphicon-user"></span></div>
								    	<input name="email" id="login_user_name" type="text" class="form-control input_box" placeholder="User email" style="margin-bottom: 0;">
								    </div>
								    <span class="help-block" id="error"></span>
								</div>
						        <div class="form-group">
					                <div class="input-group input_box">
					                	<div class="input-group-addon"><span class="glyphicon glyphicon-lock"></span></div>
				                        <input name="login_password" id="login_assword" type="password" class="form-control input_box" placeholder="Password">
				                    </div>  
				                    <span class="help-block" id="error"></span>                      
					            </div>
					        </div>
							<div class="form-group">
									<label class="col-md-4 control-label"></label>
									<div class="col-md-4">
									    <button type="submit" class="btn btn-warning log-in-btn" >Log in <span class="glyphicon glyphicon-log-in"></span></button>
									</div>
								</div>
					</form> --%>
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
		<div id="table_con" align = "center">
			<div class="table_control">
				<table class="table home_table">
					<thead>
						<tr>
							<th class="bugID">Bug ID</th>
							<th class="views">Views</th>
							<th class="comments">Title</th>
							<th class="title">Status</th>
							<th class="reporter">Reporter</th>
							<th class="Creation_ts">Creation Date</th>
						</tr>
					</thead>
					<tbody id="myTable">
					</tbody>
				</table>
			</div>
			<div class="col-md-12 text-center">
				<div class="page-nation">
					<ul class="pagination pagination-large" id="myPager" /></ul>
				</div>
			</div>
		</div>
		
	</div>
	
	<div class="statistic-control">
			<hr/>
			<table class="table borderless stat_table">
				<tr>
					<th id="bug_total_tit">Bugs reported
						<span class="glyphicon glyphicon-file" aria-hidden="true">
					</th>
					<th id="bug_solve_tit">Bugs solved
						<span class="glyphicon glyphicon-ok" aria-hidden="true">
					</th>
				</tr>
				<tr>
					<td id="bug_total_num">2503</td><td id="bug_solve_num">2130</td>
				</tr>
			</table>
			<table class="table borderless best_user">
				<tr>
					<th id="best_report_tit">Best reporter
						<span class="glyphicon glyphicon-star" aria-hidden="true">
					</th>
					<th id="best_de_tit">Best developer
						<span class="glyphicon glyphicon-star" aria-hidden="true">
					</th>
				</tr>
				<tr>
					<td id="best_report_tit"><a href="#">Username</a></td>
					<td id="best_de_tit"><a href="#">Username</a></td>
				</tr>
			</table>
		</div>
	
	<div class="text-center footer-control">
		    <hr />
		  <div class="row">
		    <div class="col-lg-12">
		      <div class="col-md-3">
		        <ul class="nav nav-pills nav-stacked">
		          <li><a href="#">About us</a></li>
		        </ul>
		      </div>
		      <div class="col-md-3">
		        <ul class="nav nav-pills nav-stacked">
		          <li><a href="#">Contact us</a></li>
		        </ul>
		      </div>
		      <div class="col-md-3">
		        <ul class="nav nav-pills nav-stacked">
		          <li><a href="#">Git Hub</a></li>    
		        </ul>
		      </div>
		      <div class="col-md-3">
		        <ul class="nav nav-pills nav-stacked">
		          <li><a href="#">Help</a></li>
		        </ul>
		      </div>  
		    </div>
		  </div>
		  <hr>
		    <div class="row">
		        <div class="col-lg-12">
		            <ul class="nav nav-pills nav-justified">
		                <li><a href="#">Â© 2016 Bug Overflow.</a></li>
		            </ul>
		        </div>
		    </div>
		</div>
</body>
<script
	src="${pageContext.request.contextPath }/js/assets/jquery.validate.min.js"></script>
<script src="${pageContext.request.contextPath }/js/register.js"></script>
</html>