<%@page import="com.collegemanagement.demo.create.Faculty"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>View Faculties</title>
<%@include file="Studentheader.jsp" %>
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
                <th>Faculty ID</th>
                <th>Name</th>
                <th>Phone Number</th>
                <th>Department</th>

            </tr>
        </thead>
        <tbody>
        
            <%
            	List<Faculty> items=(List<Faculty>)request.getAttribute("list");
            
                for (Faculty item : items) {
            %>
            <tr>
                <td><%= item.getFid() %></td>
                <td><%= item.getFname() %></td>
                <td><%= item.getFphoneno() %></td>
                <td><%= item.getFdepartment() %></td>
            </tr>
            <% } %>
        </tbody>
    </table>
</body>
</html>