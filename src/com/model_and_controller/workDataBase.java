package com.model_and_controller;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.Statement;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileItemFactory;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.apache.commons.fileupload.servlet.ServletRequestContext;




public class workDataBase extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		process(request,response);
		
	}
	private void process(HttpServletRequest request, HttpServletResponse response) {
		 	response.setCharacterEncoding("utf-8");
	        response.setContentType("application/json");
	        PrintWriter out = null;
	        FileItemFactory factory = new DiskFileItemFactory();
	        ServletFileUpload upload = new ServletFileUpload(factory);
	        upload.setHeaderEncoding("UTF-8");
	        upload.setHeaderEncoding(request.getCharacterEncoding());
//	        System.out.println(request.getParameter("year"));
//	        int year=Integer.parseInt(request.getParameter("year"));
//	        System.out.println(year);
//	        int month=Integer.parseInt(request.getParameter("month"));
//	        String area = request.getParameter("area");
	        int year=2017;
	        int month=2;
	        String area = "上海";
	        try {
	        	out = response.getWriter();
	            List<FileItem> list = upload.parseRequest(request);//改
	                FileItem item = list.get(3);
	                FileItem item2 = list.get(0);
	                InputStream is =item.getInputStream();
	                int w;
	                while((w =is.read())!=-1)
	                	System.out.println(w);
	                ExcelHelper helper = new ExcelHelper();
	                if (item.getName().endsWith(".xls")||item.getName().endsWith(".xlsx")) {
	                	List<WorkBean> worklist = helper.importXlsx(item.getInputStream());
	                	//调用数据库
	                	Connection conn =connDB.open();
	                	//将数据导入数据库
	                	Statement stat = conn.createStatement();
	                	for(int i=0;i<worklist.size();i++) {
	                		WorkBean work = worklist.get(i);
	                		String sql=new String("insert into workTbl(year,month,area,level,school,number,workid,workname,student1,student1Id,student2,student2id,student3,student3Id,teacher1,teacher1Id,teacher2,teacher2Id) values("+year+","+month+",'"+area+"','"+work.getLevel()+"','"+work.getSchool()+"','"+work.getNumber()+"','"+work.getWorkid()+"','"+work.getWorkname()+"','"+work.getStudent1()+"','"+work.getStudent1Id()+"','"+work.getStudent2()+"','"+work.getStudent2Id()+"','"+work.getStudent3()+"','"+work.getStudent3Id()+"','"+work.getTeacher1()+"','"+work.getTeacher1Id()+"','"+work.getTeacher2()+"','"+work.getTeacher2Id()+"');");
	                		stat.executeUpdate(sql);
	                	}
	                    out.write("{\"result\":\"OK\"}");
	                    System.out.println("导入成功");
	                } else {
	                    // 说明文件格式不符合要求
	                    out.write("{\"result\":\"Invalid\"}");
	                }
	        } catch (Exception e) {
	            e.printStackTrace();
	        }finally {
	        	out.flush();
	        	out.close();
	        }
	    }
}

