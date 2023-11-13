package com.example.demo;

import oracle.jdbc.OracleConnection;
import oracle.jdbc.pool.OracleDataSource;

import java.sql.SQLException;

public class ConnectionDB {
    final static String DB_URL= "jdbc:oracle:thin:@localhost:1521:FREE";
    final static String DB_USER = "sys as sysdba";
    final static String DB_PASSWORD = "oracle";
    protected static OracleConnection getConn() throws SQLException, ClassNotFoundException {
        OracleDataSource ods=new OracleDataSource();
        ods.setURL(DB_URL);
        ods.setUser(DB_USER);
        ods.setPassword(DB_PASSWORD);
        OracleConnection con = (OracleConnection)ods.getConnection();
        return con;
    }
}
