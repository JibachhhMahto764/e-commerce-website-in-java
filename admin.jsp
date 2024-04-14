<%@page import="com.learn.mycart1.helper.Helper"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.List"%>
<%@page import="com.learn.mycart1.entities.Category"%>
<%@page import="com.learn.mycart1.helper.FactoryProvider"%>
<%@page import="com.learn.mycart1.dao.CategoryDao"%>
<%@page import="com.learn.mycart1.entities.User"%>
<%
    User user = (User) session.getAttribute("current-user");
    if (user == null) {
        session.setAttribute("message", "You are not logged in !! Login first");
        response.sendRedirect("login.jsp");
        return;
    } else {
        if (user.getUserType().equals("normal")) {
            session.setAttribute("message", "You are not admin ! Do not access this page");
            response.sendRedirect("login.jsp");
            return;
        }
    }
    
%>



<%    CategoryDao cdao = new CategoryDao(FactoryProvider.getFactory());
    List<Category> list = cdao.getCategories();
    

    //getting count
    Map<String,Long> m=Helper.getCounts(FactoryProvider.getFactory());
    
%>







<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Admin Panel</title>
        <%@include file="components/common_css_js.jsp" %>
        <style>
            .admin .card{
                border: none;

            }
            .admin .card:hover{
                background: #e2e2e2;
                cursor: pointer;
            }
          .card-body {
  background-color: #ffffff;
  color: #000000;
  transition: all 0.3s ease-in-out;
  border-radius: 10px;
}

.card-body:hover {
  background-color: #2b4e87;
  color: #ffffff;
  transform: scale(1.05);
}

.card-body h1 {
  font-size: 64px;
  font-weight: bold;
  margin-top: 20px;
  margin-bottom: 10px;
}

.card-body h1.text-muted {
  font-size: 24px;
  font-weight: normal;
  margin-top: 0;
}

.card-body img {
  margin-top: 20px;
  margin-bottom: 10px;
  transition: all 0.8s ease-in-out;
}

