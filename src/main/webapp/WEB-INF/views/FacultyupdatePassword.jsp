<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %> 
<!DOCTYPE html>
<html>
	<head>
		<meta charset="ISO-8859-1">
		<title>Change Password</title>
		    <style>
		    *{
	    	box-sizing: border-box;
	    
	    }
        body {
            font-family: Arial, sans-serif;
            background-image: linear-gradient(to right,#FF9800,#E65100);
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
            color: #4CAF50;
            text-decoration: none;
            margin-left: 10px;
        }
        
        .links a:hover {
            text-decoration: underline;
        }
        
        .header {
            background-color: #333;
            padding: 10px;
            color: #fff;
            text-align: right;
        }
                .error-message {
            color: red;
            font-size: 14px;
            margin-top: 5px;
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
        <h1 class="title">Student Update Password</h1>
        <form:form onsubmit="return validatePassword();" action="facultyupdatepassword" modelAttribute="updatepassword">
			<div class="input-group">
                <label for="oldpassword">Old Password:</label>
                <input type="password" id="oldpassword" name="oldpassword" required>
                
            </div>
            <div class="input-group">
			    <label for="newPassword">New Password:</label>
			    <input type="password" id="newPassword" name="newPassword" required>
                
            </div>
			<div class="input-group">
			    <label for="confirmPassword">Confirm Password:</label>
			    <input type="password" id="confirmPassword" required>
                    <span id="error" style="color: red;"></span>
            </div>
			<div class="form-actions">
                    <button type="submit">Update Password</button>
                    <button type="button" class="cancel" onclick="goBack()">Cancel</button>
			</div>
        </form:form>
    </div>
 <script>
    function validatePassword() {
      var newPassword = document.getElementById("newPassword").value;
      var confirmPassword = document.getElementById("confirmPassword").value;

      // Check password length
      if (newPassword.length < 4) {
        document.getElementById("error").innerHTML = "Password should be at least 4 characters long.";
        return false;
      }

      // Check password pattern
      var passwordPattern = /^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[!@#$%^&*()])[a-zA-Z\d!@#$%^&*()]+$/;
      if (!passwordPattern.test(newPassword)) {
        document.getElementById("error").innerHTML = "Password should contain at least one uppercase letter, one lowercase letter, one digit, and one symbol.";
        return false;
      }

      // Check if passwords match
      if (newPassword != confirmPassword) {
        document.getElementById("error").innerHTML = "Passwords do not match!";
        return false;
      }

      // Passwords match, continue with form submission
      return true;
    }
    
    function goBack() {
        window.history.back();
    }
  </script>
    
	</body>
</html>