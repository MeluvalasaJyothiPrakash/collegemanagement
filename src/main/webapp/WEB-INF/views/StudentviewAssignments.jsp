<%@page import="com.collegemanagement.demo.create.Assignments"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>View Assignments</title>
<%@include file="Studentheader.jsp" %>
 <style>
        *{
            box-sizing: border-box;
        }
        
        body {
            font-family: Arial, sans-serif;
            background-image: linear-gradient(to right,#abe9cd,#3eadcf);
            margin: 0;
            padding: 0;
        }
        table {
            width: 70%;
            margin: 20px auto;
            text-align: center;
            background-image: linear-gradient(to bottom right,#faaca8,#ddd6f3);
            border-collapse: collapse;
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
        .download-btn {
            background-color: #008CBA;
        }

        .view-btn {
            background-color: #ff9800;
        }

    </style>
</head>

<body>


    <table>
        <tr>
            <th>ID</th>
            <th>Title</th>
            <th>Subject</th>
            <th>Description</th>
            <th>View</th>
            <th>Delete</th>
        </tr>
        <%-- Iterate over the list of items and generate table rows dynamically --%>
		 <%
            	List<Assignments> items=(List<Assignments>)request.getAttribute("list");
            
                for (Assignments item : items) {
            %>
            <tr>
            <td><%= item.getAid() %></td>	
            <td><%= item.getAssignment_title() %></td>	
            <td><%= item.getAssignment_subjectname()%></td>	
            <td><%= item.getAssignment_description() %></td>
            <td class="action-buttons">
               <a href="#" class="view-btn" onclick="openDescription('<%= item.getAssignment_description()%>')">View</a>
            </td>        
            <td class="action-buttons">
                    <a href="#" class="download-btn" onclick="downloadTextFile('<%= item.getAssignment_description() %>', '<%= item.getAssignment_title() %>.txt')")">Download</a>
            </td>
            </tr>
            <% } %>

    </table>

    <script type="text/javascript">
    
    function downloadTextFile(text, filename) {
        var element = document.createElement('a');
        element.setAttribute('href', 'data:text/plain;charset=utf-8,' + encodeURIComponent(text));
        element.setAttribute('download', filename);
        element.style.display = 'none';
        document.body.appendChild(element);
        element.click();
        document.body.removeChild(element);
    }
    
    function openDescription(description) {
        const newTab = window.open('', '_blank');
        newTab.document.write(description);
        newTab.document.close();
    }
    
    </script>

</body>
</html>