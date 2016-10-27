<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<html>
<head>
	<link type="text/css" rel="stylesheet" href="css/style.css" />
	<link type="text/css" rel="stylesheet" href="css/popout_form_style.css" />
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
  	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
	<body>
		<div class="container">
			<div id="header">
				<div id="titleName">
					<a href="${pageContext.request.contextPath }./home.jsp"><img src="image/uow171491.png" id="uniIcon"/></a>
				</div>
        <div class="nav-left-menu">
          <ul class="nav navbar">
                <li class="nav-item active">
                  <a class="nav-link" href="${pageContext.request.contextPath }/home.jsp">Home</a>
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
						          </button>
                  </li>
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
		                    <li><a href="${pageContext.request.contextPath }/listUser.jsp">List</a></li>
		                    <li><a href="${pageContext.request.contextPath }/addUser.jsp">Add User</a><li>
		                    <li><a href="${pageContext.request.contextPath }/changeReputation.jsp">Change reputation factor</a></li>
		                </ul>
		            </div>
		        </div>
		        <div class="col-md-8">
		            <!-- Content Here -->
		        </div>
		    </div>
		    <div class="content top-space">
		    	<div id="add_user_container">
          <div class="loginmodal-container add_user_model">
            <h1>Add new user</h1><br>
              <form method="get" role="form" id="admin-add-user-form" autocomplete="off" action="${pageContext.request.contextPath }/user2/add.action" >
                  <div class="form-body">
                  <div class="form-group">
                    <div class="input-group input_box">
                      <div class="input-group-addon"><span class="glyphicon glyphicon-user"></span></div>
                      <input name="user2.userName" type="text" class="form-control input_box" placeholder="Username" style="margin-bottom: 0;">
                    </div>
                    <span class="help-block" id="error"></span>
                </div>
                <div class="form-group">
                          <div class="input-group input_box">
                            <div class="input-group-addon"><span class="glyphicon glyphicon-envelope"></span></div>
                              <input name="user2.email" type="text" class="form-control input_box" placeholder="Email" style="margin-bottom: 0;">
                            </div> 
                           <span class="help-block" id="error"></span>                     
                        </div>
                    <div class="form-group">
                          <div class="input-group input_box">
                            <div class="input-group-addon"><span class="glyphicon glyphicon-lock"></span></div>
                                <input name="user2.password" id="password" type="password" class="form-control input_box" placeholder="Password">
                            </div>  
                            <span class="help-block" id="error"></span>                      
                      </div>
                      <div class="form-group">
                            <div class="input-group input_box">
                              <div class="input-group-addon"><span class="glyphicon glyphicon-lock"></span></div>
                                <input name="cpassword" type="password" class="form-control input_box" placeholder="Confirm Password">
                              </div>  
                              <span class="help-block" id="error"></span>                         
                        </div>
                    <div class="form-group">
                  <label class="col-md-4 control-label"></label>
                  <div class="col-md-4">
                      <button type="submit" class="btn btn-warning" >Add <span class="glyphicon glyphicon-send"></span></button>
                  </div>
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
                    <li><a href="#">Â© 2016 Bug Overflow.</a></li>
                </ul>
            </div>
        </div>
    </div>
    <script src="assets/jquery.validate.min.js"></script>
    <script src="js/register.js"></script>
	</body>
</html>