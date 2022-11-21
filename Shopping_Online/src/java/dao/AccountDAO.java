/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import Context.DBContext;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Account;
import model.Category;

/**
 *
 * @author Admin
 */
public class AccountDAO {

    public static void InsertAccount(String name, String password1) {
        try {

            String sql = "INSERT INTO [dbo].[Account]\n"
                    + "           ([username]\n"
                    + "           ,[password]\n"
                    + "           ,[role])\n"
                    + "     VALUES\n"
                    + "           (?,?,?)";
            Connection conn = new DBContext().getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, name);
            ps.setString(2, password1);
            ps.setString(3, "USER");
            ps.executeUpdate();

        } catch (Exception ex) {
            Logger.getLogger(AccountDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public Account login(String username, String password) {
        try {

            String sql = "SELECT *\n"
                    + "  FROM [dbo].[Account] where username = ? and password = ?";
            Connection conn = new DBContext().getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, username);
            ps.setString(2, password);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                //               Category category = new Category(rs.getInt(1), rs.getString(2));
                Account account = Account.builder().id(rs.getInt(1)).username(rs.getString(2))
                        .password(rs.getString(3))
                        .role(rs.getString(4))
                        .build();
                return account;

            }

        } catch (Exception ex) {
            Logger.getLogger(AccountDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    public Account getAccountbyName(String name) {
        try {

            String sql = "SELECT *\n"
                    + "  FROM [dbo].[Account] where username = ?";
            Connection conn = new DBContext().getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, name);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                //               Category category = new Category(rs.getInt(1), rs.getString(2));
                Account account = Account.builder().id(rs.getInt(1)).username(rs.getString(2))
                        .password(rs.getString(3))
                        .role(rs.getString(4))
                        .build();
                return account;

            }

        } catch (Exception ex) {
            Logger.getLogger(AccountDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

}
