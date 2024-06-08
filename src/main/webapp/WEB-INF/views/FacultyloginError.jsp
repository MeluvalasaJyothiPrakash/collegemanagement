<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %> 
<!DOCTYPE html>
<html>
	<head>
		<meta charset="ISO-8859-1">
		<title>Faculty Login</title>
		    <style>
		    *{
	    	box-sizing: border-box;
	    
	    }
        body {
            font-family: Arial, sans-serif;`1
            margin: 0;
            padding: 0;
            background-image: linear-gradient(to right,#FF9800,#E65100);
        }
        
        .container {
            max-width: 400px;
            margin: 50px auto;
            padding: 20px;
            
            background-image: linear-gradient(to bottom right,#faaca8,#ddd6f3);
            border-radius: 5px;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
        }
        
        .title {
            text-align: center;
            font-size: 24px;
            margin-bottom: 20px;
        }
        
        .input-group {
            margin-bottom: 15px;
        }
        
        .input-group label {
            display: block;
            font-weight: bold;
            margin-bottom: 5px;
        }
        
        .input-group input {
            width: 100%;
            padding: 10px;
            border: 1px solid #ccc;
            border-radius: 4px;
            box-sizing: border-box;
        }
        
        .input-group input[type="submit"] {
            background-color: #4A148C;
            color: #fff;
            cursor: pointer;
        }
        
        .input-group input[type="submit"]:hover {
            background-color: #4A148C;
        }
        
        .links {
            text-align: center;
            margin-top: 10px;
        }
        
        .links a {
            color: #880E4F;
            text-decoration: none;
            margin-left: 10px;
        }
        
        .links a:hover {
            text-decoration: underline;
        }
        
        .header {
            background-image: linear-gradient(to right,#2196F3,#0D47A1);
            padding: 10px;
            color: #fff;
            text-align: right;
            height: 50px;
        }
        .error{
        color: red;
        }
        
    </style>
	</head>
	<body>
	<div class="header">
        <span>Hi Faculty</span>
    </div>
    
    <div class="container">
        <h1 class="title">Faculty Login</h1>
        <div class="error">${error}</div>
        <form:form action="facultylogin" modelAttribute="facultylogindetails">
            <div class="input-group">
                <label for="fmail">Email:</label>
                <input type="email" id="fmail" name="fmail" required>
            </div>
            <div class="input-group">
                <label for="fpassword">Password:</label>
                <input type="password" id="fpassword" name="fpassword" required>
            </div>
            <div class="input-group">
                <input type="submit" value="Login">
            </div>
        </form:form>
        <div class="links">
            <a href="facultyforgotpassword">Forgot Password</a>
            <a href="FacultyRegister">Register</a>
        </div>
    </div>

	</body>
</html>