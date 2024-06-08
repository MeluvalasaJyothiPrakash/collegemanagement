<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %> 
<!DOCTYPE html>
<html>
	<head>
		<meta charset="ISO-8859-1">
		<title>Student Forgot Password</title>
		 <style>
		 	  *{
	    	box-sizing: border-box;
	    
	    }
        body {
            font-family: Arial, sans-serif;
            background-image: linear-gradient(to right,#abe9cd,#3eadcf);
            background-color: #f1f1f1;
            margin: 0;
            padding: 0;
        }
        
        .container {
            max-width: 400px;
            margin: 0 auto;
            padding: 20px;
            margin-top:50px;
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
            color: #880E4F
            text-decoration: none;
            margin-left: 10px;
        }
        
        .links a:hover {
            text-decoration: underline;
        }
        
        .header {
            background-color: #e60073;
            padding: 10px;
            color: #fff;
            text-align: right;
            height: 50px;
        }
        
        .homelink{
        	margin-right: 150px;
        	background-color: #8080ff;
        	font-size: large;
        	padding : 5px 10px 5px 10px;
			border-radius: 5px;
			border: 0px;
        }
		.homelink a {
        	text-decoration: none;
        	color: white;
        }
        
    </style>
	</head>
	<body>
	<div class="header">
        <button class="homelink"><a href="/" >Home</a></button>
    </div>
    
    <div class="container">
        <h1 class="title">Forgot Password</h1>
        <form:form action="studentgetpassword" modelAttribute="getpassworddetails" >
        	<div class="input-group">
                <label for="sid">Id :</label>
                <input type="text" id="sid" name="sid" required>
            </div>
            <div class="input-group">
                <label for="smail">Email:</label>
                <input type="email" id="smail" name="smail" required>
            </div>
            
			<div class="input-group">
                <label for="sdob">DOB :</label>
                <input type="date" id="sdob" name="sdob" required>
            </div>
            
            <div class="input-group">
                <input type="submit" value="Reset Password">
            </div>
        </form:form>
        <div class="links">
            <a href="StudentRegister">Register</a>
        </div>
    </div>
	</body>
</html>