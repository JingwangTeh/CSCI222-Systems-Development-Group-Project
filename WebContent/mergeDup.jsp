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
		    <div class="content top-space">
			    <div>
			    	<div>
			  			<div class="">
			  			
			    			<table class="table assign_table">
			    			<h3>Need assigned bug list</h3>
			          			<thead>
			            			<tr>
			              				<th>Title </th>
			              				<th>short Description</th>
			              				<th>short Description</th>
			           				</tr>
			          			</thead>
			          			<tbody id="tBody">
			          			</tbody>
			        		</table>   
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