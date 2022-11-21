/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package filter;

import dao.AccountDAO;
import java.io.IOException;
import java.io.PrintStream;
import java.io.PrintWriter;
import java.io.StringWriter;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.Account;

/**
 *
 * @author Admin
 */
@WebFilter(filterName = "AuthenticationFilter", urlPatterns = {"/add-to-cart","/carts","/checkout","/delete-cart","/update-quantity","/addProductM"})
public class AuthenticationFilter implements Filter {
    

    @Override
    public void doFilter(ServletRequest request, ServletResponse response,
            FilterChain chain)
            throws IOException, ServletException {
        HttpServletRequest req = (HttpServletRequest) request;
        HttpServletResponse res = (HttpServletResponse) response;
        
        
        HttpSession session = req.getSession();
        //ktra dang nhap  
        Account account = (Account) session.getAttribute("account");
        
        if(account != null){
            //cho qua
            chain.doFilter(request, response);
        }else{
            //check cookie
            Cookie[] cookies = req.getCookies();
        String username = null;
        String password = null;
        for (Cookie cooky : cookies) {
            if (cooky.getName().equals("username")) {
                username = cooky.getValue();
            }
            if (cooky.getName().equals("password")) {
                password = cooky.getValue();
            }
            if (username != null && password != null) {
                break;
            }
        }

        if (username != null && password != null) {
            Account accountLogin = new AccountDAO().login(username, password);
            if (account != null) { //cookie hợp lệ
                session.setAttribute("account", account);
                chain.doFilter(request, response);
                return;
            }
        }
        res.sendRedirect("http://localhost:8080/Shopping_Online/login");
        }
    }

   
    @Override
    public void destroy() {        
    }

    
    @Override
    public void init(FilterConfig filterConfig) {        
        
    }
    
   
    
}
