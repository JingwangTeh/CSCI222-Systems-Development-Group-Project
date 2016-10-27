<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<html>
<head>
	<link type="text/css" rel="stylesheet" href="css/style.css" />
	<link type="text/css" rel="stylesheet" href="css/popout_form_style.css" />
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
	<link rel="stylesheet" href="https://cdn.datatables.net/1.10.12/css/dataTables.bootstrap.min.css">
  	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
  	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
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
	                    	Develop01</a></li>
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
		                <ul class="nav nav-pills nav-stacked">
		                    <li><a href="${pageContext.request.contextPath }/home.jsp">Home</a></li> <!--class="active" with hightlight it-->
		                    <li><a href="#">Report bug</a></li>
		                </ul>
		                <h5><i class="glyphicon glyphicon-inbox"></i>
		                    <small><b>Work</b></small>
		                </h5>
		                <ul class="nav nav-pills nav-stacked">
		                    <li><a href="#">Bug received</a></li>
		                </ul>
		            </div>
		        </div>
		    </div>
		    <div class="content top-space">
		    	<div>
				  	<h2 class="page-header-control">Edit Profile</h2>
				  	<div class="row">
				    <!-- left column -->
				    <div class="col-md-4 col-sm-6 col-xs-12">
				      <div class="text-center">
				        <img src="http://lorempixel.com/200/200/people/9/" class="avatar img-circle img-thumbnail" alt="avatar">
				        <h6>Upload a different photo...</h6>
				        <input type="file" class="text-center center-block well well-sm">
				      </div>
				    </div>
				    <!-- edit form column -->
				    <div class="col-md-8 col-sm-6 col-xs-12 personal-info">
				      <h3 class="info-header">Personal info</h3>
				      <form class="form-horizontal" role="form">
				      	<div class="form-group">
			          		<label class="col-md-3 control-label">Username:</label>
			          		<div class="col-md-8">
				            	<input class="form-control" value="Developer01" type="text">
				          	</div>
				        </div>
				        <div class="form-group">
				          <label class="col-md-3 control-label">Password:</label>
				          <div class="col-md-8">
				            <input class="form-control" value="11111122333" type="password">
				          </div>
				        </div>
				        <div class="form-group">
				          <label class="col-md-3 control-label">Confirm password:</label>
				          <div class="col-md-8">
				            <input class="form-control" value="11111122333" type="password">
				          </div>
				        </div>
				        <div class="form-group">
				          <label class="col-md-3 control-label"></label>
				          <div class="col-md-8">
				            <input class="btn btn-primary" value="Save Changes" type="button">
				            <span></span>
				            <input class="btn btn-default" value="Cancel" type="reset">
				          </div>
				        </div>
				      </form>
				    </div>
				  </div>
				</div>
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
		                <li><a href="#">Â© 2016 Bug Overflow.</a></li>
		            </ul>
		        </div>
		    </div>
		</div>
	</body>
</html>