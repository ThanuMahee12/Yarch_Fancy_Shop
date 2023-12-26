package com.Model.Report;

import com.Dao.Dao;
import com.itextpdf.text.Document;
import com.itextpdf.text.Paragraph;
import com.itextpdf.text.pdf.PdfWriter;

import java.io.File;
import java.io.FileOutputStream;
import java.io.FileWriter;
import java.io.IOException;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;

public class PDFReportGenerator extends ReportGenerator {
    String content;
    Document document;
    String filename;

    public PDFReportGenerator() {
        filename=Math.random()*1000+".pdf";
    }

    @Override
    protected boolean prepareData(String bookid, Dao dao) {
        // Implement the logic to fetch data for PDF report
        // For example: database queries, API calls, etc.
        boolean rsj=false;
        try {
            Connection connection=dao.getConnection();
            Statement statement=connection.createStatement();
            ResultSet rs=statement.executeQuery("select * from book");
            while (rs.next()){
                content="BookId :"+rs.getString("bookid")+"\nProductName:"+rs.getString("name")+"\nImage:"+rs.getString("image")+"\nBookDate"+rs.getString("date");
            }
            rsj=content!=null;

        }catch (Exception e){
            e.printStackTrace();
        }
        return rsj;

    }

    @Override
    protected boolean formatData() {
        File file=new File(filename);
        boolean rs=false;
        try {
            rs=file.createNewFile();


        } catch (IOException e) {
            throw new RuntimeException(e);
        }
        return rs;
    }

    @Override
    protected void writeDataToFile() {
        // Use iText or Apache PDFBox to write data to a PDF file
            document=new Document();
        try{

            PdfWriter.getInstance(document,new FileOutputStream(filename));
            document.open();
            Paragraph paragraph=new Paragraph(content);
            document.add(paragraph);
            document.close();
            System.out.println("created");
        }catch (Exception e){
            e.printStackTrace();
        }
    }


}