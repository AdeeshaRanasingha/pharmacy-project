<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Login</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">
  <style>
  
  *{
  	margin: 0;
  	box-sizing: border-box;
  }
  
  
body{
    margin: 0;
    display: flex;
    justify-content: center;
    align-items: center;
    height: 100vh;
    background-image: url('images/img1.png');
    background-size: cover;

}

.glass-container{
    width: 300px;
    height: 350px ;
    position: relative ;
    z-index: 1;
    background: rgba(255, 255, 255, 0.1);
    box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
    border-radius: 10px;
    border: 1px solid #fff; 
    
}


.login-box{
    max-width: 250px;
    margin: auto;
    text-align: center;
}

h2{
    color: #fff ;
    margin-top: 30px;
    margin-bottom: -20px;
}

form{
    display: flex;
    flex-direction: column;
    margin-top: 20px;

}

input{
    padding: 10px;
    margin-top: 25px;
    border: none ;
    border-radius: 10px;
    background: transparent ;
    border: 1px solid #fff;
    color: #fff;
    font-size: 13px;
}

input::placeholder{
    color: #fff;
}

input:focus{
    outline: none;
}

.options{
    display: flex;
    align-items: center;
    margin-top: 15px;
    font-size: 12px;
    color: white;
}

.options input{
    margin-right: 5px;
    margin-top: 0px;
}

.options a{
    text-decoration: none;
    color: white;
    margin-left: auto;
}

button{
    background: #fff;
    color: black;
    padding: 10px;
    border: none;
    border-radius: 10px;
    cursor: pointer;
    margin-top: 15px;

}

button:hover{
    background: transparent;
    color: white;
    outline: 1px solid #fff;
}

p{
    font-size: 12px;
    color: #fff;
    margin-top: 15px;
}
  
  
  </style>
</head>
<body>

	<div class="glass-container">
		<div class="login-box">
		<h2>Login</h2>
		<form action="#" method="post">
			<div class="lb1">
				<input type="text" class="username" id="username" name="username" placeholder="Username" required>
			</div>
			<div class="lb1">
				<input type="password" class="username" id="password" name="password" placeholder="Password" required>
			</div>
			
			<div class="options">
				<input type="checkbox" id="remember" name="remember">
				<label for="remember">Remember me</label>
				<a href="#">Forgot Password?</a>
			</div>
			
			<button type="submit">Login</button>
			
			<p>Don't have an account?<a href="register.jsp">Register</a></p>
		</form>
		</div>
	</div>

</body>
</html>