

<%@page import="com.learn.mycart1.helper.Helper"%>
<%@page import="com.learn.mycart1.entities.Category"%>
<%@page import="com.learn.mycart1.dao.CategoryDao"%>
<%@page import="java.util.List"%>
<%@page import="com.learn.mycart1.entities.Product"%>
<%@page import="com.learn.mycart1.dao.ProductDao"%>
<%@page import="com.learn.mycart1.helper.FactoryProvider"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>MyCart-Home</title>
        <%@include file="components/common_css_js.jsp" %>
 <style>
.toggle {
  
  border-radius: 5px;
  overflow: hidden;
}
.toggle-header {
  display: flex;
  justify-content: space-between;
  align-items: center;
  background-color: #f1f1f1;
  
  cursor: pointer;
}
.toggle-content {
  display: none;
 
}
.toggle.active .toggle-content {
  display: block;
}
.toggle a {
  margin: 0;
  font-size: 16px;
}
.toggle-btn {
    border: none;
    background-color: #072048;
    cursor: pointer;
    padding: 12px 6px 6px 6px;
}
.toggle-icon {
  display: inline-block;
  width: 10px;
  height: 10px;
  border-top: 2px solid #fff;
  border-right: 2px solid #fff;
  transform: rotate(-45deg);
  transition: transform 0.3s ease;
}
.toggle.active .toggle-icon {
  transform: rotate(135deg);
}

    </style>
    </head>
    <body>

        <%@include file="components/navbar.jsp" %>
        <%@include file="components/slider.jsp" %>
        

        <div class="container-fluid" id="product-home">
            <div class="row mt-3 mx-2">
                <%                    String cat = request.getParameter("category");
//                    out.println(cat);

                    ProductDao dao = new ProductDao(FactoryProvider.getFactory());
                    List<Product> list = null;
                    if (cat == null || cat.trim().equals("all")) {
                        list = dao.getAllProducts();
                    } else {
                        int cid = Integer.parseInt(cat.trim());
                        list = dao.getAllProductsById(cid);
                    }

                    CategoryDao cdao = new CategoryDao(FactoryProvider.getFactory());
                    List<Category> clist = cdao.getCategories();


                %>


                


                <!--show categories-->
                <div class="col-md-2" id="product-home" >

                    <div class="list-group mt-4 toggle">
                        <div class="toggle-header">
                        <a href="index.jsp?category=all#product-home" class="list-group-item list-group-item-action active" aria-current="true">

                            All Products
                            
                        </a>
                          <button class="toggle-btn"><span class="toggle-icon"></span></button>  
                        </div>
<div class="toggle-content">
                        <%                            for (Category c : clist) {
                        %>

                        
                        <a href="index.jsp?category=<%=c.getCategoryId()%>#product-home" class="list-group-item list-group-item-action"><%= c.getCategoryTitle()%></a>

                        <%
                            }
                        %>
                        </div>
                    </div>
                </div>
            
                        <script>
       const toggleBtn = document.querySelector('.toggle-btn');
        const toggleContent = document.querySelector('.toggle-content');
        const toggle = document.querySelector('.toggle');

        toggleBtn.addEventListener('click', () => {
            toggle.classList.toggle('active');
        });

    </script>

                <!--show products-->
                <div class="col-md-10">

                    <!--row-->
                    <div class="row mt-4">

                        <!--col:12-->
                        <div class="col-md-12">

                            <div class="row row-cols-1 row-cols-md-3 g-4">


                                <!--Traversing products-->

                                <%
                                    for (Product p : list) {
                                %>

                                <div class="card product-card">
                                    <div class="container text-center">
                                        <%
                                            String productId = request.getParameter("pId");

                                        %>

                                        <a href="product.jsp?pId=<%= p.getpId()%>" ><img src="img/products/<%=p.getpPhoto()%>" style="max-height: 307px; max-width: 100%; width: auto;" class="card-img-top m-3" alt="..."></a>

                                    </div>

                                    <div class="card-body ">
                                        <h5 class="card-title"><%=p.getpName()%></h5>

                                        <p class="card-text">
                                            <%=Helper.get10Words(p.getpDesc())%>
                                        </p>

                                    </div>

                                    <div class="card-footer text-center">
                                        <button class="btn custom-bg text-white" onclick="add_to_cart(<%=p.getpId()%>, '<%= p.getpName()%>', <%=p.getPriceAfterApplyingDiscount()%>)">Add to Cart</button>
                                        <button class="btn btn-outline-success">&#8377 <%=p.getPriceAfterApplyingDiscount()%>/- <span class="text-secondary discount-label">&#8377 <%=p.getpPrice()%> , <%= p.getpDiscount()%>% off</span></button>

                                    </div>


                                </div>





                                <%

                                    }

                                    if (list.size() == 0) {
                                        out.println("<h3>No item in this category</h3>");
                                    }


                                %>


                            </div>

                        </div>


                    </div>


                </div>

            </div>

        </div>



        <%@include file="components/common_modals.jsp" %>
        <%@include file="components/footer.jsp" %>



    </body>
</html>
