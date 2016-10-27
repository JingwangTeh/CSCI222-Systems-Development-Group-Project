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
	                    	triager</a></li>
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
		                    <li><a href="${pageContext.request.contextPath }/home.jsp">Home</a></li> <!--class="active" with hightlight it-->
		                    <li><a href="report.jsp">Report bug</a></li>
		                </ul>
		                <h5><i class="glyphicon glyphicon-inbox"></i>
		                    <small><b>Work</b></small>
		                </h5>
		                <ul class="nav nav-pills nav-stacked">
		                    <li><a href="${pageContext.request.contextPath }/listUnsolved.jsp">List bugs need assigned </a></li>
		                </ul>
		                 <ul class="nav nav-pills nav-stacked">
		                    <li><a href="${pageContext.request.contextPath }/mergeDup.jsp">Merge duplicated bugs </a></li>
		                </ul>
		            </div>
		        </div>
		        <div class="col-md-8">
		            <!-- Content Here -->
		        </div>
		    </div>
		    <div class="content top-space modify-user">
			    <div class="modify-container">
			    	<h2><a href="#">Assign to:</h2>
			    	<form method="POST" action="${pageContext.request.contextPath }/bug/assign.action">
			    		<input name="user2.id" value="${param.userid}" type="hidden" />
		    			<div class="form-group">
							<label class="col-xs-2">Developer</label>
							<div>
								<select>
									<option value="developer">cyc969</option>
									<option value="triager">foo</option>
									<option value="reviewer">bar</option>
								</select>
							</div>
						</div>
			    		<div class="form-group">
			    			<div class="col-xs-offset-2">
			    				<button type="submit" class="btn btn-primary"/>Change <span class="glyphicon glyphicon-retweet"></span></button>
			    			</div>
			    		</div>
			    	</form>
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
		                <li><a href="#">© 2016 Bug Overflow.</a></li>
		            </ul>
		        </div>
		    </div>
		</div>
	</body>
</html>