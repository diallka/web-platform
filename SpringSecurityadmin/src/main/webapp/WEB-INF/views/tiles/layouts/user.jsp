<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page isELIgnored="false" %>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
 
<html>
 
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
    <title><tiles:getAsString name="title" /></title>
<%--     <link href="<c:url value='/static/css/bootstrap.css' />"  rel="stylesheet"></link> --%>
<%--     <link href="<c:url value='/static/css/app.css' />" rel="stylesheet"></link> --%>
</head>
  

       
            <tiles:insertAttribute name="header" />
     
            <tiles:insertAttribute name="menu" />
            
             <tiles:insertAttribute name="content" />

            <tiles:insertAttribute name="footer" />

</html>