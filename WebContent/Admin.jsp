<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript" src="js/jquery-3.2.1.min.js"></script>
<script type="text/javascript"src="js/jquery.form.js"></script>
<script type="text/javascript" >
$(function() {
    $("#file_form").submit(
            function() {
                //首先验证文件格式
                var fileName = $('#file_input').val();
                if (fileName === '') {
                    alert('请选择文件');
                    return false;
                }
                var fileType = (fileName.substring(fileName
                        .lastIndexOf(".") + 1, fileName.length))
                        .toLowerCase();
                if (fileType !== 'xls') {
                    alert('文件格式不正确，.xsl文件！');
                    return false;
                }

                $("#file_form").ajaxSubmit({
                    dataType : "json",
                    clearForm : true,
                    success : function(data) {
                        if (data['result'] === 'OK') {
                            alert('上传文件成功');
                        } else {
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
		<input type="text"  placeholder="请输入年份" name="year">
		<input type="text"  placeholder="请输入月份" name="month">
		<input type="text"  placeholder="请输入赛区" name="area">
		<input type="file" name="excel" id="file_input" >
		<input type="submit" value="导入">
	</form>
</body>
</html>