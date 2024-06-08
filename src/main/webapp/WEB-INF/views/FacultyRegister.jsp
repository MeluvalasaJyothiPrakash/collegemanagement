<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %> 
<!DOCTYPE html>
<html>
<head>
	<meta charset="ISO-8859-1">
	<title>Faculty Register</title>
	  <style>
	    *{
	    	box-sizing: border-box;
	    
	    }
        body {
            background-image: linear-gradient(to right,#FF9800,#E65100);
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
        }

        .header {
            background-image: linear-gradient(to right,#2196F3,#0D47A1);
            padding: 10px;
            text-align: right;
            color: white;
        }
        
        .container {
            width: 400px;
            margin: 10px auto;
            padding: 20px;
            background-image: linear-gradient(to bottom right,#faaca8,#ddd6f3);
            border-radius: 5px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.2);
        }
        
        h2 {
            text-align: center;
            margin-bottom: 20px;
        }
        
        label {
            display: block;
            margin-bottom: 8px;
        }
        
        input[type="text"],
        input[type="password"],
        input[type="email"],
        select {
            width: 100%;
            padding: 8px;
            border: 1px solid #ccc;
            border-radius: 4px;
            box-sizing: border-box;
        }
        
        .error-message {
            color: red;
            font-size: 14px;
            margin-top: 5px;
        }
        
        .btn {
            width: 100%;
            padding: 10px;
            background-color: #4A148C;
            color: #fff;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            font-size: 16px;
            text-align: center;
        }
        
        .btn:hover {
            background-color: #45a049;
        }
        
		.homelink{
        	margin-right: 100px;
        	background-color: #ff8080;
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
        <button  class="homelink"><a href="/">Home</a></button>
    </div>
    <div class="container">
        <h2>Faculty Registration</h2>
        <form:form onsubmit="return validateForm()" action="facultyregistered" method="post" modelAttribute="facultyreg">
            <label for="fid">Faculty ID:</label>
            <input type="text" id="fid" name="fid" required>
            <div class="error-message" id="fid-error"></div>
            
            <label for="fname">Name:</label>
            <input type="text" id="fname" name="fname" required>
            <div class="error-message" id="fname-error"></div>
            
            <label for="fmail">Email:</label>
            <input type="email" id="fmail" name="fmail" required>
            <div class="error-message" id="fmail-error"></div>
            
            <label for="fpassword">Password:</label>
            <input type="password" id="fpassword" name="fpassword" required>
            <div class="error-message" id="fpassword-error"></div>
            
            <label for="fphoneno">Phone Number:</label>
            <input type="text" id="fphoneno" name="fphoneno" required>
            <div class="error-message" id="fphoneno-error"></div>
            
            <label for="fdepartment">Department:</label>
            <input type="text" id="fdepartment" name="fdepartment" required>
            <div class="error-message" id="fdepartment-error"></div>
            
            <label for="fgender">Gender:</label>
            <select id="fgender" name="fgender" required>
                <option value="">Select Gender</option>
                <option value="male">Male</option>
                <option value="female">Female</option>
                <option value="other">Other</option>
            </select>
            <div class="error-message" id="fgender-error"></div>
            
            <label for="faddress">Address:</label>
            <input type="text" id="faddress" name="faddress" required>
            <div class="error-message" id="faddress-error"></div>
            
            <button type="submit" class="btn">Register</button>
        </form:form>
        
    </div>
    

    
    <script>
        function validateForm() {
            var fid = document.getElementById("fid").value;
            var fname = document.getElementById("fname").value;
            var fmail = document.getElementById("fmail").value;
            var fpassword = document.getElementById("fpassword").value;
            var fphoneno = document.getElementById("fphoneno").value;
            var fdepartment = document.getElementById("fdepartment").value;
            var fgender = document.getElementById("fgender").value;
            var faddress = document.getElementById("faddress").value;
            
            var fidError = document.getElementById("fid-error");
            fidError.innerHTML = "";
            
            var fnameError = document.getElementById("fname-error");
            fnameError.innerHTML = "";
            
            var fmailError = document.getElementById("fmail-error");
            fmailError.innerHTML = "";
            
            var fpasswordError = document.getElementById("fpassword-error");
            fpasswordError.innerHTML = "";
            
            var fphonenoError = document.getElementById("fphoneno-error");
            fphonenoError.innerHTML = "";
            
            var fdepartmentError = document.getElementById("fdepartment-error");
            fdepartmentError.innerHTML = "";
            
            var fgenderError = document.getElementById("fgender-error");
            fgenderError.innerHTML = "";
            
            var faddressError = document.getElementById("faddress-error");
            faddressError.innerHTML = "";
            
            if (!fid) {
                fidError.innerHTML = "Student ID is required.";
                return false;
            }
            
            var lettersPattern = /^[A-Za-z\s]+$/;

            
            if (!fname) {
                fnameError.innerHTML = "Name is required.";
                return false;
            } else if (!lettersPattern.test(fname)) {
                fnameError.innerHTML = "Name should contain only alphabets and spaces.";
                return false;
            } else if (fname.length <= 5) {
                fnameError.innerHTML = "Name should be at least 6 characters long.";
                return false;
            }
            
            if (!fmail) {
                fmailError.innerHTML = "Email is required.";
                return false;
            }
            
            if (!fpassword) {
                fpasswordError.innerHTML = "Password is required.";
                return false;
            } else if (!validatePassword(fpassword)) {
                fpasswordError.innerHTML = "Password must contain at least one uppercase letter, one lowercase letter, one number, one symbol, and be at least 4 characters long.";
                return false;
            }
            
            if (!fphoneno) {
                fphonenoError.innerHTML = "Phone Number is required.";
                return false;
            } else if (!validatePhoneNumber(fphoneno)) {
                fphonenoError.innerHTML = "Phone Number must be a 10-digit number.";
                return false;
            }
            
            if (!fdepartment) {
            	fdepartmentError.innerHTML = "Department is required.";
                return false;
            } else if (!lettersPattern.test(sfathername)) {
            	fdepartmentError.innerHTML = "Department should contain only alphabets and spaces.";
                return false;
            } else if (sfathername.length <= 5) {
            	fdepartmentError.innerHTML = "Department should be at least 6 characters long.";
                return false;
            }
            
            if (!fgender) {
                fgenderError.innerHTML = "Gender is required.";
                return false;
            }
            

            if (!faddress) {
                faddressError.innerHTML = "Address is required.";
                return false;
            } else if (faddress.length <= 15) {
                faddressError.innerHTML = "Address must be at least 15 characters long.";
                return false;
            }
            
            return true;
        }
        
        function validatePassword(password) {
            var pattern = /^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{4,}$/;
            return pattern.test(password);
        }
        
        function validatePhoneNumber(phoneNumber) {
            var pattern = /^\d{10}$/;
            return pattern.test(phoneNumber);
        }
    </script>

</body>
</html>