<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Explore Horizons - Login</title>
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

        .login-container {
            display: flex;
            width: 900px;
            height: 500px;
            background-color: rgba(255, 255, 255, 0.1);
            backdrop-filter: blur(8px);
            border-radius: 20px;
            overflow: hidden;
            box-shadow: 0 8px 32px rgba(0, 0, 0, 0.3);
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
            font-size: 60px;
            margin-bottom: 10px;
        }

        .left-panel p {
        color:#gray;
            font-size: 16px;
            line-height: 1.6;
            max-width: 90%;
        }

        .right-panel {
            flex: 1;
            background-color: rgba(255, 255, 255, 0.85);
            padding: 40px;
            display: flex;
            flex-direction: column;
            justify-content: center;
            border-top-right-radius: 20px;
            border-bottom-right-radius: 20px;
        }

        .right-panel h2 {
            margin-bottom: 20px;
            color: #333;
        }

        .input-group {
            margin-bottom: 15px;
        }

        .input-group label {
            display: block;
            font-size: 14px;
            margin-bottom: 5px;
            color: #555;
        }

        .input-group input {
            width: 100%;
            padding: 12px;
            border: 1px solid #ccc;
            border-radius: 8px;
            font-size: 14px;
        }

        .right-panel .forgot {
            text-align: right;
            font-size: 12px;
            margin-bottom: 20px;
        }

        .right-panel .forgot a {
            text-decoration: none;
            color: #007bff;
        }

        .login-btn {
            background-color: #007bff;
            color: white;
            padding: 12px;
            border: none;
            width: 100%;
            border-radius: 8px;
            font-size: 16px;
            cursor: pointer;
        }

        .or-divider {
            text-align: center;
            margin: 20px 0;
            color: #666;
        }

        .google-btn {
            display: flex;
            align-items: center;
            justify-content: center;
            border: 1px solid #ddd;
            padding: 10px;
            border-radius: 8px;
            cursor: pointer;
            font-size: 14px;
            background-color: white;
        }

        .google-btn img {
            height: 18px;
            margin-right: 10px;
        }

        .signup-link {
            text-align: center;
            margin-top: 15px;
            font-size: 14px;
        }

        .signup-link a {
            color: #007bff;
            text-decoration: none;
        }
    </style>
</head>
<body>
<div class="login-container">
    <div class="left-panel">
        
        <center><h1>eRemedy</h1></center>
        <centewr><p>Trusted Pharmacy at Your Fingertips</p>
        <p>Get genuine medications, wellness products, and more — delivered to your door.Stay safe. Stay healthy.</p>
    </div></center>

    <div class="right-panel">
        <form action="LoginServlet" method="post">
            <h2>Login</h2>

            <div class="input-group">
                <label for="email">Email</label>
                <input type="email" name="email" id="email" placeholder="Enter your email" required>
            </div>

            <div class="input-group">
                <label for="password">Password</label>
                <input type="password" name="password" id="password" placeholder="********" required>
            </div>

            <div class="forgot">
                <a href="#">Forgot password?</a>
            </div>

            <button type="submit" class="login-btn">SIGN IN</button>

            <div class="or-divider">— or —</div>

            

            <div class="signup-link">
                Are you new? <a href="register.jsp">Create an Account</a>
            </div>
        </form>
    </div>
</div>
</body>
</html>
