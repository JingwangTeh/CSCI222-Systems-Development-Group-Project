<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<html>
<head>
	<link type="text/css" rel="stylesheet" href="css/style.css" />
	<link type="text/css" rel="stylesheet" href="css/popout_form_style.css" />
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
  	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  	<link type="text/css" rel="stylesheet" href="css/font-awesome.min.css" />
  	<script src="js/script.js"></script>
  	<script>

  	</script>
</head>
	<body>
		<div class="container">
			<div id="header">
				<div id="titleName">
					<a href="./home.html"><img src="image/uow171491.png" id="uniIcon"/></a>
				</div>
				<div class="nav-left-menu">
					<ul class="nav navbar">
				        <li class="nav-item active">
				          <a class="nav-link" href="#">Home</a>
				        </li>
				        <li class="nav-item">
				          <a class="nav-link" href="#">Browse</a>
				        </li>
	          		</ul>
          		</div>
				<nav>
	                <ul>
	                    <li><a href="#" id="user_name" data-toggle="modal" data-target="#signup-modal">
	                    	Admin01</a></li>
	                    <li><button type="button" class="btn btn-logout">
  							<span class="glyphicon glyphicon-log-out" aria-hidden="true"></span>
						</button></li>
	                </ul>
	            </nav>
			</div>
			<div class="row left-menu">
		         <div class="col-md-4">
		            <!-- It can be fixed with bootstrap affix http://getbootstrap.com/javascript/#affix-->
		            <div id="sidebar" class="well sidebar-nav">
		                <h5><i class="glyphicon glyphicon-user"></i>
		                    <small><b>USERS</b></small>
		                </h5>
		                <ul class="nav nav-pills nav-stacked">
		                    <li class="active"><a href="#">List</a></li>
		                    <li><a href="#">Add User</a><li>
		                    <li><a href="#">Change reputation factor</a></li>
		                </ul>
		            </div>
		        </div>
		        <div class="col-md-8">
		            <!-- Content Here -->
		        </div>
		    </div>
		    <div class="content top-space content-user-list">
		    	<form method="POST" action="${pageContext.request.contextPath }/user2/modify.action">
		    		<input name="user2.id" value="${param.userid}" type="hidden" />
	    			<div class="form-group">
						<label class="col-xs-2">Role</label>
						<div>
							<select>
								<option value="developer">Developer</option>
								<option value="triager">Triager</option>
								<option value="reviewer">Reviewer</option>
							</select>
						</div>
					</div>
					<div class="form-group">
						<label class="col-xs-2">Status</label>
						<div>
							<select>
								<option value="active">Activate</option>
								<option value="deactive">Deactivate</option>	
							</select>
						</div>
					</div>
		    		<div class="form-group">
		    			<div class="col-xs-offset-2 col-xs-10">
		    				<button type="submit" />Change <span class="glyphicon glyphicon-retweet"></span></button>
		    			</div>
		    		</div>
		    	</form>
		    </div>
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
		                <li><a href="#">© 2016 Bug Overflow.</a></li>
		            </ul>
		        </div>
		    </div>
		</div>
	</body>
</html>