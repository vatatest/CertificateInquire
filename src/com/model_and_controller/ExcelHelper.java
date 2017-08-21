package com.model_and_controller;

import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.List;

import jxl.Sheet;
import jxl.Workbook;
import jxl.read.biff.BiffException;

public class ExcelHelper {

	public List<WorkBean> importXlsx(InputStream is) {
		Workbook wb=null;
		List<WorkBean> list = new ArrayList<WorkBean>();
		try {
			wb = Workbook.getWorkbook(is);
			Sheet sheet = wb.getSheet(0);
			for(int i=1;i<sheet.getRows();i++) {
				WorkBean work = new WorkBean();
				work.setLevel(sheet.getCell(0, i).getContents());
				work.setSchool(sheet.getCell(1, i).getContents());
				work.setWorkid(sheet.getCell(2, i).getContents());
				work.setWorkname(sheet.getCell(3, i).getContents());
				work.setStudent1(sheet.getCell(4, i).getContents());
				work.setStudent1Id(sheet.getCell(5, i).getContents());
				work.setStudent2(sheet.getCell(6, i).getContents());
				work.setStudent2Id(sheet.getCell(7, i).getContents());
				work.setStudent3(sheet.getCell(8, i).getContents());
				work.setStudent3Id(sheet.getCell(9, i).getContents());
				work.setTeacher1(sheet.getCell(10, i).getContents());
				work.setTeacher1Id(sheet.getCell(11, i).getContents());
				work.setTeacher2(sheet.getCell(12, i).getContents());
				work.setTeacher2Id(sheet.getCell(13, i).getContents());
				list.add(work);
			}
			return list;
		} catch (BiffException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		return null;
	}
}
