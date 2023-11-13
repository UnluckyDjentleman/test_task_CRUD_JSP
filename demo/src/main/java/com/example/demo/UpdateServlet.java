package com.example.demo;
import jakarta.servlet.*;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;
import jakarta.servlet.annotation.WebServlet;
import oracle.jdbc.OracleConnection;

import java.io.*;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.Statement;
@MultipartConfig
@WebServlet(name="updateServlet", value="/update-servlet")
public class UpdateServlet extends HttpServlet{
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            String id=req.getParameter("IDCountry");
            String NameCountry=req.getParameter("NameCountry");
            Part part=req.getPart("FlagCountry");
            String FlagCountry=extractFileName(part);
            if(!new File(getServletContext().getRealPath("")+File.separator+"flags").exists()){
                new File(getServletContext().getRealPath("")+File.separator+"flags").mkdirs();
            }
            String savePath=getServletContext().getRealPath("")+File.separator+"flags"+File.separator+FlagCountry;
            InputStream fileContent = part.getInputStream();
            OutputStream out = new FileOutputStream(new File(savePath));
            int read = 0;
            byte[] bytes = new byte[1024];

            while ((read = fileContent.read(bytes)) != -1) {
                out.write(bytes, 0, read);
            }
            out.flush();
            out.close();
            Country country=new CountryDAO().getCountryById(id);
            country.setCountry_name(NameCountry);
            country.setCountry_flag(FlagCountry);
            new CountryDAO().UpdateCountry(country);
            resp.sendRedirect("index.jsp");
        } catch(Exception e){
            e.printStackTrace();
        }
    }
    private String extractFileName(Part part){
        String contentDrip=part.getHeader("content-disposition");
        String[] items=contentDrip.split(";");
        for(String s: items){
            if (s.trim().startsWith("filename")) {
                return s.substring(s.indexOf("=") + 2, s.length() - 1);
            }
        }
        return "";
    }
}
