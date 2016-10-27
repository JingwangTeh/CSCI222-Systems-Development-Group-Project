<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<!DOCTYPE html>
<html>
<head>

<title>FQA</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<!-- 引入 Bootstrap -->
<link href="${pageContext.request.contextPath }/css/bootstrap.min.css"
	rel="stylesheet" type="text/css">
<!-- jQuery (Bootstrap 的 JavaScript 插件需要引入 jQuery) -->
<script src="${pageContext.request.contextPath }/js/jquery.js"></script>
<!-- 包括所有已编译的插件 -->
<script src="${pageContext.request.contextPath }/js/bootstrap.min.js"></script>

<link
	href="${pageContext.request.contextPath }/external/google-code-prettify/prettify.css"
	rel="stylesheet">
<link
	href="http://netdna.bootstrapcdn.com/twitter-bootstrap/2.3.1/css/bootstrap-responsive.min.css"
	rel="stylesheet">
<link
	href="http://netdna.bootstrapcdn.com/font-awesome/3.0.2/css/font-awesome.css"
	rel="stylesheet">
<link href="${pageContext.request.contextPath }/css/index.css"
	rel="stylesheet">
<script
	src="${pageContext.request.contextPath }/external/jquery.hotkeys.js"></script>
<script
	src="${pageContext.request.contextPath }/external/google-code-prettify/prettify.js"></script>
<script
	src="${pageContext.request.contextPath }/js/bootstrap-wysiwyg.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		$(function(){
			if($("#userId").val()=="" || null ==$("#userId").val()){
				alert("please login in at first");
				window.location = "index.jsp";
			}
			$.ajax({  
		            url:$("#path").val()+'/user/more.action?currentPage=0',  
		            type:'POST',  
		            data:"",  
		            dataType:'json',  
		            success:function (data) {
		            	$(data).each(function (i, value) {
		            		if(i==0){
		            			var htmlValForQ  ="";
		            			$(value).each(function (j, val){
		            				htmlValForQ = htmlValForQ+"<tr><td><a href='"+$("#path").val()+"/question/scan.action?question.id="+val.id+"'>"+val.title+"</a></td><td>"+val.creationDate+"</td></tr>";
		            			});
	            				$("#questionContent").html(htmlValForQ);
		            			
		            		}
		            		if(i==1){
		            			var htmlValForA  ="";
		            			$(value).each(function (j, val){
		            				htmlValForA = htmlValForA+"<tr><td><a href='"+$("#path").val()+"/question/scan.action?question.id="+val.id+"'>"+val.title+"</a></td><td>"+val.creationDate+"</td></tr>";
		            			});
	            				$("#answerContent").html(htmlValForA);
		            		}
		            	
		            	});  
		            } 
		        });
		});
		$("#edit").click(function(){
			$("input").removeAttr("readonly");
			$("input").css("border", "1px solid black");
			$("#save").removeClass("hidden");
			$("#undo").removeClass("hidden");
		});
		$("#undo").click(function(){
			$("input").attr("readonly");
			$("input").css("border", "0px solid black");
			$("#save").addClass("hidden");
			$("#undo").addClass("hidden");
		});
		$("#lquestion").click(function(){
			$(this).addClass("active");
			$("#lanswer").removeClass("active");
			$("#linformation").removeClass("active");
			$("#answerTable").addClass("hidden");
			$("#informationTable").addClass("hidden");
			$("#questionTable").removeClass("hidden");
		});
		$("#lanswer").click(function(){
			$(this).addClass("active");
			$("#lquestion").removeClass("active");
			$("#linformation").removeClass("active");
			$("#answerTable").removeClass("hidden");
			$("#informationTable").addClass("hidden");
			$("#questionTable").addClass("hidden");
		});	
		$("#linformation").click(function(){
			$(this).addClass("active");
			$("#lanswer").removeClass("active");
			$("#lquestion").removeClass("active");
			$("#answerTable").addClass("hidden");
			$("#informationTable").removeClass("hidden");
			$("#questionTable").addClass("hidden");
		});
	});
