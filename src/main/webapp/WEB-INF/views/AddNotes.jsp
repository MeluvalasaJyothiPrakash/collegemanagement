<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%> 
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Add Notes</title>
<style>
        /* Container styles */
        .container {
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }

        /* Form styles */
        .form {
            width: 800px;
            background-color: #f1f1f1;
            padding: 20px;
            border-radius: 8px;
            text-align: center;
        }

        .form-header {
            margin-bottom: 20px;
        }

        .form-group {
            margin-bottom: 15px;
            text-align: left;
        }

        .form-group label {
            display: block;
            margin-bottom: 5px;
        }

        .form-group input,
        .form-group textarea {
            width: 100%;
            padding: 8px;
            border-radius: 4px;
            border: 1px solid #ccc;
        }

        .form-group textarea {
            height: 250px;
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

        .form-actions button:hover {
            background-color: #4A148C;
        }
    </style>
    <script>
        function goBack() {
            window.history.back();
        }
    </script>
</head>
<body>
    <div class="container">
        <div class="form">
            <div class="form-header">
                <h2>Add Notes</h2>
            </div>
            <form:form action="newnotes" modelAttribute="note">
                <div class="form-group">
                    <label for="nid">ID</label>
                    <input type="text" id="nid" name="nid" placeholder="Enter notes ID" required>
                </div>
                <div class="form-group">
                    <label for="nsubjectname">Subject Name</label>
                    <input type="text" id="nsubjectname" name="nsubjectname" placeholder="Enter subject name" required>
                </div>
                <div class="form-group">
                    <label for="ntitle">Title</label>
                    <input type="text" id="ntitle" name="ntitle" placeholder="Enter notes title" required>
                </div>
                <div class="form-group">
                    <label for="notesdescription">Description</label>
                    <textarea id="notesdescription" name="notesdescription" placeholder="Enter notes description" required></textarea>
                </div>
                <div class="form-actions">
                    <button type="submit">Submit</button>
                    <button type="button" class="cancel" onclick="goBack()">Cancel</button>
                </div>
            </form:form>
        </div>
    </div>
</body>
</html>