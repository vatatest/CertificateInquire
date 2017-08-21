<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="js/jquery-3.2.1.min.js"></script>
<script type="text/javascript" src="js/jquery.form.js"></script>
<script>
 
            function test() {
            	var username = $("#username").val();
            	var password = $("#password").val();
            	var ispass = true;
            	if(username ==""){
            		alert("请输入用户名");
            		return false;
            	}
            	if(password ==""){
            		alert("请输入密码")
            		return false;
            	}
                $("#login_form").ajaxSubmit({
                    dataType : "json",
                    clearForm : true,
                    success : function(data) {
                        if (data['result'] === 'false') {
                            alert('用户名或密码错误');
                            ispass=false;
                        }
                        else {
                        	
                        }
                    }
                });
                return ispass;
            });

</script>
<link href="bootstrap/css/bootstrap.min.css" rel="stylesheet">
<script type="text/javascript" src="js/bootstrap.min.js"></script>
</head>
	<body>
		<form action="login" method="post" id="login_form" onsubmit="return test()">
			<div class="container">
				<div class="row" >
					<div class="col-md-4">
					</div>
					<div class="col-md-4  col-sm-6 col-xs-12">
						<div class="input-group">
							<span class="input-group-addon">
								<span class="glyphicon glyphicon-user"></span>
							</span>
							<input type="text" class="form-control" placeholder="用户名" name="username" id="username">
							<span id="err"></span>
						</div>
					</div>
				</div>
					<div class="input-group">
						<span class="input-group-addon"></span>
						<input type="text" class="form-control" placeholder="密码" name="password" id="password">
					</div>
					<div class="pull-right">
						<input type="submit" class="btn btn-primary" value="登录">
					</div>
			</div>
		</form>
	</body>





















<%-- <% String message = (String)(request.getAttribute("message")); %> --%>
<!-- <body> -->
<!-- 	<form action="login" method="post"> -->
<!-- 		<table border="1" style="border-collapse:collapse;"> -->
<!--             <tr align = "center"> -->
</html>