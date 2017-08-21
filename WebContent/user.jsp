<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>计算机大赛证书查询系统</title>
<link rel="stylesheet" type="text/css" href="usercss.css">
</head>
<body>
	<h1>证书查询系统</h1>
	<div>
		<p>
			<a href="login.jsp">管理员入口：</a>
		</p>
	</div>
	<div id="center">
		<div id="left">
			<form name="Info" id="Info" method="get"  onsubmit="return checkFormValid('info',2)">
				<div id="seach_box">
					<p>
						<label for="year">年份：</label>
						<input name="year" type="text">
					</p>
					<p>
						<label for="workid">作品编号：</label>
						<input name="workid" type="text">
					</p>
					<p>
						<label for="workname">作品名：</label>
						<input name="workname" type="text" id="nece">
					</p>
					<p>
						<label for="school">学校：</label>
						<input name="school" type="text" id="nece">
					</p>
					<p>
						<label for="student">学生1：</label>
						<input name="student1" type="text" id="student">
					</p>
					<p>
						<label for="student">学生2：</label>
						<input name="student2" type="text" id="student">
					</p>
					<p>
						<label for="student">学生3：</label>
						<input name="student3" type="text" id="student">
					</p>
					<p id="btn_search">
						<input type="submit" id="bt1" value="查询">
					</p>
				</div>
			</form>
		</div>
	</div>
	<div id="right">
		<table>
			<tr><th>查询结果：</th></tr>
			<tr><td>作品名称</td><td>奖项</td><td>赛区</td><td>获奖者</td><td>指导教师</td></tr>
			<tr><td></td><td></td><td></td><td></td><td></td></tr>
		</table>				
	</div>
</body>
</html>