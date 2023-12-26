package com.Model.Account.Manage;

import com.Dao.Dao;

import java.sql.Connection;

// Abstract class representing the template for creating drive accounts
public abstract class DriveAccountTemplate {
    // Common steps for creating drive accounts
    public final String createAccount(String username, String password,Dao dao) {
        Connection connection=dao.getConnection();
        if (!isValid(username, password,connection)) {
            String accountNumber = generateAccountNumber();
            saveAccountInfo(username, password, accountNumber,connection);
           return displaySuccessMessage(username, accountNumber);
        } else {
            return displayErrorMessage(username);
        }
    }

    protected abstract boolean isValid(String username, String password,Connection connection);
    protected abstract String generateAccountNumber();
    protected abstract boolean saveAccountInfo(String username, String password, String accountNumber, Connection connection);
    protected abstract String displaySuccessMessage(String username, String accountNumber);
    protected abstract String displayErrorMessage(String username);
}
