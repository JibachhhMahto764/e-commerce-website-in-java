
<%@page import="com.learn.mycart1.helper.FactoryProvider"%>
<%@page import="com.learn.mycart1.entities.Product"%>
<%@page import="com.learn.mycart1.dao.ProductDao"%>
<%
    // Get the product ID from the request parameter
    int productId;
    try {
        productId = Integer.parseInt(request.getParameter("pId"));
    } catch (NumberFormatException e) {
        productId = -1; // or some other default value
    }
    
    // Get the product from the database
    ProductDao productDaos = new ProductDao(FactoryProvider.getFactory());
    Product product = productDaos.getProductById(productId);
%>
<html>
<head>
    <title>Product View</title>
     <%@include file="components/common_css_js.jsp" %>
</head>
<body>
     <%@include file="components/navbar.jsp" %>
    <% if (product == null) { %>
        <p>Product not found</p>
    <% } else { %>
 <div class=" container-fluid mt-4">
     <div class="row">
         <div class="col-md-6">
            <div class="product-photo">
                <img src="img/products/<%= product.getpPhoto() %>" alt="Product Image">
            </div>
         </div>
         <div class="col-md-6">   
            <div class="product-text">
                  <div class="product-id">ID: <%= product.getpId() %></div>
                  <div class="product-name"> <%= product.getpName() %></div>
                  <div class="product-description"> <%= product.getpDesc() %></div>
                  <div class="product-price">Price: <%= product.getpPrice() %></div>
                  <div class="product-price">Price: <%= product.getCategory() %></div>
                  <p class="product-rating">4.3 <i class="fas fa-star"></i></p>
                  <button class="btn custom-bg text-white" onclick="add_to_cart(<%=product.getpId()%>, '<%= product.getpName()%>', <%=product.getPriceAfterApplyingDiscount()%>)">Add to Cart</button>
            </div>
         </div>
       <div>      
</div>
            
    <% } %>
    
    
    <script src="https://kit.fontawesome.com/2c36e9b7b1.js" crossorigin="anonymous"></script>
   
</body>
</html>
