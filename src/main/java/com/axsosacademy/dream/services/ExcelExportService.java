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
import com.axsosacademy.dream.models.Task;

@Service
public class ExcelExportService {
    
    public void exportJobApplicationsToExcel(List<JobApplication> jobApplications, List<Task> tasks, String filePath) throws IOException {
        Workbook workbook = new XSSFWorkbook();
        
        // Create and style the job applications sheet
        Sheet jobSheet = workbook.createSheet("Job Applications");
        createJobApplicationsSheet(workbook, jobSheet, jobApplications);
        
        // Create and style the tasks sheet
        Sheet taskSheet = workbook.createSheet("Tasks");
        createTasksSheet(workbook, taskSheet, tasks);

        // Write to file
        try (FileOutputStream fileOut = new FileOutputStream(filePath)) {
            workbook.write(fileOut);
        }
        workbook.close();
    }
    
    private void createJobApplicationsSheet(Workbook workbook, Sheet sheet, List<JobApplication> jobApplications) {
        // Create header row
        Row headerRow = sheet.createRow(0);
        String[] columns = {"Title", "Organization", "Status", "Notes", "Website", "Date Applied"};
        
        // Style for header
        CellStyle headerStyle = createHeaderStyle(workbook);

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
            row.createCell(4).setCellValue(job.getWebsite());
            row.createCell(5).setCellValue(job.getCreatedAt().toString());
        }

        // Auto-size columns
        for (int i = 0; i < columns.length; i++) {
            sheet.autoSizeColumn(i);
        }
    }
    
    private void createTasksSheet(Workbook workbook, Sheet sheet, List<Task> tasks) {
        // Create header row
        Row headerRow = sheet.createRow(0);
        String[] columns = {"Description", "Status", "Created By", "Created Date"};
        
        // Style for header
        CellStyle headerStyle = createHeaderStyle(workbook);

        // Create headers
        for (int i = 0; i < columns.length; i++) {
            Cell cell = headerRow.createCell(i);
            cell.setCellValue(columns[i]);
            cell.setCellStyle(headerStyle);
            sheet.autoSizeColumn(i);
        }

        // Add data rows
        int rowNum = 1;
        for (Task task : tasks) {
            Row row = sheet.createRow(rowNum++);
            row.createCell(0).setCellValue(task.getDescription());
            row.createCell(1).setCellValue(task.isCompleted() ? "Completed" : "Pending");
            row.createCell(2).setCellValue(task.getAuthor().getFirstName() + " " + task.getAuthor().getLastName());
            row.createCell(3).setCellValue(task.getCreatedAt().toString());
        }

        // Auto-size columns
        for (int i = 0; i < columns.length; i++) {
            sheet.autoSizeColumn(i);
        }
    }
    
    private CellStyle createHeaderStyle(Workbook workbook) {
        CellStyle headerStyle = workbook.createCellStyle();
        Font headerFont = workbook.createFont();
        headerFont.setBold(true);
        headerStyle.setFont(headerFont);
        headerStyle.setFillForegroundColor(IndexedColors.GREY_25_PERCENT.getIndex());
        headerStyle.setFillPattern(FillPatternType.SOLID_FOREGROUND);
        return headerStyle;
    }
}