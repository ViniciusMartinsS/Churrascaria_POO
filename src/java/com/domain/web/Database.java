package com.domain.web;
import java.sql.DriverManager;
import java.sql.Connection;

public class Database {
    private static Connection connection;
    private static Exception connectionException;
    
    public static Connection getConnection(){
        String Driver = "com.mysql.jdbc.Driver";
        String login = "root";
        String senha = "";
        if(connection == null){
            try{
                Class.forName("com.mysql.jdbc.Driver");
                String url = "jdbc:mysql://localhost:3306/churrascaria";
                connection = DriverManager.getConnection(url, login, senha);
                connectionException = null;
            }catch(Exception ex){
                connection = null;
                connectionException = ex;
            }
        }
        return connection;
    }
    
    public static Exception getConnectionException(){
        return connectionException;
    }
}