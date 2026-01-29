<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Register - My Pharmacy</title>
    <style>
        body {
            margin: 0;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background: url('images/img1.png') no-repeat center center fixed;
            background-size: cover;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }

        .register-container {
            width: 900px;
            height: auto;
            background-color: rgba(255, 255, 255, 0.1);
            backdrop-filter: blur(8px);
            border-radius: 20px;
            overflow: hidden;
            box-shadow: 0 8px 32px rgba(0, 0, 0, 0.3);
            display: flex;
        }

        .left-panel {
            flex: 1;
            padding: 50px;
            color: white;
            display: flex;
            flex-direction: column;
            justify-content: center;
        }

        .left-panel h1 {
        color:#1E3A8A;
            font-size: 36px;
            margin-bottom: 10px;
        }

        .left-panel p {
            font-size: 16px;
            line-height: 1.6;
            max-width: 90%;
        }

        .right-panel {
            flex: 1;
            background-color: rgba(255, 255, 255, 0.9);
            padding: 40px;
            border-top-right-radius: 20px;
            border-bottom-right-radius: 20px;
        }

        .right-panel h2 {
        color:#1E3A8A;
            margin-bottom: 20px;
            text-align: center;
        }

        .input-group {
            margin-bottom: 15px;
        }

        .input-group label {
            display: block;
            margin-bottom: 5px;
            font-size: 14px;
            color: #333;
        }

        .input-group input {
            width: 100%;
            padding: 10px;
            font-size: 14px;
            border: 1px solid #ccc;
            border-radius: 8px;
        }

        .submit-btn {
            background-color: #007bff;
            color: white;
            border: none;
            padding: 12px;
            width: 100%;
            border-radius: 8px;
            font-size: 16px;
            cursor: pointer;
        }

        .error-message {
            color: red;
            margin-bottom: 10px;
            display: none;
            font-size: 13px;
        }

        .login-link {
            text-align: center;
            margin-top: 15px;
            font-size: 14px;
        }

        .login-link a {
            color: #007bff;
            text-decoration: none;
        }
        
        .is-invalid {
        border-color: #dc3545;
    	}
    	
    	
    </style>
</head>
<body>
<div class="register-container">
    <div class="left-panel">
        <center><h1>Join eRemedy</h1></center>
        <p>Register now to manage your prescriptions, orders, and access exclusive healthcare tools online.</p>
    </div>

    <div class="right-panel">
        <h2>Create Account</h2>

        <form action="RegisterServlet" method="post" onsubmit="return validateForm()">
            <div id="errorMessage" class="error-message">Passwords do not match.</div>

            <div class="input-group">
                <label>First Name</label>
                <input type="text" name="firstname" required>
            </div>

            <div class="input-group">
                <label>Last Name</label>
                <input type="text" name="lastname" required>
            </div>

            <div class="input-group">
                <label>Email</label>
                <input type="email" id="email" name="email" required>
            </div>

            <div class="input-group">
                <label>Phone Number</label>
                <input type="text" id="phone" name="phone" required>
            </div>

            <div class="input-group">
                <label>Password</label>
                <input type="password" id="password" name="password" required>
            </div>

            <div class="input-group">
                <label>Confirm Password</label>
                <input type="password" id="confirmpassword" name="confirmpassword" required>
            </div>

            <button type="submit" class="submit-btn">Register</button>

            <div class="login-link">
                Already have an account? <a href="login.jsp">Login here</a>
            </div>
        </form>
    </div>
</div>

<script>
function validateForm() {
    // Clear previous error styles
    const inputs = ["email", "phone", "password", "confirmpassword"];
    inputs.forEach(id => document.getElementById(id).classList.remove("is-invalid"));

    let errorMsg = "";
    let isValid = true;

    const email = document.getElementById("email");
    const phone = document.getElementById("phone");
    const password = document.getElementById("password");
    const confirmPassword = document.getElementById("confirmpassword");
    const errorDiv = document.getElementById("errorMessage");

    // Email validation
    const emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
    if (!emailRegex.test(email.value.trim())) {
        email.classList.add("is-invalid");
        errorMsg += "Invalid email format.<br>";
        isValid = false;
    }

    // Phone validation (10 digits)
    const phoneRegex = /^\d{10}$/;
    if (!phoneRegex.test(phone.value.trim())) {
        phone.classList.add("is-invalid");
        errorMsg += "Phone number must be 10 digits.<br>";
        isValid = false;
    }

    // Password length
    if (password.value.length < 6) {
        password.classList.add("is-invalid");
        errorMsg += "Password must be at least 6 characters.<br>";
        isValid = false;
    }

    // Password match
    if (password.value !== confirmPassword.value) {
        confirmPassword.classList.add("is-invalid");
        errorMsg += "Passwords do not match.<br>";
        isValid = false;
    }

    if (!isValid) {
        errorDiv.innerHTML = errorMsg;
        errorDiv.style.display = "block";
    } else {
        errorDiv.style.display = "none";
        errorDiv.innerHTML = "";
    }

    return isValid;
}
</script>

</body>
</html>
