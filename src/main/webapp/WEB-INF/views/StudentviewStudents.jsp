<%@page import="com.collegemanagement.demo.create.Student"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@include file="Studentheader.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>View Students</title>
<style type="text/css">
        * {
            box-sizing: border-box;
        }
        
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-image: linear-gradient(to right,#abe9cd,#3eadcf);
        }
        
        table {
            width: 50%;
            border-collapse: collapse;
            margin-top: 20px;
            margin-left: auto;
            margin-right: auto;
            background-image: linear-gradient(to bottom right,#faaca8,#ddd6f3);
        }

        table th,
        table td {
            padding: 10px;
            border: 1px solid #ccc;
        }

        table th {
            background-color: #f1f1f1;
        }

        table td.actions {
            display: flex;
            justify-content: center;
            align-items: center;
        }


</style>
</head>
<body>
	
	
    <table>
        <thead>
            <tr>
                <th>Student ID</th>
                <th>Name</th>
                <th>Email</th>
                <th>Phone Number</th>
                
            </tr>
        </thead>
        <tbody>
       
            <% 
               List<Student> items=(List<Student>)request.getAttribute("list");
                for (Student item : items) {
            %>
            <tr>
                <td><%= item.getSid() %></td>
                <td><%= item.getSname() %></td>
                <td><%= item.getSmail() %></td>
                <td><%= item.getSphoneno() %></td>
                
            </tr>
            <% } %>
            
        </tbody>
    </table>
</body>
</html>