<%@page import="com.collegemanagement.demo.create.Assignments"%>
<%@page import="com.collegemanagement.demo.create.Notes"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

 <%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>   
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Notes</title>
	    <%@include file="Facultyheader.jsp" %>
    <style>
        * {
            box-sizing: border-box;
        }
        
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-image: linear-gradient(to right,#FF9800,#E65100);
        }
        table {
            width: 80%;
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
        .action-buttons a {
            margin-right: 5px;
            padding: 8px 16px;
            color: #fff;
            background-color: #4A148C;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            text-decoration: none;
            text-align: center;
            transition: background-color 0.3s ease;
        }
    
        .view-btn {
            background-color: #ff8000;
        }
		.edit-btn {
            background-color: #0000ff;
        }
        .delete-btn {
            background-color: red;
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
            <th>Title</th>
            <th>Subject Name</th>
            <th>Edit</th>
            <th>View</th>
            <th>Delete</th>
        </tr>
        <%
            	List<Notes> items=(List<Notes>)request.getAttribute("list");
            
                for (Notes item : items) {
            %>
            <tr>
            
            <td><%= item.getNid()%></td>	
            <td><%= item.getNtitle()%></td>	
            <td><%= item.getNsubjectname() %></td>
			<td>
			<form:form action="editnotes"  modelAttribute="editnid" >
					<input type="hidden" name="eid" id="eid" value="<%= item.getNid() %>"/>
					<button class="edit-btn" type="submit">Edit</button>
            </form:form>
		    </td>
			<td class="action-buttons">
                <a href="#" class="view-btn" onclick="openNotes('<%= item.getNotesdescription()%>')">View </a>
            </td> 
			<td>
				<form action="deletenotes" method="post" >
					<input type="hidden" name="id" value="<%= item.getNid() %>" />
					<button class="delete-btn" type="submit">Delete</button>
                </form>
		    </td>
       
            </tr>
            <% } %>

    </table>
    <div class="add">
    <a href="/addnotes"><button>New Notes</button></a>
    </div>
    <script>
    function openNotes(description) {
        const newTab = window.open('', '_blank');
        newTab.document.write(description);
        newTab.document.close();
    }
    </script>
   </body>
</html>