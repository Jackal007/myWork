<%@ page language="java" import="java.util.*" pageEncoding="GBK"%>
<html>
<head>
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1.0, user-scalable=no">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>ͼ��ݹ���ϵͳ��¼</title>
<!------------------------------------------------css-------------------------------------------->
<link rel="stylesheet" type="text/css" href="css/default.css">
<link rel="stylesheet" href="css/login/materialize.min.css">
<link rel="stylesheet" type="text/css" href="css/normalize.css" />
<link href='http://fonts.useso.com/css?family=Lato:400' rel='stylesheet'
	type='text/css'>
<link rel="stylesheet" type="text/css" href="css/reader-or-admin.css" />
<style type="text/css">
html, body {
	height: 100%;
}
html {
	display: table;
	margin: auto;
}
body {
	display: table-cell;
	vertical-align: middle;
}
.margin {
	margin: 0 !important;
}
</style>
</head>
<body class="green">
	<div id="login-page" class="row">
		<div class="col s12 z-depth-6 card-panel">
			<form class="login-form" action="������.jsp" method="post"  onsubmit=" return validate(this)" name="login">
				<!------------------------head----------------------------->
				<div class="row">
					<div class="input-field col s12 center">
						<img src="img/ͷ��.jpg" alt="��ӭʹ�ñ�ϵͳ"
							class="responsive-img valign profile-image-login">
						<p class="center login-form-text">ͼ���</p>
					</div>
				</div>
				<!------------------------head----------------------------->
				<!------------------------id----------------------------->
				<div class="row margin">
					<div class="input-field col s12">
						<i class="mdi-social-person-outline prefix"></i> 
						<input class="validate"  name="userid" type="text"> 
						<label for="email" class="center-align">�û���</label>
					</div>
				</div>
				<!------------------------id----------------------------->
				<!------------------------password----------------------------->
				<div class="row margin">
					<div class="input-field col s12">
						<i class="mdi-action-lock-outline prefix"></i> 
						<input  type="password" name="password"> 
						<label for="password">����</label>
					</div>
				</div>
				<!------------------------password----------------------------->
				<!------------------------reader-or-admin----------------------------->
				<div class="row">
					<div class="input-field col s12 m12 l12  login-text">
						<select class="segment-select"  name="readeroradmin">
							<option value="����">����</option>
							<option value="����Ա">����Ա</option>
						</select>
					</div>
				</div>
				<!------------------------reader-or-admin----------------------------->
				<!------------------------login----------------------------->
				<div class="row">
					<div class="input-field col s12">
						<a href="javascript:document.login.submit();" class="btn waves-effect waves-light col s12">
						����
						</a>
					</div>
				</div>
				<!------------------------login----------------------------->
			</form>
		</div>
	</div>
</body>
<!------------------------------------------------js-------------------------------------------->

<script type="text/javascript">
    	function validate(thisform) {
		with (thisform) {
			if (userid.value == "" || userid.value == null) {
				userid.focus();
				alert("�û�������Ϊ��");
				return false;
			}
			if (password.value == "" || password.value == null) {
				password.focus();
				alert("����������Ϊ��");
				return false;
			}
		}
	}
</script>
<script type="text/javascript"
	src="http://libs.useso.com/js/jquery/1.11.0/jquery.min.js"></script>
<script>window.jQuery || document.write('<script src="js/jquery-2.1.1.min.js"><\/script>')</script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/materialize/0.97.1/js/materialize.min.js"></script>
<script src="http://libs.useso.com/js/jquery/1.11.0/jquery.min.js"></script>
<script type="text/javascript" src="js/reader-or-admin.js"></script>
<script type="text/javascript">jQuery(function($) {
      $(".segment-select").Segment();
    });</script>
</html>