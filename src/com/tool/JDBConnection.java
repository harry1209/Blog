package com.tool;

import java.sql.*;

public class JDBConnection {
    private final String url = "jdbc:odbc:driver={SQL Server};server=(local);database=xp";
    private final String userName = "sa";
    private final String password = "";
    private Connection con = null;
//通过构造方法加载数据库驱动
    static {
        try {
            Class.forName("sun.jdbc.odbc.JdbcOdbcDriver").newInstance(); 
        } catch (Exception ex) {
            System.out.println("数据库加载失败");
        }
    }
//创建数据库连接
    public boolean creatConnection() {
        try {
            con = DriverManager.getConnection(url, userName, password);
            con.setAutoCommit(true);

        } catch (SQLException e) {
            System.out.println(e.getMessage());
            System.out.println("creatConnectionError!");
        }
        return true;
    }
//对数据库的增加、修改和删除的操作
    public boolean executeUpdate(String sql) {
         if (con == null) {
            creatConnection();
        }
        try {
            Statement stmt = con.createStatement();
            int iCount = stmt.executeUpdate(sql);
            System.out.println("操作成功，所影响的记录数为" + String.valueOf(iCount));
		    return true;
        } catch (SQLException e) {
            System.out.println(e.getMessage());
		    return false;
        }   
    }
//对数据库的查询操作
    public ResultSet executeQuery(String sql) {
        ResultSet rs;
        try {
            if (con == null) {
                creatConnection();
            }
            Statement stmt = con.createStatement();
            try {
                rs = stmt.executeQuery(sql);
            } catch (SQLException e) {
                System.out.println(e.getMessage());
                return null;
            }
        } catch (SQLException e) {
            System.out.println(e.getMessage());
            System.out.println("executeQueryError!");
            return null;
        }
        return rs;
    }


}
