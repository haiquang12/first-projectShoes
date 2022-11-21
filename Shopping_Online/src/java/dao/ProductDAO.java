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
import model.Category;
import model.Product;

/**
 *
 * @author Admin
 */
public class ProductDAO {

    public List<Product> getAllProduct() {
        List<Product> list = new ArrayList<>();
        try {

            String sql = "SELECT [id]\n"
                    + "      ,[name]\n"
                    + "      ,[image]\n"
                    + "      ,[price]\n"
                    + "      ,[description]\n"
                    + "      ,[cateID]\n"
                    + "  FROM [dbo].[product]";
            Connection conn = new DBContext().getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                //               Category category = new Category(rs.getInt(1), rs.getString(2));
                Product product = Product.builder().id(rs.getInt(1)).name(rs.getString(2)).imageUrl(rs.getString(3))
                        .price(rs.getDouble(4)).description(rs.getString(5)).cateID(rs.getInt(6)).
                        build();
                list.add(product);

            }

        } catch (Exception ex) {
            Logger.getLogger(CategoryDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }

    public List<Product> getProductsByCategoryID(int categoryId) {
        List<Product> list = new ArrayList<>();
        try {

            String sql = "SELECT [id]\n"
                    + "      ,[name]\n"
                    + "      ,[image]\n"
                    + "      ,[price]\n"
                    + "      ,[description]\n"
                    + "      ,[cateID]\n"
                    + "  FROM [dbo].[product]"
                    + "where cateID = ?";
            Connection conn = new DBContext().getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, categoryId);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                //               Category category = new Category(rs.getInt(1), rs.getString(2));
                Product product = Product.builder().id(rs.getInt(1))
                        .name(rs.getString(2))
                        .imageUrl(rs.getString(3))
                        .price(rs.getDouble(4))
                        .description(rs.getString(5))
                        .cateID(rs.getInt(6))
                        .build();
                list.add(product);

            }

        } catch (Exception ex) {
            Logger.getLogger(CategoryDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }

    public List<Product> getProductWithPaging(int page, int PAGE_SIZE) {
        List<Product> list = new ArrayList<>();
        try {

            String sql = "SELECT [id]\n"
                    + "      ,[name]\n"
                    + "      ,[image]\n"
                    + "      ,[price]\n"
                    + "      ,[description]\n"
                    + "      ,[cateID]\n"
                    + "  from product order by id\n"
                    + "offset (?-1)*? row fetch next ? rows only";
            Connection conn = new DBContext().getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, page);
            ps.setInt(2, PAGE_SIZE);
            ps.setInt(3, PAGE_SIZE);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                //               Category category = new Category(rs.getInt(1), rs.getString(2));
                Product product = Product.builder().id(rs.getInt(1)).name(rs.getString(2)).imageUrl(rs.getString(3))
                        .price(rs.getDouble(4)).description(rs.getString(5)).cateID(rs.getInt(6)).
                        build();
                list.add(product);

            }

        } catch (Exception ex) {
            Logger.getLogger(CategoryDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }

    public int getTotalProducts() {
        List<Product> list = new ArrayList<>();
        try {

            String sql = "select COUNT(id)  from product";
            Connection conn = new DBContext().getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                return rs.getInt(1);

            }

        } catch (Exception ex) {
            Logger.getLogger(CategoryDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return 0;
    }

    public List<Product> serach(String keyword) {
        List<Product> list = new ArrayList<>();
        try {

            String sql = "SELECT [id]\n"
                    + "      ,[name]\n"
                    + "      ,[image]\n"
                    + "      ,[price]\n"
                    + "      ,[description]\n"
                    + "      ,[cateID]\n"
                    + "  FROM [dbo].[product] where name like ?";
            Connection conn = new DBContext().getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, "%" + keyword + "%");
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                //               Category category = new Category(rs.getInt(1), rs.getString(2));
                Product product = Product.builder().id(rs.getInt(1)).name(rs.getString(2)).imageUrl(rs.getString(3))
                        .price(rs.getDouble(4)).description(rs.getString(5)).cateID(rs.getInt(6)).
                        build();
                list.add(product);

            }

        } catch (Exception ex) {
            Logger.getLogger(CategoryDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }

    public Product getProductById(int productId) {
        try {

            String sql = "SELECT [id]\n"
                    + "      ,[name]\n"
                    + "      ,[image]\n"
                    + "      ,[price]\n"
                    + "      ,[description]\n"
                    + "      ,[cateID]\n"
                    + "  FROM [dbo].[product] where id = ?";
            Connection conn = new DBContext().getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, productId);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Product product = Product.builder().id(rs.getInt(1)).name(rs.getString(2)).imageUrl(rs.getString(3))
                        .price(rs.getDouble(4)).description(rs.getString(5)).cateID(rs.getInt(6)).
                        build();
                return product;

            }

        } catch (Exception ex) {
            Logger.getLogger(CategoryDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    public void deleteProduct(int id) {

        String sql = "DELETE FROM [dbo].[product]\n"
                + "      WHERE id = ?";
        try {
            Connection conn = new DBContext().getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, id);
            ps.executeUpdate();

        } catch (Exception e) {

        }
    }

    public void editProduct(String name, String imageUrl, String price, String description, String id) {
        String sql = "UPDATE [dbo].[product]\n"
                + "   SET [name] = ?\n"
                + "      ,[image] = ?\n"
                + "      ,[price] = ?\n"
                + "      ,[description] = ?\n"
                + " WHERE id = ?";
        try {
            Connection conn = new DBContext().getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, name);
            ps.setString(2, imageUrl);
            ps.setString(3, price);
            ps.setString(4, description);
            ps.setString(5, id);
            ps.executeUpdate();

        } catch (Exception e) {

        }
    }
}
