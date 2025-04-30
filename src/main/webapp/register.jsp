<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Register</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="bg-light">

<div class="container mt-5">
    <div class="row justify-content-center">
        <div class="col-md-6">
            <div class="card shadow rounded-4">
                <div class="card-body">
                    <h3 class="card-title text-center mb-4">Create Your Account</h3>
                    
                     <% String error = (String) request.getAttribute("error"); %>
                    <% if (error != null) { %>
                        <div class="alert alert-danger"><%= error %></div>
                    <% } %>

                    <% String success = (String) request.getAttribute("success"); %>
                    <% if (success != null) { %>
                        <div class="alert alert-success"><%= success %></div>
                    <% } %>
                    

                  

                   <form action="RegisterServlet" method="post" onsubmit="return validateForm()">
                   
                   <div id="errorMessage" class="alert alert-danger d-none" role="alert">
        
    </div>


                        <div class="mb-3">
                            <label for="name" class="form-label">First Name</label>
                            <input type="text" class="form-control" id="firstname" name="firstname" required>
                        </div>
                        
                        <div class="mb-3">
                            <label for="name" class="form-label">Last Name</label>
                            <input type="text" class="form-control" id="lastname" name="lastname" required>
                        </div>
                        
                        <div class="mb-3">
                            <label for="email" class="form-label">Email address</label>
                            <input type="email" class="form-control" id="email" name="email" required>
                        </div>
                        
                        <div class="mb-3">
                            <label for="password" class="form-label">Phone No</label>
                            <input type="text" class="form-control" id="phone" name="phone" required>
                        </div>

                        <div class="mb-3">
                            <label for="password" class="form-label">Password</label>
                            <input type="password" class="form-control" id="password" name="password" required>
                        </div>
                        
                        <div class="mb-3">
                            <label for="password" class="form-label">Confirm Password</label>
                            <input type="password" class="form-control" id="confirmpassword" name="confirmpassword" required>
                        </div>

                         <button type="submit" class="btn btn-primary w-100">
                            <i class="fas fa-sign-in-alt me-2"></i>Register
                        </button>
                        <div class="text-center mt-3">
                            <small>Already have an account? <a href="login.jsp">Login here</a></small>
                        </div>
                        
                    </form>

                </div>
            </div>
        </div>
    </div>
</div>

<script>
function validateForm() {
    var password = document.getElementById("password").value;
    var confirmPassword = document.getElementById("confirmpassword").value;
    var errorDiv = document.getElementById("errorMessage");

    if (password !== confirmPassword) {
        errorDiv.innerHTML = "Passwords do not match. Please try again.";
        errorDiv.classList.remove("d-none"); // show the alert
        return false;
    } else {
        errorDiv.classList.add("d-none"); // hide the alert if previously shown
        return true;
    }
}
</script>

</body>
</html>
