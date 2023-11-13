<%--
  Created by IntelliJ IDEA.
  User: User
  Date: 11.11.23
  Time: 11:58
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<form action="post-servlet" method="post" enctype="multipart/form-data">
  <label for="idCountry">ID</label>
  <input type="text" name="IDCountry" id="idCountry"/><br/>
  <label for="nameCountry">Country Name</label>
  <input type="text" name="NameCountry" id="nameCountry"/><br/>
  <label for="flagCountry">Flag</label>
  <input type="file" name="FlagCountry" id="flagCountry"/><br/>
  <input type="submit" value="Add">
</form>
</body>
</html>
