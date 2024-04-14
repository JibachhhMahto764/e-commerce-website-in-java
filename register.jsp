 <%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>New User</title>
        <%@include file="components/common_css_js.jsp" %>
        <style>

    </style>
    </head>
   
    <body>
        <%@include file="components/navbar.jsp" %>

        <div class="container" style="">
            <div class="row justify-content-center ">
                <div class="col-md-6 mt-4 ">
                    <div class="card shadow-lg p-3 mb-5 bg-body-tertiary rounded mt-4 form-container">
                        <%@include file="components/message.jsp" %>

                        <div class="container text-center">
                            <img style="max-width: 100px;" class="img-fluid" src="img/checklist.gif" alt="Register"/>
                        </div>
                        <h3 class="text-center my3 mt-4 animated-heading">Sign up here !!</h3>
                        <div class="card-body ">
                            <form name="registerForm" action="RegisterServlet" method="post" onsubmit="return validateForm()">
                                <div class="mb-3 form-floating">
                                   
                                    <input type="text" name="user_name" class="form-control " id="name" placeholder="User Name" > 
                                     <label for="name" >User Name</label>
                                </div>
                                <div class="mb-3 form-floating">
                                   
                                    <input type="email" name="user_email" class="form-control " id="email" placeholder="User Email" aria-describedby="emailHelp" /> 
                                      <label for="email" >User Email</label>
                                </div>
                                <div class="mb-3 form-floating">
                                   
                                    <input type="password" name="user_password" class="form-control " id="password" placeholder="User Password" aria-describedby="emailHelp">
                                     <label for="password" class="">User Password</label>
                                </div>
                                <div class="mb-3 form-floating">
                                    
                                    <input type="number" name="user_phone" class="form-control " id="phone" placeholder="User Phone" aria-describedby="emailHelp">
                                    <label for="phone" class="">User Phone</label>
                                </div>  
                                <div class="mb-3 form-floating">
                                    
                                    <textarea class="form-control" name="user_address"  style="height: 100px;" id="address" placeholder="User Address"></textarea>
                                    <label for="address" class="">User Address</label>
                                </div> 

                                <div class="container text-center">
                                    <button type="submit" class="btn btn-outline-success">Register</button>
                                    <button type="reset" class="btn btn-outline-warning">Reset</button>
                                </div>
                                

                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
                        <script>
                            window.onload = function() {
  var card = document.querySelector('.card');
  card.style.opacity = 1;
  }

                        </script>     
    </body>
</html>