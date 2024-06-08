<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
	<head>
	<meta charset="ISO-8859-1">
	<title>Faculty Dashboard</title>

	    <style>
        *{
            box-sizing: border-box;
        }
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-image: linear-gradient(to right,#FF9800,#E65100);
        }

        .header {
            background-color: #fff5cc;
            color: #ff0040;
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
            background-color: #ff8000;
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

      

        .profile-image {
            width: 50px;
            height: 50px;
            border-radius: 50%;
            object-fit: cover;
            margin-right: 8px;
       
        }
        .file-upload {
            display: inline-block;
            position: relative;
            overflow: hidden;
            vertical-align: middle;
        }

        .file-upload input[type="file"] {
            display: block;
            position: absolute;
            top: 0;
            right: 0;
            opacity: 0;
            font-size: 100px;
            width: 100%;
            height: 100%;
            cursor: pointer;
        }

        .file-upload-label {
            display: inline-block;
            padding: 10px 20px;
            background-color: #008CBA;
            color: #fff;
            border: none;
            border-radius: 4px;
            cursor: pointer;
        }

    </style>
</head>
<body>
    <div class="header">
        <p>Welcome, ${username} </p>
    </div>

    <div class="navbar">
        <ul>
            <li><a href="/facultynotes">Notes</a></li>
            <li><a href="/facultyassignments">Assignments</a></li>
            <li class="dropdown">
                <a href="#">Add</a>
                <div class="dropdown-content">
                    <a href="/addstudent">Student</a>
                    <a href="/addfaculty">Faculty</a>
                </div>
            </li>
            <li class="dropdown">
                <a href="#">View</a>
                <div class="dropdown-content">
                    <a href="/viewstudentslist">Student</a>
                    <a href="/viewfacultieslist">Faculty</a>
                </div>
            </li>
            <li class="dropdown">
            	<a href="/facultyrisecomplaint">Raise Complaint</a>
            </li>
			<li class="dropdown">
            	<a href="#">View Complaints</a>
            	<div class="dropdown-content">
                    <a href="/viewcomplaintonS">On Student</a>
                    <a href="/viewcomplaintonF">On Faculty</a>
                </div>
            </li>
            
            <li class="dropdown">
                <a href="#">My Profile</a>
                <div class="dropdown-content">
                        
                    <a href="/facultyupdateprofile">Update Profile</a>
                    <a href="/facultychangepassword">Change Password</a>
                    <a href="/facultylogout" >Logout</a>
                </div>
            </li>
        
        </ul>
    </div>



</body>
</html>