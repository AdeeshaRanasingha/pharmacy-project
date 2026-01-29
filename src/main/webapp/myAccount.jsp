<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="Model.UserModel" %>
<%
    UserModel user = (UserModel) session.getAttribute("user");
    if (user == null) {
        response.sendRedirect("login.jsp");
        return;
    }
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>My Account</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        .sidebar {
            background-color: #f8f9fa;
            height: 100%;
            padding: 20px;
            border-radius: 15px;
        }
        .sidebar img {
            width: 100px;
            height: 100px;
            object-fit: cover;
            margin-bottom: 10px;
        }
        .content-area {
            background-color: #ffffff;
            padding: 20px;
            border-radius: 15px;
            box-shadow: 0 0 10px rgba(0,0,0,0.1);
        }
        .save-btn {
            background-color: black;
            color: white;
        }
    </style>
</head>
<body class="bg-light">

<jsp:include page="header.jsp" />

<div class="container mt-5">
    <div class="row">
        <!-- Sidebar -->
        <div class="col-md-3 sidebar text-center">
            <img src="https://cdn-icons-png.flaticon.com/512/847/847969.png" class="rounded-circle" alt="Profile Picture">
<<<<<<< Updated upstream
            <h5 class="mt-3">Edit Profile</h5>
            <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit.</p>
            <form action="DeleteAccountServlet" method="post">
=======
            <h5 class="mt-3"><%= user.getFirstname() %> <%= user.getLastname() %></h5>
            <p><strong>Email:</strong> <%= user.getEmail() %></p>
            <p><strong>Phone:</strong> <%= user.getPhone() %></p>
            

            <form action="DeleteAccountServlet" method="post" class="mt-3">
>>>>>>> Stashed changes
                <input type="hidden" name="userID" value="<%= user.getUserID() %>">
                <button type="submit" class="btn btn-danger w-100" onclick="return confirm('Are you sure you want to delete your account?')">Delete Account</button>
            </form>
        </div>

        <!-- Content Area -->
        <div class="col-md-9">
            <div class="content-area">

<<<<<<< Updated upstream
                <% String message = (String) request.getAttribute("message"); %>
                <% if (message != null) { %>
                    <div class="alert alert-info"><%= message %></div>
                <% } %>

                <!-- Update Account Info -->
                <h4>Account Information</h4>
                <form action="UpdateAccountServlet" method="post" class="row g-3">
=======
				<% 
				    String message = (String) request.getAttribute("message");
				    String error = (String) request.getAttribute("error");
				%>
				<% if (message != null) { %>
				    <div id="messageAlert" class="alert alert-success"><%= message %></div>
				<% } else if (error != null) { %>
				    <div id="errorAlert" class="alert alert-danger"><%= error %></div>
				<% } %>

                <!-- Update Account Information -->
                <h4>Account Information</h4>
                <form id="updateAccountForm" action="UpdateAccountServlet" method="post" class="row g-3">
>>>>>>> Stashed changes
                    <input type="hidden" name="userID" value="<%= user.getUserID() %>">

                    <div class="col-md-6">
                        <label class="form-label">First Name</label>
                        <input type="text" name="firstname" class="form-control" value="<%= user.getFirstname() %>" required>
                    </div>
                    
                    <div class="col-md-6">
                        <label class="form-label">Last Name</label>
                        <input type="text" name="lastname" class="form-control" value="<%= user.getLastname() %>" required>
                    </div>

                    <div class="col-md-6">
                        <label class="form-label">Phone Number</label>
<<<<<<< Updated upstream
                        <input type="text" name="phone" class="form-control" value="<%= user.getPhone() %>" required>
                    </div>

                    <div class="col-md-6">
                        <label class="form-label">Email</label>
                        <input type="email" name="email" class="form-control" value="<%= user.getEmail() %>" required>
                    </div>


=======
                        <input type="tel" name="phone" class="form-control" value="<%= user.getPhone() %>" >
                    </div>

                    <div class="col-md-6">
                        <label class="form-label">Email</label>
                        <input type="email" name="email" class="form-control" value="<%= user.getEmail() %>" >
                    </div>

>>>>>>> Stashed changes
                    <div class="col-12 text-end">
                        <button type="submit" class="btn save-btn"><b>Save Changes</b></button>

                    </div>
                </form>

                <hr>

                <!-- Change Password -->
                <h4>Change Password</h4>
<<<<<<< Updated upstream
                <form action="UpdatePasswordServlet" method="post" class="row g-3">
=======
                <form id="updatePasswordForm" action="UpdatePasswordServlet" method="post" class="row g-3">
>>>>>>> Stashed changes
                    <input type="hidden" name="userID" value="<%= user.getUserID() %>">

                    <div class="col-12">
                        <label class="form-label">Current Password</label>
                        <input type="password" name="currentPassword" class="form-control" required>
                    </div>

                    <div class="col-md-6">
                        <label class="form-label">New Password</label>
                        <input type="password" name="newPassword" class="form-control" required minlength="6">
                    </div>

                    <div class="col-md-6">
                        <label class="form-label">Confirm Password</label>
                        <input type="password" name="confirmPassword" class="form-control" required>
                    </div>

                    <div class="col-12 text-end">
                        <button type="submit" class="btn save-btn"><b>Save Changes</b></button>
                    </div>
                </form>

            </div>
        </div>
    </div>
</div>
<jsp:include page="footer.jsp" />

<script>
    document.addEventListener("DOMContentLoaded", function () {
        // Validate account update form
        document.getElementById("updateAccountForm").addEventListener("submit", function (e) {
            const email = this.email.value.trim();
            const phone = this.phone.value.trim();

            const emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
            const phoneRegex = /^\d{10}$/;

            if (!emailRegex.test(email)) {
                alert("Please enter a valid email address.");
                e.preventDefault();
                return;
            }

            if (!phoneRegex.test(phone)) {
                alert("Please enter a valid 10-digit phone number.");
                e.preventDefault();
                return;
            }
        });

        // Validate password change form
        document.getElementById("updatePasswordForm").addEventListener("submit", function (e) {
            const newPassword = this.newPassword.value;
            const confirmPassword = this.confirmPassword.value;

            if (newPassword.length < 6) {
                alert("New password must be at least 6 characters long.");
                e.preventDefault();
                return;
            }

            if (newPassword !== confirmPassword) {
                alert("New password and confirm password do not match.");
                e.preventDefault();
                return;
            }
        });
    });
    
    
    
 // Auto-hide alerts after 4 seconds
    setTimeout(() => {
        const successAlert = document.getElementById("messageAlert");
        const errorAlert = document.getElementById("errorAlert");
        if (successAlert) successAlert.style.display = "none";
        if (errorAlert) errorAlert.style.display = "none";
    }, 1500); 
</script>



</body>
</html>
