<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- 引入struts2标签 -->
<%@ taglib uri="/struts-tags" prefix="s"%>
<!DOCTYPE html>
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
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<!-- 引入 Bootstrap -->
<link href="${pageContext.request.contextPath }/css/bootstrap.min.css"
	rel="stylesheet" type="text/css">

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
		$("#editor").focus(function() {
			if ($("#editor").html().trim() == "Short Description") {
				$("#editor").html("");
			}
		});
		$("#editor").blur(function() {
			if ($("#editor").html().trim() == "") {
				$("#editor").html("Short Description");
			}
		});
		
		$("#editor").keydown(function(){
			$("#voiceBtn").val($("#editor").html());
		});
		
	});
</script>
</head>
<body>
	<input id="path" type="hidden"
		value="${pageContext.request.contextPath }" />
	<div class="container">
		<div class="row">
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
		</div>

		<div class="row">
			<div class="col-md-8">
				<form method="post" action="${pageContext.request.contextPath }/bug/add.action">
				
				<div class="form-group ">
					<input type="text" class="form-control" id="bug.op_sys"  name="bug.op_sys"
						placeholder="Operation system,for example : All, MAC OS">
				</div>
				<div class="form-group ">
					<input type="text" class="form-control" id="cc"  name="cc"
						placeholder="cc list">
				</div>
				<div class="form-group ">
					<input type="text" class="form-control" id="bug.classification"  name="bug.classification"
						placeholder="classfication, example: client software">
				</div>
				<div class="form-group ">
					<input type="text" class="form-control" id="bug.product"  name="bug.product"
						placeholder="product,for example : firefox, chrome">
				</div>
				<div class="form-group ">
					<input type="text" class="form-control" id="bug.component"  name="bug.component"
						placeholder="component,for example : pdf viewer">
				</div>
				<div class="btn-toolbar" data-role="editor-toolbar"
					data-target="#editor">
					<div class="btn-group">
						<a class="btn" data-edit="bold" title="Bold (Ctrl/Cmd+B)"><i
							class="icon-bold"></i></a> <a class="btn" data-edit="italic"
							title="Italic (Ctrl/Cmd+I)"> <i class="icon-italic"></i>
						</a>

					</div>
					<div class="btn-group">
						<a class="btn dropdown-toggle" data-toggle="dropdown"
							title="Hyperlink"><i class="icon-link"></i></a>
						<div class="dropdown-menu input-append">
							<input class="span2" placeholder="URL" type="text"
								data-edit="createLink" />
							<button class="btn" type="button">Add</button>
						</div>
						<a class="btn" data-edit="unlink" title="Remove Hyperlink"><i
							class="icon-cut"></i></a>

					</div>
					<div class="btn-group">
						<a class="btn" data-edit="undo" title="Undo (Ctrl/Cmd+Z)"><i
							class="icon-undo"></i></a> <a class="btn" data-edit="redo"
							title="Redo (Ctrl/Cmd+Y)"><i class="icon-repeat"></i></a>
					</div>
					<input type="text" data-edit="inserttext" id="voiceBtn" name="bug.short_desc"
						x-webkit-speech="" />
				</div>

				<div id="editor" contenteditable="true">Short Description</div>

				<div class="form-group">
					<button type="submit" id="sub"
						class="btn btn-default drdropdown pull-left">submit</button>
				</div>
				</form>
			</div>
			<div class="col-md-3 ">
				<div class="jumbotron">
					<h3>Notice:</h3>
					<p style="font-size: 10px;">if you want to add <span style="color:RED;"> code </span>, please
						write between #code# and #/code#, like:</p>
					<p style="font-size: 10px; color: RED;">
						#code# <br /> .....(your code) <br /> #/code#
					</p>
					<p style="font-size: 10px;">
					if your want show you information like <code>undefined</code>, please write your question between #light# and #/light#. like
					</p>
					<p style="font-size: 10px; color: RED;">
						#light# <br /> .....(your code) <br /> #/light#
					</p>
				</div>
			</div>
		</div>
</body>
<script>
	$(function() {
		function initToolbarBootstrapBindings() {
			var fonts = [ 'Serif', 'Sans', 'Arial', 'Arial Black', 'Courier',
					'Courier New', 'Comic Sans MS', 'Helvetica', 'Impact',
					'Lucida Grande', 'Lucida Sans', 'Tahoma', 'Times',
					'Times New Roman', 'Verdana' ], fontTarget = $(
					'[title=Font]').siblings('.dropdown-menu');
			$
					.each(
							fonts,
							function(idx, fontName) {
								fontTarget
										.append($('<li><a data-edit="fontName ' + fontName +'" style="font-family:\''+ fontName +'\'">'
												+ fontName + '</a></li>'));
							});
			$('a[title]').tooltip({
				container : 'body'
			});
			$('.dropdown-menu input').click(function() {
				return false;
			}).change(
					function() {
						$(this).parent('.dropdown-menu').siblings(
								'.dropdown-toggle').dropdown('toggle');
					}).keydown('esc', function() {
				this.value = '';
				$(this).change();
			});

			$('[data-role=magic-overlay]').each(
					function() {
						var overlay = $(this), target = $(overlay
								.data('target'));
						overlay.css('opacity', 0).css('position', 'absolute')
								.offset(target.offset()).width(
										target.outerWidth()).height(
										target.outerHeight());
					});
			if ("onwebkitspeechchange" in document.createElement("input")) {
				var editorOffset = $('#editor').offset();
				$('#voiceBtn').css('position', 'absolute').offset({
					top : editorOffset.top,
					left : editorOffset.left + $('#editor').innerWidth() - 35
				});
			} else {
				$('#voiceBtn').hide();
			}
		}
		;
		function showErrorAlert(reason, detail) {
			var msg = '';
			if (reason === 'unsupported-file-type') {
				msg = "Unsupported format " + detail;
			} else {
				console.log("error uploading file", reason, detail);
			}
			$(
					'<div class="alert"> <button type="button" class="close" data-dismiss="alert">&times;</button>'
							+ '<strong>File upload error</strong> '
							+ msg
							+ ' </div>').prependTo('#alerts');
		}
		;
		initToolbarBootstrapBindings();
		$('#editor').wysiwyg({
			fileUploadError : showErrorAlert
		});
		window.prettyPrint && prettyPrint();
	});
</script>
</html>
