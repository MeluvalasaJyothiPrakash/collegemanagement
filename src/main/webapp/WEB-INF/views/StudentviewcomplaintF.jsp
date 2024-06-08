<%@page import="com.collegemanagement.demo.create.Complaints"%>
<%@page import="com.collegemanagement.demo.create.Assignments"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>View Complaints On Faculties</title>
<%@include file="Studentheader.jsp" %>
 <style>
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
            margin: 20px auto;
            text-align: center;
            border-collapse: collapse;
            background-image: linear-gradient(to bottom right,#faaca8,#ddd6f3);
        }
    
        th,
        td {
            padding: 10px;
            border: 1px solid #ccc;
        }
    
        button {
            padding: 8px 16px;
            background-color: #4CAF50;
            color: #fff;
            border: none;
            border-radius: 4px;
            cursor: pointer;
        }
    
        button:hover {
            background-color: #45a049;
        }
                .action-buttons {
            
            justify-content: center;
            align-items: center;
        }

        .action-buttons a {
            margin-right: 5px;
            padding: 8px 16px;
            color: #fff;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            text-decoration: none;
            text-align: center;
            transition: background-color 0.3s ease;
        }
        .view-btn {
            background-color: #ff9800;
        }
       	.add{
       	text-align: center;
       	}
    </style>
</head>

<body>


    <table>
        <tr>
            <th>ID</th>
            <th>Name</th>
            <th>Complaint</th>
        </tr>
        <%-- Iterate over the list of items and generate table rows dynamically --%>
		 <%
            	List<Complaints> items=(List<Complaints>)request.getAttribute("list");
      
                for (Complaints item : items) {
            %>
            <tr>
            <td><%= item.getFid() %></td>	
            <td><%= item.getFname() %></td>	
            <td><%= item.getComplaints()%></td>	
            </tr>
            <% } %>

    </table>


</body>
</html>