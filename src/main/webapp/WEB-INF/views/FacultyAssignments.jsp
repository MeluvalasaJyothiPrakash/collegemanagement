<%@page import="com.collegemanagement.demo.create.Assignments"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%> 
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Assignments</title>
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
            background-color: #4A148C;
            color: #fff;
            border: none;
            border-radius: 4px;
            cursor: pointer;
        }
    
        button:hover {
            background-color: #4A148C;
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
		.delete-btn {
            background-color: red;
        }
       	.add{
       	text-align: center;
       	}
    </style>
        <script type="text/javascript">
    function openDescription(description) {
        const newTab = window.open('', '_blank');
        newTab.document.write(description);
        newTab.document.close();
    }
    </script>
</head>

<body>


    <table>
        <tr>
            <th>ID</th>
            <th>Title</th>
            <th>Subject</th>
            <th>View</th>
            <th>Edit</th>
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
            <td class="action-buttons">
               <a href="#" class="view-btn" onclick="openDescription('<%= item.getAssignment_description()%>')">View</a>
            </td>        
            <td>
			<form:form action="editassignment"  modelAttribute="editaid" >
					<input type="hidden" name="aid" id="aid" value="<%= item.getAid() %>"/>
					<button class="edit-btn" type="submit">Edit</button>
                </form:form>
		    </td>
            <td>
				<form action="deleteassignment" method="post" >
                    <input type="hidden" name="id" value="<%= item.getAid() %>" />
                    <button type="submit" class="delete-btn">Delete</button>
                </form>
		    </td>
            </tr>
            <% } %>

    </table>
    <div class="add">
    <a href="/addassignment"><button>New Assignment</button></a>
    </div>

</body>
</html>