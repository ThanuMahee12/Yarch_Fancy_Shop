package com.Model.Report;

import com.Dao.Dao;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;

import java.io.FileOutputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;

public class ExcelReportGenerator extends ReportGenerator {
    String filename;
    String[][] list;
    Workbook workbook;
    Sheet sheet;
    public ExcelReportGenerator() {
        workbook = new XSSFWorkbook();
        sheet = workbook.createSheet(String.valueOf(Math.random()*100));
        filename=(Math.random()*Math.random()*100)+".xlsx";
    }


    @Override
    protected boolean prepareData(String bookid, Dao dao) {
        boolean rd=false;
        try {
            Connection connection=dao.getConnection();
            Statement statement=connection.createStatement();
            ResultSet rs=statement.executeQuery("select * from book");
            list=new String[2][6];
            list[0][0]="BookId";
            list[0][1]="ProductName";
            list[0][2]="url";
            list[0][3]="count";
            list[0][4]="Date";
            list[0][5]="pid";
            int row=1;
            while (rs.next()){
                list[row][0]=rs.getString("bookid");
                list[row][1]=rs.getString("name");
                list[row][2]=rs.getString("image");
                list[row][3]=rs.getString("count");
                list[row][4]=rs.getString("date");
                list[row][5]=rs.getString("pid");
            }
            rd=list[1][5]!=null;
        }
        catch(Exception e){
                e.printStackTrace();
            }
        return rd;
    }

    @Override
    protected boolean formatData() {
        int rowNum = 0;
        for (String[] rowData : list) {
            Row row = sheet.createRow(rowNum++);
            int colNum = 0;
            for (String field : rowData) {
                Cell cell = row.createCell(colNum++);
                    cell.setCellValue((String) field);
            }
        }
        return rowNum>=0;



    }

    @Override
    protected void writeDataToFile() {
        try (FileOutputStream outputStream = new FileOutputStream(filename)) {
            workbook.write(outputStream);
            workbook.close();
            System.out.println("Excel file generated successfully.");
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

}
