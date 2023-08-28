package com.test;

import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.ss.usermodel.*;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;

import com.bean.Sample;

import org.apache.poi.xssf.usermodel.XSSFCell;
import org.apache.poi.xssf.usermodel.XSSFRow;
import org.apache.poi.xssf.usermodel.XSSFSheet;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.lang.reflect.Field;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class ImportExcel {
    // abc.xls
    public static boolean isXls(String fileName){
        // (?i)忽略大小写
        if(fileName.matches("^.+\\.(?i)(xls)$")){
            return true;
        }else if(fileName.matches("^.+\\.(?i)(xlsx)$")){
            return false;
        }else{
            throw new RuntimeException("格式不对");
        }
    }

	public static List<?> readExcel(Object object,String fileName, InputStream inputStream) throws Exception{
    	boolean ret = isXls(fileName);
        Workbook workbook = null;
        FileInputStream in=new FileInputStream("C:\\Users\\15427\\Desktop\\test.xlsx");
        // 根据后缀创建不同的对象
        if(ret){
            workbook = new HSSFWorkbook(inputStream);
        }else{
            workbook = new XSSFWorkbook(inputStream);
        }
        int sheetNumber=workbook.getNumberOfSheets();
        List<Object> list = new ArrayList<>();
        for(int k=0;k<sheetNumber;k++) {
        	 Sheet sheet=workbook.getSheetAt(k);
        	 //获取行数
             int rows = sheet.getPhysicalNumberOfRows();
            // 得到标题行
             Row titleRow = sheet.getRow(0);
             
             for(int i = 1; i < rows; i++ ){
            	 HashMap<String,String> readData = new HashMap<>();
                 Row row = sheet.getRow(i);
                 int columns = row.getPhysicalNumberOfCells();
                 Field[] fields = object.getClass().getDeclaredFields();
                 for(int j = 0; j < columns; j++){
                     XSSFCell cell = (XSSFCell) row.getCell(j);
                     int cellType = cell.getCellType();
//                     switch (cellType){
//	                     case STRING ://String
//	                         readData.put(fields[j].getName(),cell.getStringCellValue());//属性赋值
//	                         break;
//	                     case BOOLEAN ://bealean
//	                         readData.put(fields[j].getName(),Boolean.valueOf(cell.getBooleanCellValue()).toString());//属性赋值
//	                         break;
//	                     case NUMERIC ://number
//	                         //默认日期读取出来是数字，判断是否是日期格式的数字
//	                         if(DateUtil.isCellDateFormatted(cell)){
//	                             //读取的数字是日期，转换一下格式
//	                             DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
//	                             Date date = cell.getDateCellValue();
//	                             readData.put(fields[j].getName(),dateFormat.format(date));//属性赋值
//	                         }else {//不是日期直接赋值
//	                             readData.put(fields[j].getName(),Double.valueOf(cell.getNumericCellValue()).toString());//属性赋值
//	                         }
//	                         break;
//	                     case BLANK :
//	                         readData.put(fields[j].getName(),"");//属性赋值
//	                         break;
//	                     default:
//	                         System.out.println("未知类型------>"+cell);
//                     }
                    
                 }
                list.add(readData); 
             }
             
        }
      
			for(int i=0;i<list.size();i++) {
				System.out.println(list.get(i));
			}
        workbook.close();
        return list;
    
    }
	@SuppressWarnings("deprecation")
	public static void main(String[] args) throws IOException {
		FileInputStream file=new FileInputStream("C:\\Users\\15427\\Desktop\\test.xlsx");
		//FileInputStream fileInputStream = new FileInputStream(this.filePath);//开启文件读取流
        Workbook sheets = new XSSFWorkbook(file);//读取文件
        //获取sheet
        Sheet sheet = sheets.getSheetAt(0);
//        sheets.getNumberOfSheets();//获取sheet的数量，如果有多个sheet，可以使用for
        List<Object> list = new ArrayList<>();
        //获取行数
        int rows = sheet.getLastRowNum();
        System.out.println("总行数："+rows);
        for(int i=1;i<=rows;i++){
        	System.out.println("第"+i+"行：");
            HashMap<String,String> readData = new HashMap<>();
            //获取列数
            Row row = sheet.getRow(i);
            if(row.getCell(0)==null) {
            	continue;
            }
            int columns = row.getLastCellNum();
            System.out.println("列数："+columns);
            Sample sample=new Sample();
            Field[] fields = sample.getClass().getDeclaredFields();
            for(int j=0;j<=columns;j++){
                //拿到单元格数据
                Cell cell = row.getCell(j);
                //System.out.println(cell.getRawValue());
                //判断单元格中数据的类型，根据类型进行赋值
                if(cell==null) {
                	System.out.print(fields[j+1].getName()+":");
                	readData.put(fields[j+1].getName(), "");
                	continue;
                }
                switch (cell.getCellType()){
                    case XSSFCell.CELL_TYPE_STRING ://String
                        readData.put(fields[j+1].getName(),cell.getStringCellValue());//属性赋值
                        System.out.print(fields[j+1].getName()+":"+cell.getStringCellValue());
                        break;
                    case XSSFCell.CELL_TYPE_BOOLEAN ://bealean
                    	 //System.out.print(cell.getStringCellValue()+" ");
                        readData.put(fields[j+1].getName(),Boolean.valueOf(cell.getBooleanCellValue()).toString());//属性赋值
                        System.out.print(fields[j+1].getName()+":"+Boolean.valueOf(cell.getBooleanCellValue()).toString());
                        break;
                    case XSSFCell.CELL_TYPE_NUMERIC ://number
                        //默认日期读取出来是数字，判断是否是日期格式的数字
                        if(DateUtil.isCellDateFormatted(cell)){
                            //读取的数字是日期，转换一下格式
                            DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
                            Date date = cell.getDateCellValue();
                            System.out.print(fields[j+1].getName()+":"+dateFormat.format(date));
                            readData.put(fields[j+1].getName(),dateFormat.format(date));//属性赋值
                        }else {//不是日期直接赋值
                        	 //System.out.print(cell.getNumericCellValue()+" ");
                        	readData.put(fields[j+1].getName(),Double.valueOf(cell.getNumericCellValue()).toString());//属性赋值
                        	System.out.print(fields[j+1].getName()+":"+Double.valueOf(cell.getNumericCellValue()).toString());
                            
                        }
                        break;
                    case XSSFCell.CELL_TYPE_BLANK :
                    	System.out.print(fields[j+1].getName()+":"+"");
                        readData.put(fields[j+1].getName(),"");//属性赋值
                        break;
                    default:
                        System.out.println("未知类型------>"+cell);
                }
            }
//            System.out.println("NO."+i+"数据读取成功");
            list.add(readData);
        }
     
		
	}
}

