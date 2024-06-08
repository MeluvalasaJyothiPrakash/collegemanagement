<%@page import="com.collegemanagement.demo.create.Assignments"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Edit Assignments</title>
    <style>
        body {
            font-family: Arial, sans-serif;
        }

        .container {
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;
            height: 100vh;
        }

        .form {
            width: 400px;
            background-color: #f1f1f1;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.2);
        }

        .form-header {
            text-align: center;
            margin-bottom: 20px;
        }

        .form-header h2 {
            color: #333;
            font-size: 24px;
            margin: 0;
        }

        .form-group {
            margin-bottom: 15px;
        }

        .form-group label {
            display: block;
            font-size: 16px;
            color: #333;
            margin-bottom: 5px;
        }

        .form-group input[type="text"],
        .form-group textarea {
            width: 100%;
            padding: 8px;
            font-size: 16px;
            border-radius: 4px;
            border: 1px solid #ccc;
        }

        .form-actions {
            text-align: center;
        }

       .form-actions button {
            padding: 10px 20px;
            background-color: #4A148C;
            color: #fff;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }

        .form-actions button.cancel {
            background-color: red;
            margin-left: 10px;
        }
    </style>
</head>
<body>
    <div class="container">
        <div class="form">
            <div class="form-header">
                <h2>Edit Assignment </h2>
            </div>

            <form:form action="updateassignment" method="post" modelAttribute="uassignment">
			<% List<Assignments> as=(List<Assignments>)request.getAttribute("assig"); 
            for(Assignments i:as){
            %>
                <div class="form-group">
                    
                    <input type="hidden" id="aid" name="aid"  value="<%= i.getAid() %>" required>
                </div>
                <div class="form-group">
                    <label for="assignment-title">Assignment Title</label>
                    <input type="text" id="assignment_title"  name="assignment_title" value="<%= i.getAssignment_title() %>" required>
                </div>
                <div class="form-group">
                    <label for="subject-name">Subject Name</label>
                    <input type="text" id="assignment_subjectname" name="assignment_subjectname" value="<%= i.getAssignment_subjectname() %>" required>
                </div>
                <div class="form-group">
                    <label for="assignment-description">Assignment Description</label>
                    <textarea id="assignment_description"  name="assignment_description"  ><%= i.getAssignment_description() %></textarea>
                </div>
                <div class="form-actions">
                    <button type="submit">Update</button>
                    <button type="button" class="cancel" onclick="goBack()">Cancel</button>
                </div>
                <% } %>
            </form:form>
        </div>
    </div>
    <script>
        function goBack() {
            window.history.back();
        }
    </script>
</body>
</html>