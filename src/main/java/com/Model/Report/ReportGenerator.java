package com.Model.Report;

import com.Dao.Dao;

public abstract class ReportGenerator {

    // Common method for generating the report
    public void generateReport(String bookid, Dao dao) {
        if(prepareData(bookid,dao)){
            if(formatData()){
                writeDataToFile();
            }
        }

    }

    // Abstract methods to be implemented by subclasses
    protected abstract boolean prepareData(String bookid, Dao dao);
    protected abstract boolean formatData();
    protected abstract void writeDataToFile();
}
