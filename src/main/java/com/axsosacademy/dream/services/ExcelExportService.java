package com.axsosacademy.dream.services;

import java.io.FileOutputStream;
import java.io.IOException;
import java.util.List;

import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.CellStyle;
import org.apache.poi.ss.usermodel.FillPatternType;
import org.apache.poi.ss.usermodel.Font;
import org.apache.poi.ss.usermodel.IndexedColors;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.springframework.stereotype.Service;

import com.axsosacademy.dream.models.JobApplication;
@Service
public class ExcelExportService {
    
    public void exportJobApplicationsToExcel(List<JobApplication> jobApplications, String filePath) throws IOException {
        Workbook workbook = new XSSFWorkbook();
        Sheet sheet = workbook.createSheet("Job Applications");

        // Create header row
        Row headerRow = sheet.createRow(0);
        String[] columns = {"Title", "Organization", "Status", "Notes", "Date Applied"};
        
        // Style for header
        CellStyle headerStyle = workbook.createCellStyle();
        Font headerFont = workbook.createFont();
        headerFont.setBold(true);
        headerStyle.setFont(headerFont);
        headerStyle.setFillForegroundColor(IndexedColors.GREY_25_PERCENT.getIndex());
        headerStyle.setFillPattern(FillPatternType.SOLID_FOREGROUND);

        // Create headers
        for (int i = 0; i < columns.length; i++) {
            Cell cell = headerRow.createCell(i);
            cell.setCellValue(columns[i]);
            cell.setCellStyle(headerStyle);
            sheet.autoSizeColumn(i);
        }

        // Add data rows
        int rowNum = 1;
        for (JobApplication job : jobApplications) {
            Row row = sheet.createRow(rowNum++);
            row.createCell(0).setCellValue(job.getTitle());
            row.createCell(1).setCellValue(job.getOrganization());
            row.createCell(2).setCellValue(job.getStatus());
            row.createCell(3).setCellValue(job.getNotes());
            // Assuming you have a date field, format it appropriately
            row.createCell(4).setCellValue(job.getCreatedAt().toString());
        }

        // Auto-size columns
        for (int i = 0; i < columns.length; i++) {
            sheet.autoSizeColumn(i);
        }

        // Write to file
        try (FileOutputStream fileOut = new FileOutputStream(filePath)) {
            workbook.write(fileOut);
        }
        workbook.close();
    }
}