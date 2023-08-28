package com.utils;

import java.io.IOException;
import java.io.InputStream;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.DateUtil;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.springframework.web.multipart.MultipartFile;

import com.bean.Sample;

public class ReadExcelUtil {
	
	//错误信息
	private String errorMsg;
	private int totalRows;
	private int totalCells;

	public String getErrorMsg() {
		return errorMsg;
	}

	public void setErrorMsg(String errorMsg) {
		this.errorMsg = errorMsg;
	}

	public int getTotalRows() {
		return totalRows;
	}

	public void setTotalRows(int totalRows) {
		this.totalRows = totalRows;
	}

	public int getTotalCells() {
		return totalCells;
	}

	public void setTotalCells(int totalCells) {
		this.totalCells = totalCells;
	}

	public List<Sample> getExcelSampleInfo(MultipartFile file) {
		List<Sample> sampleList = null;
        // 获取文件名
        String fileName = file.getOriginalFilename();
        try {
            // 验证文件名是否合格
            if (!validateExcel(fileName)) {
                return null;
            }
            // 根据文件名判断文件是2003版本还是2007版本
            boolean isExcel2003 = true;
            if (isExcel2007(fileName)) {
                isExcel2003 = false;
            }
            sampleList = createExcel(file.getInputStream(), isExcel2003);
        } catch (Exception e) {
            e.printStackTrace();
        }
 
        return sampleList;
	}

	private List<Sample> createExcel(InputStream is, boolean isExcel2003) {
		List<Sample> sampleList = null;
        try {
            Workbook wb = null;
            // 当excel是2003时,创建excel2003
            if (isExcel2003) {
                wb = new HSSFWorkbook(is);
            } else {
                // 当excel是2007时,创建excel2007
                wb = new XSSFWorkbook(is);
            }
            // 读取Excel里面客户的信息
            sampleList = readExcelValue(wb);
        } catch (IOException e) {
            e.printStackTrace();
        }
        return sampleList;
	}

	@SuppressWarnings("deprecation")
	private List<Sample> readExcelValue(Workbook wb) {
		// 得到第一个shell
        Sheet sheet = wb.getSheetAt(0);
        // 得到Excel的行数
        this.totalRows = sheet.getPhysicalNumberOfRows();
        // 得到Excel的列数(前提是有行数)
        if (totalRows > 1 && sheet.getRow(0) != null) {
        	//通过表头获得列数
            this.totalCells = sheet.getRow(0).getPhysicalNumberOfCells();
        }
        List<Sample> sampleList = new ArrayList<Sample>();
        // 循环Excel行数
        for(int r = 1;r < totalRows;r++){
            Row row = sheet.getRow(r);
            if(row.getCell(0)==null) {
            	//如果采用getPhysicalNumberOfRows,需要注意的是,如果行中设置了
            	//单元格或样式或其他一些东西,poi也会算成一行,但是实际上这种行对于我们开发者来说,
            	//是无意义的行,所以也必须要去手动过滤..
                continue;

            }
          
            Sample sample = new Sample();
            // 循环Excel的列
            for(int c = 0;c < this.totalCells;c++){
                Cell cell = row.getCell(c);
                if (null != cell){
                    // 如果是纯数字,比如你写的是25,cell.getNumericCellValue()获得是25.0,通过截取字符串去掉.0获得25
                    switch (c){
                        case 0:
                        	sample.setSamplename(cell.getStringCellValue());
                            break;
                        case 1:
                        	sample.setBelong(cell.getStringCellValue());
                            break;
                        case 2:
                        	sample.setFindplace(cell.getStringCellValue());
                            break;
                        case 3:
                            if(cell.getCellType() == Cell.CELL_TYPE_NUMERIC){
                            	if(DateUtil.isCellDateFormatted(cell)){
                            		DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
                                    Date date = cell.getDateCellValue();
                                    sample.setFindtime(dateFormat.format(date));
                            	}
                            }
                            break;
                        case 4:
                        	sample.setMaterial(cell.getStringCellValue());
                            break;
                        case 5:
                        	sample.setOfyear(cell.getStringCellValue());
                            break;
                        case 6:
                        	sample.setPerson(cell.getStringCellValue());
                            break;
                        case 7:
                        	if(cell.getCellType() == Cell.CELL_TYPE_NUMERIC){
                            	if(DateUtil.isCellDateFormatted(cell)){
                            		DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
                                    Date date = cell.getDateCellValue();
                                    sample.setLogtime(dateFormat.format(date));
                            	}
                            }
                            break;
                        case 8:
                        	sample.setPerson(cell.getStringCellValue());
                            break;
                        case 9:
                            if(cell.getCellType() == Cell.CELL_TYPE_NUMERIC){
	                          String open = String.valueOf(cell.getNumericCellValue());
	                          sample.setOpen(Integer.valueOf(open.substring(0,open.length()-2 > 0 ? open.length()-2 : 1)));
                      	    }
                            break;
                        case 10:
                            if(cell.getCellType() == Cell.CELL_TYPE_NUMERIC){
	                          String borrow_state = String.valueOf(cell.getNumericCellValue());
	                          sample.setBorrow_state(Integer.valueOf(borrow_state.substring(0,borrow_state.length()-2 > 0 ? borrow_state.length()-2 : 1)));
                      	    }
                            break;
                        	
                    }
                }
            }
            // 添加到list
            sampleList.add(sample);
        }
        return sampleList;
	}

	private boolean validateExcel(String fileName) {
		if (fileName == null||!(isExcel2003(fileName) || isExcel2007(fileName))) {
			System.out.print("这里执行了");
            errorMsg = "文件名不是excel格式";
            return false;
        }
        return true;

	}

	private boolean isExcel2007(String fileName) {
		return fileName.matches("^.+\\.(?i)(xlsx)$");
	}

	private boolean isExcel2003(String fileName) {
		return fileName.matches("^.+\\.(?i)(xls)$");
	}

}
