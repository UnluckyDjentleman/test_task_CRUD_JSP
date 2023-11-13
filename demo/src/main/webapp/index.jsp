<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="com.example.demo.*" %>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<!DOCTYPE html>
<html>
<head>
  <title>JSP - Hello World</title>
  <meta name="viewport" content="width=device-width, initial-scale=1">
</head>
<%
List<Country> countriesList=new ArrayList<>();
  try {
    CountryDAO countryDAO = new CountryDAO();
    countriesList = countryDAO.getCountries();
    request.setAttribute("countriesList", countriesList);
  }catch(Exception e){
    e.printStackTrace();
  }
%>
  <div>
    <table border=1>
      <thead>
      <tr>
        <th>ID</th>
        <th>Country</th>
        <th>Flag</th>
      </tr>
      </thead>
      <tbody>

      <c:forEach var="countriesList" items="${countriesList}">
      <tr>
        <td><c:out value="${countriesList.getCountry_id()}"/></td>
        <td><c:out value="${countriesList.getCountry_name()}"/></td>
        <td><img src="flags/${countriesList.getCountry_flag()}" alt="xd" width="50px"/></td>
        <td>
          <a href="editcountry.jsp?id=${countriesList.getCountry_id()}">Update</a>
          <a href="deletecountry.jsp?id=${countriesList.getCountry_id()}">Delete</a>
        </td>
      </tr>
      </c:forEach>

    </table>
    <a href="countryForm.jsp">Add Country</a>
  </div>
  <div style="margin:5px;">
    <audio controls>
      <source src="audios/Pantera - 5 Minutes Alone.mp3" type="audio/mpeg" />
    </audio>
  </div>
  <div>
    <svg width="20" height="19" viewBox="0 0 20 19" fill="none" xmlns="http://www.w3.org/2000/svg">
      <script type="text/ecmascript"><![CDATA[
      changeColorOnClick=(evt)=> {
          var svgObj=evt.target;
          svgObj.addEventListener('click',()=>{
            if(svgObj.style.fill=='rgb(253, 160, 160)'){
              svgObj.style.fill='rgb(225, 225, 225)';
            }
            else{
              svgObj.style.fill='rgb(253, 160, 160)';
            }
          })
        }
      ]]>
      </script>
      <path fill-rule="evenodd" clip-rule="evenodd" d="M10 1.66446C15.5477 -4.11405 29.418 5.99771 10 19C-9.41803 5.99898 4.45235 -4.11405 10 1.66446Z" style="fill: rgb(225, 225, 225);" onclick='changeColorOnClick(evt)'/>
    </svg>
  </div>
</body>
</html>