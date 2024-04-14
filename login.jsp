<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Login - MyCart</title>
        <%@include file="components/common_css_js.jsp" %>
        
    </head>
    <body>

        <%@include file="components/navbar.jsp" %>

        <div class="container">
            <div class="row justify-content-center">
                <div class="col-md-6 mt-4">
                    <div class="card">
                        <div class="card-header custom-bg text-center text-white heading">
                            <h3 class="m-0">Login here</h3>
                        </div>
                        <div class="card-body form-container">
    <%@include file="components/message.jsp" %>
    <form name="myForm" action="LoginServlet" method="post" onsubmit="return validateLoginForm()" >
        <div class="mb-3 form-floating">
            <input type="email" name="email" class="form-control" id="email" placeholder="Email">
            <label for="email">Email</label>
        </div>
        <div class="mb-3 form-floating">
            <input type="password" name="password" class="form-control" id="password" placeholder="Password">
            <label for="password">Password</label>
        </div>
        <a href="register.jsp" class="text-center d-block mb-2">if not registered !! click here</a>
        <div class="container text-center">
            <button type="submit" class="btn btn-primary border-0 ">Submit</button>
            <button type="reset" class="btn btn-primary border-0 ">Reset</button>
        </div>
    </form>
     
    
</div>


                    </div>

                </div>

            </div>

        </div>
       
        
    </body>
</html>
