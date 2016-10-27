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
  	<script src="https://cdn.datatables.net/1.10.12/js/jquery.dataTables.min.js"></script>
  	<script src="https://cdn.datatables.net/1.10.12/js/dataTables.bootstrap.min.js"></script>
  	<script src="http://s.codepen.io/assets/libs/modernizr.js" type="text/javascript"></script>
  	<script src="js/script.js"></script>
  	<script type="text/javascript">
  	 $(document).ready(function(){
			var path = $("#path").val();
			$.ajax({  
	           url:path+'/bug/viewDupBug.action',  
	           type:'POST',  
	           data:"",  
	           dataType:'json',  
	           success:function (data) {
	           	$(data.bugs).each(function (i, value) {  
	           		$("#tBody").append(
	           	 "<tr>"+
	           	"<th scope=\"row\"><a href=\""+path+"/bug/scan.action?bug.bug_id="+value.bug_id+"\">"+value.bug_id+"</a></th>"+
			      "<td>"+value.short_desc+"</td>"+
			      "<td>"+value.resolution+"</td>"+
			      "<td><a href=\""+path+"/bug/merge.action?bug.bug_id="+value.bug_id+"\">"+ "Merge"+"</td>"+
			      "</tr>");
	           }); 
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
					<a href="./home.html"><img src="image/uow171491.png" id="uniIcon"/></a>
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
	                    	Triager</a></li>
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
		    </div>
		    <div class="content top-space">
		    	<div class="row">
			        <div class="col-xs-12 col-sm-12 col-md-6 col-lg-6 col-xs-offset-0 col-sm-offset-0 col-md-offset-3 col-lg-offset-3 toppad user-profile-control" >
			          	<div class="panel panel-info">
				            <div class="panel-heading">
				              <h3 class="panel-title">${user2.userName}</h3>
				            </div>
				            <div class="panel-body">
				              <div class="row">
				                <div class="col-md-3 col-lg-3 " align="center"> <img alt="User Pic" src="http://lorempixel.com/200/200/people/9/" class="img-circle img-responsive"> </div>

				                <div class=" col-md-9 col-lg-9 "> 
				                  <table class="table table-user-information">
				                    <tbody>
				                  	<tr>
				                        <td>Role:</td>
				                        <td>${user2.role}</td>
				                  	</tr>
				                  	<tr>
				                        <td>Created date:</td>
				                        <td>23/06/2013</td>
				                  	</tr>
				                  	<tr>
				                        <td>Email:</td>
				                        <td><a href="mailto:info@support.com">${use2.email}</a></td>
				                    </tr>
				                    <tr>
				                        <td>Reputation:</td>
				                        <td>134</td>
				                    </tr>
				                    </tbody>
				                  </table>
				                </div>
				              </div>
				            </div>
					        <div class="panel-footer profile-footer">
				                <span class="pull-right">
				                    <a href="${pageContext.request.contextPath }/editProfile.jsp" data-original-title="Edit this user" data-toggle="tooltip" type="button" class="btn btn-sm btn-warning"><i class="glyphicon glyphicon-edit"></i></a>
				                </span>
				        	</div>
			          	</div>
			        </div>
			    </div>
			    <div>
			    	<div>
			  			<div class="">
			  			 
				      	</div>
			      		<div class="col-md-12 text-center">
				      		<div class="page-nation">
				                <ul class="pagination pagination-large" id="myPager"/></ul>
				            </div>
			      		</div>
					</div>
			    </div>
		    </div>
		</div>
	</body>
</html>