.card-body:hover img {
  transform: rotate(360deg);
}



        </style>

    </head>
    <body>
        <%@include file="components/navbar.jsp" %>


        <div class="container admin">

            <div class="container-fluid mt-3">
                <%@include file="components/message.jsp" %>

            </div>


            <!--first row-->
            <div class="row mt-4 d-flex flex-wrap card-group">

                <!--1st col-->
                <div class="col-md-4 ">
                    <div class="card text-center shadow-lg">
                        <div class="card-body">

                            <div class="container">
                                <img style="max-width: 150px; border-radius: 70px;" class="container-fluid rounded-cicles" src="img/seo-and-web.png" alt="user_image"> 
                            </div>
                            <h1><%=m.get("userCount")%></h1>
                            <h1 class="text-uppercase text-muted">Users</h1>
                        </div>
                    </div>
                </div>

                <!--2nd col-->
                <div class="col-md-4">
                    <div class="card text-center shadow-lg">
                        <div class="card-body">
                            <div class="container">
                                <img style="max-width: 150px; border-radius: 70px;" class="container-fluid rounded-cicles" src="img/list.png" alt="category_image"> 
                            </div>
                            <h1><%= list.size() %></h1>
                            <h1 class="text-uppercase text-muted">Categories</h1>
                        </div>
                    </div>
                </div>

                <!--3rd col-->
                <div class="col-md-4">
                    <div class="card text-center shadow-lg">
                        <div class="card-body">
                            <div class="container">
                                <img style="max-width: 150px; border-radius: 70px;" class="container-fluid rounded-cicles" src="img/product.png" alt="product_image"> 
                            </div>
                            <h1><%=m.get("productCount") %></h1>
                            <h1 class="text-uppercase text-muted">Products</h1>
                        </div>
                    </div>
                </div>
            </div>

            <!--second row-->
            <div class="row mt-4">

                <!--second row 1st col-->
                <div class="col-md-6">
                    <div class="card text-center shadow-lg" data-bs-toggle="modal" data-bs-target="#add-category-modal">
                        <div class="card-body">
                            <div class="container">
                                <img style="max-width: 150px; border-radius: 70px;" class="container-fluid rounded-cicles" src="img/keys.png" alt="category_image"> 
                            </div>
                            <p class="mt-2">Click here to add category</p>
                            <h1 class="text-uppercase text-muted">Categories</h1>
                        </div>
                    </div>
                </div>


                <!--second row 2nd col-->
                <div class="col-md-6">
                    <div class="card text-center shadow-lg" data-bs-toggle="modal" data-bs-target="#add-product-modal">
                        <div class="card-body">
                            <div class="container">
                                <img style="max-width: 150px; border-radius: 70px;" class="container-fluid rounded-cicles" src="img/plus.png" alt="product_image"> 
                            </div>
                            <p class="mt-2">Click here to add product</p>
                            <h1 class="text-uppercase text-muted">Products</h1>
                        </div>
                    </div>
                </div>

            </div>

        </div>  


        <!--add category start--> 
        <!-- Button trigger modal -->
        <!--        <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#add-category-modal">
                    Launch demo modal
                </button>-->

        <!-- Modal -->
        <div class="modal fade" id="add-category-modal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog modal-lg">
                <div class="modal-content">
                    <div class="modal-header custom-bg text-white">
                        <h1 class="modal-title fs-5" id="exampleModalLabel">Fill Category Details</h1>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">


                        <form action="ProductOperationServlet" method="post">

                            <input type="hidden" name="operation" value="addcategory">
                            <div class="form-group">
                                <input type="text" class="form-control" name="catTitle" placeholder="Enter Category Title" required />

                            </div>
                            <div class="form-group mt-3">
                                <textarea style=" heigth: 300px;" placeholder="Enter Category Description" class="form-control"  name="catDescription" required >
                                    
                                </textarea>
                            </div>
                            <div class="container text-center mt-3">
                                <button type="submit" class="btn btn-outline-success">Add Category</button>
                                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                            </div>
                        </form>
                    </div>

                </div>
            </div>
        </div>

        <!--add category end-->


        <!--*****************************************************************************************-->

        <!--add product start-->

        <div class="modal fade" id="add-product-modal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog ">
                <div class="modal-content">
                    <div class="modal-header custom-bg text-white">
                        <h1 class="modal-title fs-5" id="exampleModalLabel">Enter Product Details</h1>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">

                        <form action="ProductOperationServlet" method="post" enctype="multipart/form-data">
                            <input type="hidden" name="operation" value="addproduct" />

                            <div class="form-group">
                                <input type="text" class="form-control" name="pName" placeholder="Enter Title of product" required />
                            </div>
                            <div class="form-group mt-3">
                                <textarea   placeholder="Enter product description" class="form-control"  name="pDesc" required >
                                    
                                </textarea>
                            </div>
                            <div class="form-group mt-3">
                                <input type="number" class="form-control" name="pPrice" placeholder="Enter Price of product" required />
                            </div>
                            <div class="form-group mt-3">
                                <input type="number" class="form-control" name="pDiscount" placeholder="Enter product discount" required />
                            </div>


                            <div class="form-group mt-3">
                                <input type="number" class="form-control" name="pQuantity" placeholder="Enter product quantity" required />
                            </div>

                            <!--product category-->


                            <div class="form-group mt-3">
                                <select name="catId" class="form-control" >

                                    <%  for (Category c : list) {
                                    %>
                                    <option value="<%= c.getCategoryId()%>"><%= c.getCategoryTitle()%></option>

                                    <% }%>

                                </select>

                            </div>

                            <div class="form-group mt-3">
                                <label for="pPic">Select Picture of Product</label>
                                <input type="file" class="mt-1" id="pPic" name="pPic" required />


                            </div>

                            <div class="container text-center mt-3 mb-3">
                                <button class="btn btn-outline-success">Add Product</button>
                            </div>


                            <div class="modal-footer">
                                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>

                            </div>
                        </form>
                    </div>

                </div>
            </div>
        </div>

        <!--add product ends-->
        
        

    </body>
</html>
