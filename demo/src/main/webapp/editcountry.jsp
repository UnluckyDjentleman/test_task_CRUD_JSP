<%@ page import="com.example.demo.Country" %>
<%@ page import="com.example.demo.CountryDAO" %><%--
  Created by IntelliJ IDEA.
  User: User
  Date: 12.11.23
  Time: 00:24
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
String id=request.getParameter("id");
Country country=new CountryDAO().getCountryById(id);
%>
<html>
<head>
    <title>Title</title>
</head>
<body>
<form action="update-servlet" method="post" enctype="multipart/form-data">
    <label for="idCountry">ID</label>
    <input type="text" name="IDCountry" id="idCountry" value="<%=country.getCountry_id()%>" readonly/><br/>
    <label for="nameCountry">Country Name</label>
    <input type="text" name="NameCountry" id="nameCountry" value="<%=country.getCountry_name()%>"/><br/>
    <label for="flagCountry">Flag</label>
    <input type="file" name="FlagCountry" id="flagCountry"/><br/>
    <input type="submit" value="Update">
</form>
</body>
</html>
