<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="ISO-8859-1">
		<title>Login</title>
		    <style>
		    *{
	    	box-sizing: border-box; 
	    }
        body, html {
            height: 100%;
            margin: 0;
            padding: 0;
        }
        
        body {
            font-family: Arial, sans-serif;
           	background-color: #adadeb;
        }
        
        .container {
            min-height: 100%;
            display: flex;
            margin-top: 150px;
            
            flex-direction: column;
            justify-content: space-between;
        }
        
        .header {
            display: flex;
            justify-content: space-between;
            background-image: linear-gradient(to right,#ff6699,#ff3366);
            align-items: center;
            padding: 20px;
            border-bottom: 1px solid #ccc;
        }
        
        .title {
            font-size: 24px;
        }
        
        .login-buttons {
            text-align: center;
        }
        
        .login-button {
            display: inline-block;
            background-color: #eb0707;
            color: #fff;
            padding: 10px 20px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            font-size: 16px;
            margin-left: 20px;
            text-decoration: none;
        }

        
       
        
        .body-content {
            flex-grow: 1;
            
            background-repeat: no-repeat;
            background-position: center;
            background-size: cover;
            text-align: center;
        }
       
    </style>
	</head>
	<body>
	        <div class="header">
	            <h1 class="title">Welcome to College</h1>
	
	        </div>

    	<div class="container">
    		<div class="login-buttons">
            <a href="StudentLogin" class="login-button">Student Login</a>
	        <a href="FacultyLogin" class="login-button">Faculty Login</a>
        	</div>
        	</div>
	</body>
</html>