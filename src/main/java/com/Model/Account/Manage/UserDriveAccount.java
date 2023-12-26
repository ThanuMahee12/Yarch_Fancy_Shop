package com.Model.Account.Manage;

import com.Dao.Dao;

import java.sql.*;

// Concrete subclass representing a user drive account
public class UserDriveAccount extends DriveAccountTemplate {
    @Override
    protected boolean isValid(String username, String password,Connection connection) {
        boolean validate=false;
    if(username != null && !username.isEmpty() && password.length() >= 8){
        try {
            PreparedStatement ps=connection.prepareStatement("select * from user where username=?");
            ps.setString(1,username);
            ResultSet rs=ps.executeQuery();
            if(rs.isBeforeFirst()){
                validate=true;
            }else{
                validate=false;
            }

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

    }else{
        validate=false;
    }
        return  validate;
    }

    @Override
    protected String generateAccountNumber() {
        return "U-" + System.currentTimeMillis();
    }

    @Override
    protected boolean saveAccountInfo(String username, String password, String accountNumber, Connection connection) {
        try {
            PreparedStatement ps=connection.prepareStatement("insert into user(userid,username,password,Mobile)values(?,?,?,?)");
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
        // Implement display logic for success message
        return "../login.jsp?mess=USer account created successfully";
    }

    @Override
    protected String displayErrorMessage(String username) {
        return "../Register.jsp?mes=Invalid user account details for username: " + username;
    }

}



