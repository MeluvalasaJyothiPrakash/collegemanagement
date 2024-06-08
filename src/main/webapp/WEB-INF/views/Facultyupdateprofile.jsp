<%@page import="com.collegemanagement.demo.create.Faculty"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %> 
<!DOCTYPE html>
<html>
<head>
	<meta charset="ISO-8859-1">
	<title>Update Profile</title>
	  <style>
	    *{
	    	box-sizing: border-box;
	    
	    }
        body {
            background-image: linear-gradient(to right,#FF9800,#E65100);
            font-family: Arial, sans-serif;
        }
        
        .container {
            width: 400px;
            margin: 0 auto;
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
        <h2>Update Your Profile</h2>
        <form:form onsubmit="return validateForm()" action="updatedetails" modelAttribute="facultyupdate">
            <% List<Faculty> det=(List<Faculty>)session.getAttribute("details");
            for(Faculty df:det){
            %>
            <input type="hidden" id="fid" name="fid" value="<%= df.getFid() %>"  required>
            
            <label for="fname">Name:</label>
            <input type="text" id="fname" name="fname" value="<%= df.getFname() %>"  required>
            <div class="error-message" id="fname-error"></div>
            
            <label for="fmail">Email:</label>
            <input type="email" id="fmail" name="fmail" value="<%= df.getFmail() %>" required>
            <div class="error-message" id="fmail-error"></div>

            
            <label for="fphoneno">Phone Number:</label>
            <input type="text" id="fphoneno" name="fphoneno" value="<%= df.getFphoneno() %>"  required>
            <div class="error-message" id="fphoneno-error"></div>
            
            <label for="fdepartment">Department:</label>
            <input type="text" id="fdepartment" name="fdepartment" value="<%= df.getFdepartment() %>" required>
            <div class="error-message" id="fdepartment-error"></div>
            
            
            <label for="faddress">Address:</label>
            <input type="text" id="faddress" name="faddress" value="<%= df.getFaddress() %>" required>
            <div class="error-message" id="faddress-error"></div>
            
            <div class="form-actions">
                    <button type="submit">Updat Profile</button>
                    <button type="button" class="cancel" onclick="goBack()">Cancel</button>
			</div>
            <% } %>
        </form:form>
        
    </div>
    
    <script>
        function validateForm() {
            var fid = document.getElementById("fid").value;
            var fname = document.getElementById("fname").value;
            var fmail = document.getElementById("fmail").value;
            var fphoneno = document.getElementById("fphoneno").value;
            var fdepartment = document.getElementById("fdepartment").value;
            var faddress = document.getElementById("faddress").value;
            
            var fidError = document.getElementById("fid-error");
            fidError.innerHTML = "";
            
            var fnameError = document.getElementById("fname-error");
            fnameError.innerHTML = "";
            
            var fmailError = document.getElementById("fmail-error");
            fmailError.innerHTML = "";

            
            var fphonenoError = document.getElementById("fphoneno-error");
            fphonenoError.innerHTML = "";
            
            var fdepartmentError = document.getElementById("fdepartment-error");
            fdepartmentError.innerHTML = "";
            

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
            
            

            if (!faddress) {
                faddressError.innerHTML = "Address is required.";
                return false;
            } else if (faddress.length <= 15) {
                faddressError.innerHTML = "Address must be at least 15 characters long.";
                return false;
            }
            
            return true;
        }
        
        
        function validatePhoneNumber(phoneNumber) {
            var pattern = /^\d{10}$/;
            return pattern.test(phoneNumber);
        }
        
        function goBack() {
            window.history.back();
        }
    </script>

</body>
</html>