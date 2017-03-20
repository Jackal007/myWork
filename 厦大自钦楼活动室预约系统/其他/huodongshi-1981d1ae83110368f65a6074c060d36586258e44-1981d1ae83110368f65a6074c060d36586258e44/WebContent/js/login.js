// JavaScript Document

function checkForm_Login(){
	
	var username = document.getElementById("username").value;
	var password = document.getElementById("password").value;
	if(username == ""){
		sweetAlert("error...","登陆账号不能为空","error");
		return false;
	}else if(password == ""){
		sweetAlert("error...","登陆密码不能为空","error");
		return false;
	}
	/*var optionsRadios = document.getElementByName("optionsRadios");
	var radiovalue;
	for(var i = 0;i<optionsRadios.length;i++){
		if(optionsRadios[i].checked){
			radiovalue = optionsRadios[i].value;
		}
	}
	sweetAlert(radiovalue,radiovalue,"error");
	if(radiovalue == "user"){
		//管理员登陆
		document.getElementById("login_form").action="./AdminLogin";
	}else if(radiovalue == "admin"){
		document.getElementById("login_form").action="#";
	}*/
	
	return true;
}