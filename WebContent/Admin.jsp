<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript" src="js/jquery-3.2.1.min.js"></script>
<script type="text/javascript"src="js/jquery.form.js"></script>
<script type="text/javascript" >
$(document).ready(function() {
	 $("#file_form").submit(function(){
		var filename = $("#file_input").val();
 	  	if(filename == ''){
 	  		alert("请选择文件");
 	  		return false;
 	  	}
 	  	var filetype = (filename.substring(filename.lastIndexOf(".")+1,filename.length)).toLowerCase();
 	  	if(filetype != 'xls'){
 	  		alert('文件格式不正确，请选择.xsl文件！');
 	  		return false;
 	  	}
 	  	
 	   $("#file_form").ajaxSubmit({
           dataType : "json",
           resetForm : true,
           success : function(data) {
               if (data['result'] === 'OK') {
                   alert('上传文件成功');
               } 
               else {
                   alert('文件格式错误');
               }
               return false;
           }
       }); 
		return false;
	 });
});
</script>
<title>管理员界面</title>
</head>
<body>
	<form action="workDataBase" enctype="multipart/form-data" method="post" id="file_form">
		<select name="year" id="year" placeholder="年份">
			<option value="2017">2017</option>
			<option value="2016">2016</option>
		</select>
		<select name="month" id="month">
			<option value="12">12</option>
			<option value="11">11</option>
		</select>
		<select name="area" id="month">
			<option value="上海">上海</option>
			<option value="北京">北京</option>
		</select>
		<input type="file" name="excel" id="file_input" >
		<input type="submit" value="导入">
	</form>
</body>
</html>