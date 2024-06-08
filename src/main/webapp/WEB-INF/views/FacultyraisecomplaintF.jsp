<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Raise Complaint</title>
    <style>
        /* Container styles */
        .container {
            display: flex;
            justify-content: center;
            align-items: center;
            background-image: linear-gradient(to bottom right,#faaca8,#ddd6f3);
            height: 100vh;
        }

        /* Form styles */
        .form {
            width: 400px;
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

        .form-actions {
            text-align: center;
        }

        .form-actions button {
            padding: 10px 20px;
            background-color: red;
            color: #fff;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }

        .form-actions button.cancel {
            background-color: #ccc;
            margin-left: 10px;
        }

        .form-actions button:hover {
            background-color: red;
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
                <h2>Raise Complaint </h2>
            </div>
            <form:form action="facultycomplaint"  modelAttribute="complaintF">
                <div class="form-group">
                    <label for="fid">ID</label>
                    <input type="text" id="fid" name="fid" placeholder="Enter your ID" required>
                </div>
                <div class="form-group">
                    <label for="fname">Full Name</label>
                    <input type="text" id="fname" name="fname" placeholder="Enter your full name" required>
                </div>
                
	             <div class="form-group">  
				<label for="category">Raise On</label>
	            <select id="category" name="category" required>
	                <option value="">Select Category</option>
	                <option value="Faculty">Faculty</option>
	                <option value="Student">Student</option>
	            </select>
	            </div>
                <div class="form-group">
                    <label for="complaints">Complaints</label>
                    <textarea id="complaints" name="complaints"  placeholder="Enter your complaints" required></textarea>
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