</script>

  </head>
   <body>
   <input id="path" type="hidden"
		value="${pageContext.request.contextPath }" />
   <input id="currentPage" type="hidden"
		value="0" />
   <input id="userId" type="hidden" value="${user.id}">
   <div class="container">
   <div class="row">
			<div class="col-md-12">
				<ul id="headnav" class="nav nav-pills">
					<li class="active"><a href="index.jsp">LOGO</a></li>
					<form class="form-search navbar-left drdropdown pull-right" action="${pageContext.request.contextPath }/question/search.action">
						<input class="input-medium search-query" type="text"
							placeholder="Search  U Want" name='question.body' />
						<button type="submit" class="btn btn-primary" id="but1">
							<span class="glyphicon glyphicon-search"></span>SEARCH
						</button>
					</form>
					<s:if test="#session.user==null">
						<li class="drdropdown pull-right"><a href="#"
							data-toggle="modal" data-target="#myModal">log in</a></li>
						<li class="drdropdown pull-right"><a href="#"
							data-toggle="modal" data-target="#registModal">sign up</a></li>
						<li class="drdropdown pull-right"><a href="#"> help </a></li>
					</s:if>
					<s:if test="#session.user!=null">
						<li class="dropdown pull-right"><a class="dropdown-toggle"
							data-toggle="dropdown" href="#"> ${user.displayName } <span
								class="caret "></span><span class="badge ">2</span>
						</a>
							<ul class="dropdown-menu">
								<li><a href="${pageContext.request.contextPath }/user/detail.action">SETTING</a></li>
								<li class="divider"></li>
								<li><a
									href="${pageContext.request.contextPath }/user/logout.action">EXIT</a></li>
							</ul></li>
					</s:if>
				</ul>
			</div>
		</div> 
     <div class="row">
	 	<div class="col-md-3">	
 	    <img src="img/user_1.jpg" 
   			class="img-circle">
        
        </div>
        <div class="col-md-6">	
 	    
        <h1>Name: ${user.displayName }</h1>        
  
        
        </div>
        
        
        <div class="col-md-3">

        
        
        </div>
     </div>
      <div class="row">
	 	<div class="col-md-3">
        <ul class="nav nav-pills nav-stacked">
           <li class="active" id="linformation"><a href="#">My information</a></li>
           <li id="lanswer"><a href="#">My answer</a></li>
           <li id="lquestion"><a href="#">My question</a></li>
		</ul>
        
        </div>
        
        <div class="col-md-6">
        
        <div class="panel panel-default" id="informationTable">
           <div class="panel-heading">
              <h3 class="panel-title">
                 User information
              </h3>
           </div>
           <div class="panel-body">
           
  
		<form action="${pageContext.request.contextPath }/user/update.action" >
           <table class="table">
							<tr>
							<td><B>displayName</B></td>
              <td><input type="text" name="displayName" readonly="readonly" style="border: 0px;" value="${user.displayName }"/></td>
							</tr>
							<tr>
							
							<tr>
							<td><B>age</B></td>
              <td><input type="text" name="age" readonly="readonly" style="border: 0px;" value="${user.age }"/></td>
							</tr>
							<tr>
			                
							<td><B>email</B></td>
              <td>${user.email}</td>
							</tr>
							<tr>
							<tr>
			                
							<td><B>password</B></td>
              <td><input type="text" name="password" readonly="readonly" style="border: 0px;" value="********"/></td>
							</tr>
							<tr>
			  <td><B>creation date</B></td>
              <td>${user.creationDate}</td>
							</tr>
							<tr>
			  <td colspan="2">
			  <button type="button" class="btn btn-success btn-xs" style="float: right;" aria-label="Left Align"
												id="edit" >
												<span class="glyphicon glyphicon glyphicon-pencil"
													aria-hidden="true"></span></button>
			  <button type="submit" class="btn btn-success btn-xs hidden" style="float: right;" aria-label="Left Align"
												id="save" >
												save</button>
			 <button type="button" class="btn btn-success btn-xs hidden" style="float: right;" aria-label="Left Align"
												id="undo" >
												undo</button></td>
							</tr>
							
           </table>        
         </form>
           
              <div class="panel panel-info">
              <div class="panel-heading">
                 <h4 class="panel-title">
                    <a data-toggle="collapse" data-parent="#accordion" 
                       href="#collapseFour">
                       <span class ="glyphicon glyphicon-user">-Q&A information-</span>
                    </a>
                 </h4>
              </div>
              <div id="collapseFour" class="panel-collapse collapse">
                 <div class="panel-body">
                    <table class="table">
                      <tr>
				      	<th>View</th>
					  	<th>Question Count</th>
					  	<th>Up vote</th>
					  	<th>Down vote</th>
					  </tr>
					  <tr>
						  <td>${user.view }</td>
						  <td>${user.questionCount }</td>
						  <td>${user.upVote }</td>
						  <td>${user.downVote }</td>
					  </tr>
				   </table>
                 </div>
              </div>
           </div>
        </div>
                   
              
           </div>
           	
            <div class="panel panel-default hidden" id="questionTable">
           <div class="panel-heading">
              <h3 class="panel-title">
                 Question
              </h3>
           </div>
           <div class="panel-body">	
           
           <table class="table" id="questionContent" >
		
           <thead>
              <tr>
                 <th>Question</th>
                 <th><span class="glyphicon glyphicon-time">Time</span></th>
              </tr>
           </thead>
           <tbody id="questionTbody">
           

           </tbody>
        </table>
        </div>
        </div>
          <div class="panel panel-default hidden" id="answerTable" >
           <div class="panel-heading">
              <h3 class="panel-title">
                 Answer
              </h3>
           </div>
           <div class="panel-body">	
        <table class="table" id="answerContent">

           <thead>
              <tr>
                 <th>Question</th>
                 <th><span class="glyphicon glyphicon-time">Time</span></th>
              </tr>
           </thead>
           <tbody id="answerTbody">


           </tbody>
        </table>
           </div>
           </div>
           
        </div>

        
        
        <div class="col-md-3">
        
        
        
        
        </div>
     </div> 
     <div class="row">
     <div class="col-md-12">
            
     <table class="table table-striped">
       
       <thead>
          <tr>
             <th>about our website</th>
             <th>coordination and cooperation</th>
             <th>useful links</th>
             <th>subscribe us</th>
             <th>others</th>
             
          </tr>
       </thead>
       <tbody>
          <tr>
             <td><a href="#">about us</a></td>
             <td><a href="#">contact us</a></td>
             <td><a href="#">google</a></td>
             <td><a href="#">Github</a></td>
             <td><a href="#">DUANG</a></td>
          </tr>
          <tr>
    
             <td><a href="#">join us</a></td>
             <td><a href="#">help center</a></td>
             <td><a href="#">University of Wollongong</a></td>
             <td><a href="#">Facebook</a></td>
    
          </tr>
          <tr>
    
             <td><a href="#">Prestige and authority</a></td>
             <td><a href="#">our partner</a></td>
             <td><a href="#">TeamLog</a></td>
          </tr>
       </tbody>
    </table>
            </div>
         </div>

</div> 

	


   </body>
</html>
