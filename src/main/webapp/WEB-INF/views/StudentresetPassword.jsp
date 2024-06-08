<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %> 
<!DOCTYPE html>
<html>
	<head>
		<meta charset="ISO-8859-1">
		<title>Student Reset Password</title>
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
                .error-message {
            color: red;
            font-size: 14px;
            margin-top: 5px;
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
        <h1 class="title">Student Reset Password</h1>
        <form:form action="studentsettingpassword" modelAttribute="setpassword">
            <div class="input-group">
                <label for="sid">Id </label>
                <input type="text" id="sid" name="sid" required>
            </div>
            <div class="input-group">
                <label for="spassword">Password:</label>
                <input type="password" id="spassword" name="spassword" required>
                <div class="error-message" id="spassword-error"></div>
            </div>
            <div class="input-group">
                <input type="submit" value="Reset Password">
            </div>
        </form:form>
    </div>
        <script>
        function validateForm() {
            var spassword = document.getElementById("spassword").value;
            
            var spasswordError = document.getElementById("spassword-error");
            spasswordError.innerHTML = "";
            
            var lettersPattern = /^[A-Za-z\s]+$/;

            if (!spassword) {
                spasswordError.innerHTML = "Password is required.";
                return false;
            } else if (!validatePassword(spassword)) {
                spasswordError.innerHTML = "Password must contain at least one uppercase letter, one lowercase letter, one number, one symbol, and be at least 4 characters long.";
                return false;
            }
           
        function validatePassword(password) {
            var pattern = /^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{4,}$/;
            return pattern.test(password);
        }
       
    </script>
    
	</body>
</html>