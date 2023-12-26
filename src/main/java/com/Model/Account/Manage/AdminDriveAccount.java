package com.Model.Account.Manage;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class AdminDriveAccount extends DriveAccountTemplate {
    @Override
    protected boolean isValid(String username, String password,Connection connection) {
        // Add specific validation rules for admin accounts (e.g., more stringent password requirements)
        return username != null && !username.isEmpty() && password.length() >= 10;
    }

    @Override
    protected String generateAccountNumber() {
        return "A-" + System.currentTimeMillis();
    }

    @Override
    protected boolean saveAccountInfo(String username, String password, String accountNumber, Connection connection) {
        try {
            PreparedStatement ps=connection.prepareStatement("insert into admin(userid,username,password,Mobile)values(?,?,?,?)");
            ps.setString(1,accountNumber);
            ps.setString(2,username);
            ps.setString(3,password);
            ps.setString(4,"");
            return ps.executeUpdate()>0;
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

    }

    @Override
    protected String displaySuccessMessage(String username, String accountNumber) {
        return "../login.jsp?mess=Admin account created successfully";
    }

    @Override
    protected String displayErrorMessage(String username) {
       return "../Register.jsp?mes=Invalid admin account details for username: " + username;
    }
}
