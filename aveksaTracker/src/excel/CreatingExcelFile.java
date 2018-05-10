package excel;

import  java.io.*;  
import  java.sql.*;
import  org.apache.poi.hssf.usermodel.HSSFSheet;  
import  org.apache.poi.hssf.usermodel.HSSFWorkbook;

import database.MySQLConnection;

import  org.apache.poi.hssf.usermodel.HSSFRow;
import  org.apache.poi.hssf.usermodel.HSSFCell;  

public class CreatingExcelFile{
   // public static void main(String[]args){
	public void createAveksaTicketsDump(String query) {
try{
String filename="D:/AveksaTicketsData.xls" ;
HSSFWorkbook hwb=new HSSFWorkbook();
HSSFSheet sheet =  hwb.createSheet("new sheet");

HSSFRow rowhead=   sheet.createRow((short)0);
rowhead.createCell((short) 0).setCellValue("Ticket Id");
rowhead.createCell((short) 1).setCellValue("Name");
rowhead.createCell((short) 2).setCellValue("Form Type");
rowhead.createCell((short) 3).setCellValue("Request Date");
rowhead.createCell((short) 4).setCellValue("Queued Date");
rowhead.createCell((short) 5).setCellValue("No of Users");
rowhead.createCell((short) 6).setCellValue("No of Targets");
rowhead.createCell((short) 7).setCellValue("Provisioning Events");
rowhead.createCell((short) 8).setCellValue("Ticket Type");
rowhead.createCell((short) 9).setCellValue("Ticket Category");
rowhead.createCell((short) 10).setCellValue("Department");
rowhead.createCell((short) 11).setCellValue("Location");
rowhead.createCell((short) 12).setCellValue("Company name/ Unique ID");
rowhead.createCell((short) 13).setCellValue("AFX");
rowhead.createCell((short) 14).setCellValue("Assignee");
rowhead.createCell((short) 15).setCellValue("Completed Date");
rowhead.createCell((short) 16).setCellValue("Ticket Status");
rowhead.createCell((short) 17).setCellValue("Comments");

//Class.forName("com.mysql.jdbc.Driver");
//Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/test", "root", "root");
MySQLConnection dbConnection=new MySQLConnection();
Connection con=dbConnection.getCon();
Statement st=con.createStatement();
ResultSet rs=st.executeQuery(query);
int i=1;
while(rs.next()){
HSSFRow row=   sheet.createRow((short)i);
row.createCell((short) 0).setCellValue(rs.getString("Ticket_Id"));
row.createCell((short) 1).setCellValue(rs.getString("Name"));
row.createCell((short) 2).setCellValue(rs.getString("Form_Type"));
row.createCell((short) 3).setCellValue(rs.getString("Request_Date"));
row.createCell((short) 4).setCellValue(rs.getString("Queued_Date"));
row.createCell((short) 5).setCellValue(Integer.toString(rs.getInt("No_of_Users")));
row.createCell((short) 6).setCellValue(Integer.toString(rs.getInt("No_of_Targets")));
row.createCell((short) 7).setCellValue(Integer.toString(rs.getInt("Provisioning_Events")));
row.createCell((short) 8).setCellValue(rs.getString("Ticket_Type"));
row.createCell((short) 9).setCellValue(rs.getString("Ticket_Category"));
row.createCell((short) 10).setCellValue(rs.getString("Department"));
row.createCell((short) 11).setCellValue(rs.getString("Location"));
row.createCell((short) 12).setCellValue(rs.getString("Company_Name"));
row.createCell((short) 13).setCellValue(rs.getString("AFX"));
row.createCell((short) 14).setCellValue(rs.getString("Assignee"));
row.createCell((short) 15).setCellValue(rs.getString("Completed_Date"));
row.createCell((short) 16).setCellValue(rs.getString("Ticket_Status"));
row.createCell((short) 17).setCellValue(rs.getString("Comments"));

i++;
}
FileOutputStream fileOut =  new FileOutputStream(filename);
hwb.write(fileOut);
fileOut.close();
System.out.println("Your excel file has been generated!");

} catch ( Exception ex ) {
    System.out.println(ex);

}
    }
}
