<%-- 
    Document   : login
    Created on : Jun 21, 2021, 3:34:25 PM
    Author     : admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login</title>

        <link rel="stylesheet" type="text/css" href="css/login.css?ts=<?=time()?>" />
        
    <body>
        <div class="container ${requestScope.errorRegister != null?"right-panel-active":""}" id="container">
            <div class="form-container sign-up-container">
                <form action="register" method="post">
                    <h1>Create Account</h1>

                    <span>Make your own Account</span>
                    <input type="username" placeholder="Username" name="user"/>
                    <input type="password" placeholder="Password" name="pass"/>
                    <input type="password" placeholder="Reenter Password" name="rpass"/>
                    <input type="text" placeholder="Your Name" name="name"/>
                    <input type="email" placeholder="Email" name="email"/>
                    <input type="text" placeholder="Phone Number" name="phone"/>
                    <input type="text" placeholder="Address" name="address"/>

                    <h4 style="color: red">${requestScope.errorRegister}</h4>
                    <button>
                        <input class="btn" type="submit" value="REGISTER" onclick="return Validate()"/>
                    </button>
                </form>
            </div>
            <div class="form-container sign-in-container">
                <form action="login" method="post">
                    <h1>Sign in</h1>

                    <span>Use your account</span>
                    <input type="text" placeholder="Username" name="user"/>
                    <input type="password" placeholder="Password" name="pass"/>
                    <h4 style="color: red">${requestScope.errorLogin}</h4>
                    <a href="#">Forgot your password?</a>
                    <button>
                        <input class="btn" type="submit" value="LOGIN"/>
                    </button>
                    <a class="home" href="home1">HOME</a>
                </form>
            </div>
            <div class="overlay-container">
                <div class="overlay">
                    <div class="overlay-panel overlay-left">
                        <h1>Welcome Back!</h1>
                        <p>To keep connected with us please login with your personal info</p>
                        <button class="ghost signIn" id="signIn">Sign In</button>
                    </div>
                    <div class="overlay-panel overlay-right ">
                        <h1>Hello, Friend!</h1>
                        <p>Enter your personal details and start journey with us</p>
                        <button class="ghost signIn" id="signUp">Sign Up</button>
                    </div>
                </div>
            </div>
        </div>

    </body>

    <script src="js/login.js"></script>
</html>
