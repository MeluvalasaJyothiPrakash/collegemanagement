<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%> 

<!DOCTYPE html>
<html>
	<head>
	<meta charset="ISO-8859-1">
	<title>Student DashBoard</title>

	    <style>
        *{
            box-sizing: border-box;
        }
        body {
            font-family: Arial, sans-serif;
            background-image: linear-gradient(to right,#abe9cd,#3eadcf);
            margin: 0;
            padding: 0;
        }

        .header {
            background-color: #1affa3;
            color: Red;
            font-weight:bold;
            padding: 10px;
            text-align: right;
        }
        .header p{
            margin-right: 100px;
        }
        .navbar {
            background-color: #000000;
            padding: 10px;
            justify-content: space-between;
        }

        .navbar ul {
            margin: 0;
            padding: 0;
            list-style: none;
            display: flex;
            justify-content: flex-end; /* Align items to the right */
            align-items: center;
        }

        .navbar ul li {
            margin-right: 70px;
           
        }

        .navbar ul li a {
            padding: 10px 20px;
            color: #ffffff;
            text-decoration: none;
        }

        .dropdown-content {
            display: none;
            position: absolute;
            background-color: #1aff1a;
            min-width: 160px;
            box-shadow: 0 8px 16px 0 rgba(0,0,0,0.2);
            z-index: 1;
        }

        .dropdown-content a {
            color: #333;
            padding: 12px 16px;
            text-decoration: none;
            display: block;
        }

        .dropdown:hover .dropdown-content {
            display: block;
        }

    </style>
</head>
<body>
    <div class="header">
        <p>Hello, ${username}</p>
    </div>
	
    <div class="navbar">
        <ul>
            <li><a href="/studentnotes">Notes</a></li>
            <li><a href="/studentassignments">Assignments</a></li>
            <li class="dropdown">
                <a href="#">View</a>
                <div class="dropdown-content">
                    <a href="/displaystudentslist">Student</a>
                    <a href="/displayfacultieslist">Faculty</a>
                </div>
            </li>
            <li class="dropdown">
            	<a href="/studentraisecomplaint">Raise Complaint</a>
            </li>
			<li class="dropdown">
            	<a href="#">View Complaints</a>
            	<div class="dropdown-content">
                    <a href="/viewcomplaintS">On Student</a>
                    <a href="/viewcomplaintF">On Faculty</a>
                </div>
            </li>
            
            <li class="dropdown">
                <a href="#">My Profile</a>
                <div class="dropdown-content">
                        
                    <a href="studentupdateprofile">Update Profile</a>
                    <a href="studentchangepassword">Change Password</a>
                    <a href="#" onclick="logout()">Logout</a>
                </div>
            </li>
        
        </ul>
    </div>

    <script>
        
        function logout(){
        	window.location.href="/StudentLogin";
        }
        
    </script>

</body>
</html>