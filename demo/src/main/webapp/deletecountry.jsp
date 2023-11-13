<%@ page import="com.example.demo.CountryDAO" %><%--
  Created by IntelliJ IDEA.
  User: User
  Date: 12.11.23
  Time: 00:25
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String id=request.getParameter("id");
    new CountryDAO().DeleteCountry(id);
    response.sendRedirect("index.jsp");
%>
