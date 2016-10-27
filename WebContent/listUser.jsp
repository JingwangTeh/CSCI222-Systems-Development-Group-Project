<html>
<head>
	<link type="text/css" rel="stylesheet" href="css/style.css" />
	<link type="text/css" rel="stylesheet" href="css/popout_form_style.css" />
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
  	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  	<link type="text/css" rel="stylesheet" href="css/font-awesome.min.css" />
  	<script src="js/script.js">
	</script>
  	<script type="text/javascript">
  	 $(document).ready(function(){
			var path = $("#path").val();
			$.ajax({  
	           url:path+'/user2/list.action',  
	           type:'POST',  
	           data:"",  
	           dataType:'json',  
	           success:function (data) {
	           	$(data).each(function (i, value) {  
	           		$("#tbody").append(
	           	 "<tr>"+
			      "<th scope=\"row\"><a href=\"#\">"+value.userName+"</a></th>"+
			      "<td>"+value.role+"</td>"+
			      "<td>"+value.email+"</td>"+
			      
			      "<td><a href=\"${pageContext.request.contextPath }/modify.jsp?userid="+value.id+"\">"+ "Modify"+"</td>"+
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
						</button></li>
	                </ul>
	            </nav>
			</div>
			<div class="row left-menu">
		         <div class="col-md-4">
		            <!-- It can be fixed with bootstrap affix http://getbootstrap.com/javascript/#affix-->
		            <div id="sidebar" class="well sidebar-nav">
		                <h5><i class="glyphicon glyphicon-user"></i>
		                    <small><b>Dashboard</b></small>
		                </h5>
		                <ul class="nav nav-pills nav-stacked">
		                    <li><a href="${pageContext.request.contextPath }/listUser.jsp">List</a></li>
		                    <li><a href="${pageContext.request.contextPath }/addUser.jsp">Add User</a><li>
		                    <li><a href="#">Change reputation factor</a></li>
		                </ul>
		            </div>
		        </div>
		        <div class="col-md-8">
		            <!-- Content Here -->
		        </div>
		    </div>
		    <div class="content top-space">
		    	<div class="form-group pull-left">
   					 <input type="text" class="search form-control" placeholder="What you looking for?">
				</div>
				<span class="counter pull-right"></span>
				<table class="table table-hover table-bordered results user-list">
				  <thead>
				    <tr>
				      <th class="col-md-5 col-xs-5 user-name">User name</th>
				      <th class="col-md-4 col-xs-4 user-type">Role</th>
				      <th class="col-md-3 col-xs-3">Creation date</th>
				      <th class="col-md-3 col-xs-3">Modify user detail</th>
				    </tr>
				    <tr class="warning no-result">
				      <td colspan="4"><i class="fa fa-warning"></i> No result</td>
				    </tr>
				  </thead>
				  <tbody id="tbody">
				  </tbody>
				</table>
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