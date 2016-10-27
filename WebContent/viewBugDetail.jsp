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
	<script type="text/javascript">
  	 $(document).ready(function(){
			var path = $("#path").val();
			$.ajax({  
	           url:path+'/comments/viewComments.action',  
	           type:'POST',  
	           data:"",  
	           dataType:'json',  
	           success:function (data) {
	           	$(data).each(function (i, value) { 
	           		alert("1");
	           		$("#tBody").append(	           		
	           		"<h4>"+value.thetext+"</h4>"
	           	 	);
	           }); 
	           }
	           
	       }); 
	 });
 	</script>
<title>BugTrack</title>
</head>
	<body>
	<input id="path" type="hidden"
		value="${pageContext.request.contextPath }" />
		<div class="container">
			<div id="header">
				<div id="titleName">
					<a href="./home.html"><img src="image/uow171491.png" id="uniIcon"/></a>
				</div>
				<nav>
	                <ul>
	                    <li><a href="#" id="user_name">
	                    	Developer01</a></li>
	                    <li><button type="button" class="btn btn-logout">
  							<span class="glyphicon glyphicon-log-out" aria-hidden="true"></span>
						</button></li>
	                </ul>
	            </nav>
			</div>
			<div class="modal fade" id="signup-modal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" style="display: none;">
		    	<div class="modal-dialog">
					<div class="loginmodal-container">
						<h1>Sign up</h1><br>
					  	<form>
							<input type="text" name="user" id="signup_user_name" placeholder="Username">
							<input type="text" name="email" id="signup_email" placeholder="Email address">
							<input type="password" name="pass" id="signup_password" placeholder="Password">
							<input type="password" name="cpass" id="signup_c_password" placeholder="Comfirm password">
							<input type="submit" name="Signup" class="login loginmodal-submit" value="Signup">
					  	</form>
					</div>
				</div>
			</div>

			<div class="row left-menu-user">
		        <div class="col-md-4">
		            <!-- It can be fixed with bootstrap affix http://getbootstrap.com/javascript/#affix-->
		            <div id="sidebar" class="well sidebar-nav">
		                <ul class="nav nav-pills nav-stacked">
		                    <li><a href="#">Home</a></li> <!--class="active" with hightlight it-->
		                    <li><a href="#">Report bug</a></li>
		                </ul>
		                <h5><i class="glyphicon glyphicon-inbox"></i>
		                    <small><b>WORK</b></small>
		                </h5>
		                <ul class="nav nav-pills nav-stacked">
		                    <li><a href="#">Bug received</a></li>
		                </ul>
		            </div>
		        </div>
		        
		        <div class="col-md-4">
		            <!-- Content Here -->
		        </div>
		        <div class="col-md-4">
		            <!-- Content Here -->
		        </div>
		    </div>
		    <div class="content">
				<div class="post-control col-lg-8">

                <!-- Blog Post -->

	                <!-- Title -->
	                <h1>Bug ID: ${bug.bug_id}</h1>

	                <!-- Author -->
	              	<p class="lead">
	                   by <a href="#">${bug.reporter}</a>
	                </p>

	                <hr>

	                <!-- Date/Time -->
	                <p><span class="glyphicon glyphicon-time"></span> Posted on ${bug.creation_ts }</p>

	                <!-- Preview Image -->
	                <!--<img class="img-responsive" src="http://placehold.it/900x300" alt="">-->

	                <!-- Post Content -->
	                <hr>
	                <p class="lead">Short Description:
	                <a href="#"> ${bug.short_desc}</a>
	                </p>
	                </hr>
	                <hr>

						<p class="lead">
	                   Status: <a href="#">${bug.resolution}</a>
	                </p>

	                <hr>
	                	<p class="lead">
	                   CC list: <a href="#">${bug.cc}</a>
	                </p>

	                <hr>
	                	<p class="lead">
	                   Operation system: <a href="#">${bug.op_sys}</a>
	                </p>

	                <hr>
	                <!-- Blog Comments -->

	                <!-- Comments Form -->
	                <div class="well post-submit-comment-control">
	                    <h4>Leave a Comment:</h4>
	                    <form role="form" action="${pageContext.request.contextPath }/comments/add.action">
	                        <div class="form-group">
	                        	<input name="comments.bug_id" value="${bug.bug_id}" type="hidden" />
	                            <textarea class="form-control" name="comments.thetext" rows="3"></textarea>
	                        </div>
	                        <button type="submit" class="btn btn-primary">Submit</button>
	                    </form>
	                </div>

	                <hr>

	                <!-- Posted Comments -->

	                <!-- Comment -->
	                <div class="media" id="tBody">
	                </div>

	                <!-- Comment -->
	                <%-- <div class="media" id="body">
	                    <a class="pull-left" href="#">
	                        <img class="media-object" src="http://placehold.it/64x64" alt="">
	                    </a>
	                    <div class="media-body">
	                        <h4 class="media-heading">user name
	                            <small>August 25, 2014 at 9:30 PM</small>
	                        </h4>
	                        This is the comment section. This is the comment section. 
	                        <!-- Nested Comment -->
	                        <div class="media">
	                            <a class="pull-left" href="#">
	                                <img class="media-object" src="http://placehold.it/64x64" alt="">
	                            </a>
	                            <div class="media-body">
	                                <h4 class="media-heading">Nested Start Bootstrap
	                                    <small>August 25, 2014 at 9:30 PM</small>
	                                </h4>
	                                Replay comment. (If we have)
	                            </div>
	                        </div>
	                        <!-- End Nested Comment -->
	                    </div>
	                </div> --%>

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