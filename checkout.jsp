<%
    User user = (User) session.getAttribute("current-user");
    if (user == null) {
        session.setAttribute("message", "You are not logged in !! Login first to access Checkout page");
        response.sendRedirect("login.jsp");
        return;
    }


%>





<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <%@include file="components/common_css_js.jsp" %>

    </head>
    <body>

        <%@include file="components/navbar.jsp" %>

        <div class="container">
            <div class="row">

                <div class="col-md-6">

                    <div class="card mt-4">
                        <div class="card-body">
                            <h3 class="text-center mb-5">Your Selected Items</h3>

                            <div class="cart-body">

                            </div>
                        </div>

                    </div>
                </div>

                <div class="col-md-6">
                    <div class="card mt-4">
                        <div class="card-body">
                            <h3 class="text-center mb-5">Your details for order</h3>

                            <form action="#!">
                                <div class="mb-3">
                                    <label for="exampleInputEmail1" class="form-label">Email address</label>
                                    <input type="email" value="<%=user.getUserEmail()%>" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp">
                                    <div id="emailHelp" class="form-text">We'll never share your email with anyone else.</div>
                                </div>  

                                <div class="mb-3">
                                    <label for="name" class="form-label">Your Name</label>
                                    <input type="text" value="<%=user.getUserName()%>" class="form-control" id="name" aria-describedby="emailHelp">
                                </div> 
                                
                                <div class="mb-3">
                                    <label for="name" class="form-label">Your Phone</label>
                                    <input type="text" value="<%=user.getUserPhone() %>" class="form-control" id="name" aria-describedby="emailHelp" placeholder="Enter Contact number">
                                </div>  


                                <div class="mb-3">
                                    <label for="exampleInputEmail1" class="form-label">Your Shipping Address</label>
                                    <textarea class="form-control"   placeholder="Your address"  style="height: 100px;"></textarea>
                                    
                                </div>

                                <div class="container text-center m-3">
                                    <button class="btn btn-outline-success">Order Now</button>
                                    <button class="btn btn-outline-primary">Continue Shopping</button>

                                </div>

                            </form>

                        </div>

                    </div>
                </div>

            </div>
                                <form action="processPayment" method="post">
    <label for="paymentMethodType">Payment Method Type:</label>
    <input type="text" name="paymentMethodType" required>
    <br>
    <label for="cardNumber">Card Number:</label>
    <input type="text" name="cardNumber" required>
    <br>
    <label for="expirationDate">Expiration Date:</label>
    <input type="text" name="expirationDate" required>
    <br>
    <label for="securityCode">Security Code:</label>
    <input type="text" name="securityCode" required>
    <br>
    <input type="submit" value="Submit Payment">
</form>


        </div>
                                



        <%@include file="components/common_modals.jsp" %>
        
        
    </body>
</html>






















